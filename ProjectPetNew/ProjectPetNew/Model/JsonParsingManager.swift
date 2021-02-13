//
//  JsonParsing.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 2/12/21.
//

import Foundation

class JsonParsingManager {
    
    // MARK: - Properties
    static let shared = JsonParsingManager()
    
    // MARK: - Lifecycle
    private init() {}
    
    // MARK: - Properties
    public func parseJson(completion: @escaping (Result<String,TBError>) -> Void) {
        
        let urlString = "https://raw.githubusercontent.com/teekachu/ProjectPet.Old/master/config.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                
                if let decodedTime = try? JSONDecoder().decode(Setting.self, from: data) {
                    completion(.success(decodedTime.settings.workHours))
                    
                } else {
                    completion(.failure(.parsingScheduleError))
                }
            }
        }
    }
    
    public func parsePetsJson(completion: @escaping (Result<[pet], TBError>) -> Void) {
        let urlString = "https://raw.githubusercontent.com/teekachu/ProjectPet.Old/master/pets.json"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                
                if let decodedPets = try? JSONDecoder().decode(Pets.self, from: data) {
                    completion(.success(decodedPets.pets))
                    
                } else {
                    completion(.failure(.parsingPetsError))
                }
            }
        }
    }
}
