//
//  File.swift
//  
//
//  Created by Jason Hoffman on 4/13/21.
//

import Fluent
import Vapor

final class Contact: Model, Content {
    static let schema = "contact"
    
    @ID
    var id: UUID?
    
    @Field(key: "firstName")
    var firstName: String
    
    @Field(key: "lastName")
    var lastName: String
    
    @Field(key: "phone")
    var phone: String
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "website")
    var website: String
    
    @Parent(key: "clubID")
    var club: Club
    
    init() { }
    
    init(id: UUID? = nil, firstName: String, lastName: String, phone: String, email: String, website: String, clubID: Club.IDValue) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.phone = phone
        self.email = email
        self.website = website
        self.$club.id = clubID
    }
}


/*
 Contact
 
 First name
 Last name
 phone number
 email
 instagram
 website
 Club
 
 */
