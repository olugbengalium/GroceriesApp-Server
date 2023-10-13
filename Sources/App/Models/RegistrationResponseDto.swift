//
//  File.swift
//  
//
//  Created by apple on 10/13/23.
//

import Vapor
struct RegisterResponseDto: Content{
    let error: Bool
    var reason: String? = nil
}
