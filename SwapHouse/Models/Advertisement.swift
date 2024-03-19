//
//  HouseAdvertisement.swift
//  SwapHouse
//
//  Created by Cansu Özdizlekli on 3/19/24.
//

import Foundation

struct Advertisement {
    let id: Int
    let title: String
    let description: String
    let ownerId: User
    let houseType : String
    let address: String
    let imageURL: [String]
    let rentAmount: Int
    let area: Float
    let yearBuilt : Int
    let numberOfRooms: Int
    let createdDate : String
    let availableDate : String
    let location : Location
}

