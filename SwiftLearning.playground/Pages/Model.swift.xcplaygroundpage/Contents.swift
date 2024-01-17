//: [Previous](@previous)

import Foundation

struct Person: Codable {
    let firstName: String
    let lastName: String
    let gender: String
    let age: Int
    let address: Location
}

struct Location: Codable {
    let streetAddress: String
    let city: String
    let state: String
    let postCode: String
}
