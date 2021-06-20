//
//  File.swift
//  
//
//  Created by Jason Hoffman on 4/13/21.
//

import Fluent
import Vapor

final class Club: Model, Content {
    static let schema = "club"
    
    @ID
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "type")
    var type: String
    
    @Field(key: "website")
    var website: URL
    
    @Children(for: \.$club)
    var contacts: [Contact]
    
    init() { }
    
    init(id: UUID? = nil, name: String, type: String, website: URL) {
        self.name = name
        self.type = type
        self.website = website
    }
}
