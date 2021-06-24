//
//  File.swift
//  
//
//  Created by Jason Hoffman on 4/29/21.
//

import Fluent

struct CreateClub: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("club")
            .id()
            .field("name", .string, .required)
            .field("type", .string, .required)
            .field("website", .string, .required)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
      database.schema("club").delete()
    }
}


