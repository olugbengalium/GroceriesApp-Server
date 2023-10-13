import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) async throws {
    app.databases.use(.postgres(configuration: SQLPostgresConfiguration(hostname: "localhost",port: 5422, username: "postgres", password: "master22", database: "grocerydb", tls: .prefer(try .init(configuration: .clientDefault)))), as: .psql)
//    app.databases.use(.postgres(hostname: "localhost",port: 5422, username: "postgres", password: "master22", database: "grocerydb"), as: .psql)
    app.migrations.add(CreateUserTableMigration())
    try app.register(collection: UserController())
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))
    // register routes
    try routes(app)
}
