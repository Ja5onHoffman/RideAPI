import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let clubsController = ClubsController()
    let contactsController = ContactsController()
    try app.routes.register(collection: clubsController)
    try app.routes.register(collection: contactsController)

    try app.register(collection: TodoController())
}
