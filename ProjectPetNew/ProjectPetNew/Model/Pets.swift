//
//  Pets.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 2/12/21.
//

import Foundation


struct Pets: Codable {
    var pets: [pet]
}

struct pet: Codable {
    var image_url: String
    var title: String
    var content_url: String
    var date_added: String
}
