//
//  User.swift
//  SwapHouse
//
//  Created by Cansu Özdizlekli on 3/19/24.
//

import Foundation

struct User {
    let id: Int
    let username: String
    let fullName: String
    let gender: String
    let birthDate: Date
    let photoURL: URL
    let phoneNumber: String
    let advertisements : [Advertisement]
    let favoriteAds : [Advertisement]
    let matchedAds : [Advertisement]
}
