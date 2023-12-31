//
//  File.swift
//  
//
//  Created by apple on 10/13/23.
//

import Foundation
import Fluent
import Vapor

class UserController: RouteCollection{
    func boot(routes: Vapor.RoutesBuilder) throws {
        let api = routes.grouped("api")
        api.post("register", use: register)
    }
    
    func register(req: Request) async throws -> RegisterResponseDto{
        try User.validate(content: req)
        let user = try req.content.decode(User.self)
        if let _ = try await User.query(on: req.db)
            .filter(\.$username == user.username)
            .first(){
            throw Abort(.conflict, reason: "username already existed.!")
        }
        // if user is valid hash the password
        user.password = try await req.password.async.hash(user.password)
        try await user.save(on: req.db)
        return RegisterResponseDto(error: false)
    }
}
