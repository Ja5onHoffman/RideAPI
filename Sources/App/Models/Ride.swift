//
//  File.swift
//  
//
//  Created by Jason Hoffman on 4/13/21.
//

import Fluent
import Vapor

final class Ride: Model, Content {
    
    static let schema = "rides"
    
    @ID
    var id: UUID?
    
    @Field(key: "rideName")
    var rideName: String
    
    @Field(key: "date")
    var date: Date // Convert back and forth? Includes times.
    
    @Field(key: "recurring")
    var recurring: DateInterval
    
    @OptionalChild(for: \.$ride)
    var location: Location?

    @Field(key: "type")
    var type: String
    
    init() {}
    
    init(id: UUID? = nil, name: String, date: Date, recurring: DateInterval, location: Location, type: String) {
        self.rideName = name
        self.date = date
        self.recurring = recurring
        self.location = location
        self.type = type
    }
}

/*
 Ride
 
 Name
 Date
 Time
 Recurring every - tuple with boolean, and interval?
 Location
 Type - Group ride, race, gravel, stage race, etc. (allow multiple)
 
 
 
 
 
 */
