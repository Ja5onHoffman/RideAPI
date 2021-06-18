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
            .field("street", .string, .required)
            .field("city", .string, .required)
            .field("state", .string, .required)
            .field("zip", .string, .required)
//            .field("coordinates", .custom(Coordinate.self), .required)
//            .field("coordinates", .custom([Double, Double]()), .required)
//            .field("coordinates", .array(of: Double)), .required)
            .field("lat", .double, .required)
            .field("long", .double, .required)
            .field("ride_id", .uuid, .required, .references("rides", "id"))
            .unique(on: "ride_id")
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
      database.schema("locations").delete()
    }
}
