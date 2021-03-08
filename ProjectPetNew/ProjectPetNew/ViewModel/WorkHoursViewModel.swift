//
//  WorkHoursViewModel.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 2/12/21.
//

import UIKit

struct WorkhoursViewModel {
    
    func enableCallButton() -> Bool {
        var callStatus: Bool?
        
        JsonParsingManager.shared.parseJson {(result) in
            switch result {
            case .failure(let err):
                print("Debug WorkhoursViewModel() - \(err.localizedDescription)")
                
            case .success(let settings):
                // enable or disable buttons as appropriate
                callStatus = settings.isCallEnabled
            }
        }
        
        //default is false
        return callStatus ?? false
    }
    
    
    func enableChatButton() -> Bool {
        var chatStatus: Bool?
        
        // figure out the workhour
        JsonParsingManager.shared.parseJson { (result) in
            switch result {
            case .failure(let err):
                print("Debug WorkhoursViewModel() - \(err.localizedDescription)")
                
            case .success(let settings):
                // enable or disable buttons as appropriate
                chatStatus = settings.isChatEnabled
            }
        }
        
        //default is false
        return chatStatus ?? false
    }
    
    
    func fetchCurrentDate() -> (Int, Int) {
        let date = Date()
        let calendar = Calendar.current
        let week = calendar.component(.weekday, from: date) - 1
        let hour = calendar.component(.hour, from: date)
        
        return (week,hour)
    }
    
    
    func parseCurrentTime() -> String {
        // figure out currentTime
        let week = fetchCurrentDate().0
        let hour = fetchCurrentDate().1
        
        // returns the appropriate message
        if week < 5 && hour > 9 || hour < 18 {
            return "Thank you for getting in touch with us. We’ll get back to you as soon as possible"
        } else {
            return "Work hours has ended. Please contact us again on the next work day"
        }
        
    }
}
