import Fluent
import Vapor

func routes(_ app: Application) throws {
    
    let clubsController = ClubsController()
    try app.routes.register(collection: clubsController)

    try app.register(collection: TodoController())
}
