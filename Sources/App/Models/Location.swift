//
//  File.swift
//  
//
//  Created by Jason Hoffman on 4/14/21.
//

import Vapor
import Fluent
import Foundation
import CoreLocation

final class Location: Model, Content {
    static let schema = "locations"
    
    @ID
    var id: UUID?
    
    @Field(key: "street")
    var street: String
    
    @Field(key: "city")
    var city: String
    
    @Field(key: "state")
    var state: String
    
    @Field(key: "zip")
    var zip: String
    
    @Field(key: "lat")
    var lat: Double
    
    @Field(key: "long")
    var long: Double
    
    @OptionalParent(key: "ride")
    var ride: Ride?
    
    init() {}
    
    init(id: UUID? = nil, street: String, city: String, state: String, zip: String, lat: Double, long: Double, ride: Ride?) {
        self.street = street
        self.city = city
        self.state = state
        self.zip = zip
        self.lat = lat
        self.long = long
        self.ride = ride
    }
    
}
