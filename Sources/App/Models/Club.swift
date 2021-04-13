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
        
    @Field(key: "contact")
    var contact: Contact
    
    @Field(key: "website")
    var website: URL
    
    init() { }
    
    init(id: UUID? = nil, name: String, type: String, contact: Contact, website: URL) {
        self.name = name
        self.type = type
        self.contact = contact
        self.website = website
    }
}




/*
 Club
 
 Name
 Type - Shop, Club, Team, Event
 Contact - Own model
 Website
 
 
 
 
 
 
 */
