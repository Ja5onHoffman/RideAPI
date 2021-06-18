//
//  File.swift
//  
//
//  Created by Jason Hoffman on 4/29/21.
//

import Fluent

struct CreateRide: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("rides")
            .id()
            .field("rideName", .string, .required)
            .field("date", .date, .required)
            .field("recurring", .bool, .required)
            .field("type", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
      database.schema("rides").delete()
    }
}
