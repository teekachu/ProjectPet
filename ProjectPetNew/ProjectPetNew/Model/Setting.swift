//
//  OfficeHourModel.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 2/12/21.
//

import Foundation

struct Setting:Codable {
    var settings: settings
}

struct settings: Codable {
    var isChatEnabled: Bool
    var isCallEnabled: Bool
    var workHours: String
}
