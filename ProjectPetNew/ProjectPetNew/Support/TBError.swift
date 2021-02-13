//
//  TBError.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 2/12/21.
//

import Foundation

enum TBError: String, Error {
    case parsingScheduleError = "Debug: Parsing error in JSONParsingManager for work hours"
    
    case parsingPetsError = "Debug: Parsing error in JSONParsingManager for pets"
}
