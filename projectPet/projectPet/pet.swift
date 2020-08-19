//
//  pet.swift
//  projectPet
//
//  Created by Ting Becker on 8/17/20.
//  Copyright © 2020 TeeksCode. All rights reserved.
//

import Foundation

struct Pets: Codable{
    var pets: [pet]
}

struct pet: Codable{
    var image_url: String
    var title: String
    var content_url: String
    var date_added: String
}

struct Setting: Codable{
    var settings: setting
}
struct setting: Codable{
    var isChatEnabled: Bool
    var isCallEnabled: Bool
    var workHours: String
}
