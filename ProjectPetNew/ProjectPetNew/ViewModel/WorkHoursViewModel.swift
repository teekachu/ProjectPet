//
//  WorkHoursViewModel.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 2/12/21.
//

import UIKit

protocol JSONParsedForSchedule {
    var enableButtonWithinWorkHours: Bool {get}
}

struct WorkhoursViewModel: JSONParsedForSchedule{
    
    // var time
    var workHoursPerJson: Int
    var isEnabled: Bool
    
//    var parseJsonForSchedue: String {
//        var parsedString = ""
//        
//        let urlString = "https://raw.githubusercontent.com/teekachu/ProjectPet.Old/master/config.json"
//        if let url = URL(string: urlString) {
//            if let data = try? Data(contentsOf: url) {
//                
//                let decoder = JSONDecoder()
//                
//                do{
//                    let decodedTime = try? decoder.decode(settings.self, from: data)
//                    
//                } catch {
//                    
//                }
//                
//            }
//        }
//        
//        return parsedString
//    }
   
    // return true or false to compare time now to the time in JSON and whether it is work hours right now
    var enableButtonWithinWorkHours: Bool
//        return true
//    }
    
    
}


