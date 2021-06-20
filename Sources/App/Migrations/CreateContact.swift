
import Fluent


struct CreateContact: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("contacts")
            .id()
            .field("firstName", .string, .required)
            .field("lastName", .string, .required)
            .field("phone", .string)
            .field("email", .string, .required)
            .field("website", .string)
            .field("clubID", .uuid, .references("club", "id"))
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
      database.schema("contacts").delete()
    }
}

