//
//  File.swift
//  
//
//  Created by Jason Hoffman on 4/29/21.
//

import Fluent

struct Coordinate: Codable {
    var lat: Double
    var long: Double
}

struct CreateLocation: Migration {

    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("locations")
            .id()
            .field("street", .string, .required)
            .field("city", .string, .required)
            .field("state", .string, .required)
            .field("zip", .string, .required)
            .field("lat", .double, .required)
            .field("lon", .double, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
      database.schema("locations").delete()
    }
}
