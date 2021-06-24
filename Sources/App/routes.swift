import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let clubsController = ClubsController()
    let contactsController = ContactsController()
    let locationsController = LocationsController()
    let ridesController = RidesController()
    
    try app.routes.register(collection: clubsController)
    try app.routes.register(collection: contactsController)
    try app.routes.register(collection: ridesController)
    try app.routes.register(collection: locationsController)
}
