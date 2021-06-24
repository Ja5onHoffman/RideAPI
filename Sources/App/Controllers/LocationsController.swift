//
//  File.swift
//  
//
//  Created by Jason Hoffman on 6/20/21.
//

import Vapor
import Fluent

struct LocationsController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let locationsRoutes = routes.grouped("v0", "locations")
    
        locationsRoutes.get(use: getAll)
        locationsRoutes.post(use: createLocation)
    }
    
    func getAll(_ req: Request) -> EventLoopFuture<[Location]> {
        Location.query(on: req.db).all()
    }
    
    func createLocation(_ req: Request) throws -> EventLoopFuture<Location> {
        let data = try req.content.decode(CreateLocationData.self)
        let location = try Location(
            street: data.street,
            city: data.city,
            state: data.state,
            zip: data.zip,
            lat: data.lat,
            lon: data.long)
        
        return location.save(on: req.db).map { location }
    }
    
    
}

struct CreateLocationData: Content {
    let street: String
    let city: String
    let state: String
    let zip: String
    let lat: Double
    let long: Double
}
