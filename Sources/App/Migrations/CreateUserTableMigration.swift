//
//  File.swift
//  
//
//  Created by apple on 10/13/23.
//

import Fluent
struct CreateUserTableMigration: AsyncMigration{
    func revert(on database: FluentKit.Database) async throws {
        try await database.schema("users")
            .delete()
    }
    
    func prepare(on database: FluentKit.Database) async throws {
        try await database.schema("users")
            .id()
            .field("username", .string, .required).unique(on: "username")
            .field("password", .string, .required)
            .create()
    }
    
    
}
