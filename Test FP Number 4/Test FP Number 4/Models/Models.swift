//
//  Models.swift
//  Test FP number 3
//
//  Created by Ваня Науменко on 8.06.22.
//

import Foundation

//struct User: Codable {
//    let id: Int
//    let name: String?
//    let username: String?
//    let email: String?
//}

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String?
    let body: String?
}
struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String?
    let email: String?
    let body: String?
}
