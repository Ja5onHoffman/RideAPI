//
//  File.swift
//  
//
//  Created by Jason Hoffman on 4/29/21.
//

import Vapor
import Fluent


struct ClubsController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let clubRoutes = routes.grouped("v0", "clubs")
        clubRoutes.get(use: getAll)
        clubRoutes.post(use: createClub)
    }
    
    func getAll(_ req: Request) -> EventLoopFuture<[Club]> {
        Club.query(on: req.db).all()
    }
    
    func createClub(_ req: Request) throws -> EventLoopFuture<Club> {
        let data = try req.content.decode(Club.self)
        let club = try Club(name: data.name, type: data.type, website: data.website)
        return club.save(on: req.db).map { club }
    }
}


//struct CreateClubData: Content {
//    let name: String
//    let type: String
//    let website: URL
//}
