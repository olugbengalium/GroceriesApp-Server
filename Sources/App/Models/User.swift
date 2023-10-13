//
//  File.swift
//
//
//  Created by apple on 10/13/23.
//

import Vapor
import Fluent
final class User: Model,Content, Validatable{
    static func validations(_ validations: inout Vapor.Validations) {
        validations.add("username", as: String.self, is: !.empty, customFailureDescription: "Username cannot be empty")
        validations.add("password", as: String.self, is: !.empty, customFailureDescription: "Password cannot be empty")
        validations.add("password", as: String.self, is: .count(6...20), customFailureDescription: "Password length must be between 6 to 20 characters")
    }
    
    static var schema: String = "users"
    @ID(key: .id)
    var id: UUID?
    @Field(key: "username")
    var username: String
    @Field(key: "password")
    var password: String
    init(){}
    init(id: UUID? = nil, username: String, password: String) {
        self.id = id
        self.username = username
        self.password = password
    }
}
