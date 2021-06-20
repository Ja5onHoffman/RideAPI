//
//  File.swift
//  
//
//  Created by Jason Hoffman on 6/18/21.
//

import Vapor
import Fluent


struct ContactsController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let contactsRoutes = routes.grouped("v0", "contacts")
        contactsRoutes.get(use: getAll)
        contactsRoutes.post(use: createContact)
        
    }
    
    func getAll(_ req: Request) -> EventLoopFuture<[Contact]> {
        Contact.query(on: req.db).all()
    }
    
    func createContact(_ req: Request) throws -> EventLoopFuture<Contact> {
        let data = try req.content.decode(CreateContactData.self)
        let contact = try Contact(
            firstName: data.firstName,
            lastName: data.lastName,
            phone: data.phone,
            email: data.email,
            website: data.website,
            clubID: data.clubID
            )
        
        return contact.save(on: req.db).map { contact }
    }
}

struct CreateContactData: Content {
    let firstName: String
    let lastName: String
    let phone: String
    let email: String
    let website: String
    let clubID: UUID? 
}
