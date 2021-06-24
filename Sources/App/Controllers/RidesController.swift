//
//  File.swift
//  
//
//  Created by Jason Hoffman on 6/20/21.
//

import Vapor
import Fluent

struct RidesController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let ridesRoutes = routes.grouped("v0", "rides")
        ridesRoutes.get(use: getAll)
        ridesRoutes.post(use: createRide)
    }
    
    func getAll(_ req: Request) -> EventLoopFuture<[Ride]> {
        Ride.query(on: req.db).all()
    }
    
    func createRide(_ req: Request) throws -> EventLoopFuture<Ride> {
        let data = try req.content.decode(CreateRideData.self)
        
        let ride = Ride(
            name: data.rideName,
            date: data.date,
            recurring: data.recurring,
            type: data.type,
            locationID: data.locationID
            )
        
        return ride.save(on: req.db).map { ride }
    }
}

struct CreateRideData: Content {
    let rideName: String
    let date: Date
    let recurring: Bool
    let type: String
    let locationID: UUID?
}

