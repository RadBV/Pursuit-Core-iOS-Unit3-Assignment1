//
//  UserInfo.swift
//  PeopleAndAppleStockPrices
//
//  Created by Radharani Ribas-Valongo on 9/6/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct UserWrapper: Codable {
    let results: [User]
}

struct User: Codable {
    let name: NameWrapper
    let location: LocationWrapper
    
    static func getUser(from data: Data) throws -> [User] {
        do {
            let user = try JSONDecoder().decode(UserWrapper.self, from: data)
            return user.results
        } catch {
            throw ErrorHandling.decodingError
        }
    }
}


struct LocationWrapper: Codable {
    let city: String
}

struct NameWrapper: Codable {
    var firstName: String
    var lastName: String
    
    private enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
}
