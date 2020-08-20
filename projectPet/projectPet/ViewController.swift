//
//  ViewController.swift
//  projectPet
//
//  Created by Ting Becker on 8/17/20.
//  Copyright © 2020 TeeksCode. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var myButtons = [UIButton]()
    let spacing: CGFloat = 15
    var allPets = [pet]()
    
    var callEnabled: Bool = false //default
    var chatEnabled: Bool = false //default
    var officeWorkHours: String = "" //default
    
    @IBOutlet var chatButton: UIButton!
    @IBOutlet var callButton: UIButton!
    @IBOutlet var officeHours: UILabel!
    @IBOutlet var petsInformation: UITableView!
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        //1 find the date via calendar and convert hour
        
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        if hour >= 9 && hour < 18 {
            alertWorkHours()
        } else {
            alertNoneWorkHours()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //         parsing config.json file
        
        let configURL = "https://raw.githubusercontent.com/teekachu/ProjectPet/master/config.json"
        
        if let configurl = URL(string: configURL){
            if let configContent = try? String(contentsOf: configurl){
                //                print(configContent)
                let configData = configContent.data(using: .utf16)!
                //                print(configData)
                let dataArray = try! JSONDecoder().decode(Setting.self, from: configData)
                
                //change layout of UI
                self.callEnabled = dataArray.settings.isCallEnabled
                self.chatEnabled = dataArray.settings.isChatEnabled
                self.officeWorkHours = dataArray.settings.workHours
                
            }
        }
        
        
        //parsing pets.JSON file
        
        let urlString = "https://raw.githubusercontent.com/teekachu/ProjectPet/master/pets.json"
        
        if let url = URL(string: urlString){
            if let contents = try? String(contentsOf: url){
                //                print(contents)
                
                let jsonData = contents.data(using: .utf16)!
                //                print(jsonData)
                
                let array: Pets = try! JSONDecoder().decode(Pets.self
                    , from: jsonData)
                //                print(array.pets)
                self.allPets += array.pets
            }
        }
        
        
        // UI for buttons and label
        chatButton.setTitle("Chat", for: .normal)
        
        callButton.setTitle("Call", for: .normal)
        
        myButtons += [chatButton, callButton]
        
        for buttons in myButtons{
            buttons.translatesAutoresizingMaskIntoConstraints = false
            buttons.setTitleColor(.white, for: .normal)
            buttons.layer.cornerRadius = 10
            buttons.titleLabel?.font = .systemFont(ofSize: 20)
        }
        
        officeHours.translatesAutoresizingMaskIntoConstraints = false
        officeHours.layer.borderWidth = 1
        officeHours.backgroundColor = .white
        officeHours.layer.borderColor = UIColor.lightGray.cgColor
        officeHours.text = "Office Hours: \(officeWorkHours)"
        officeHours.textAlignment = .center
        officeHours.font = .boldSystemFont(ofSize: 17)
        
        petsInformation.translatesAutoresizingMaskIntoConstraints = false
        
        // autolayout for buttons and label based on conditions
        
        if callEnabled == false && chatEnabled == true{
            //UI to show only chat button
            //DONE
            NSLayoutConstraint.activate([
                chatButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor
                    , constant: spacing),
                chatButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spacing),
                chatButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spacing),
                chatButton.heightAnchor.constraint(equalToConstant: 70),
                
                officeHours.leadingAnchor.constraint(equalTo: chatButton.leadingAnchor),
                officeHours.trailingAnchor.constraint(equalTo: chatButton.trailingAnchor),
                officeHours.topAnchor.constraint(equalTo: chatButton.bottomAnchor, constant: spacing),
                officeHours.heightAnchor.constraint(equalTo: chatButton.heightAnchor),
                
                petsInformation.leadingAnchor.constraint(equalTo: officeHours.leadingAnchor, constant: 0),
                petsInformation.trailingAnchor.constraint(equalTo: officeHours.trailingAnchor, constant: 0),
                petsInformation.topAnchor.constraint(equalTo: officeHours.bottomAnchor, constant: spacing),
                petsInformation.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
            
        } else if callEnabled == true && chatEnabled == false {
            //UI to show only call button
            
            NSLayoutConstraint.activate([
                callButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor
                    , constant: spacing),
                callButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spacing),
                callButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spacing),
                callButton.heightAnchor.constraint(equalToConstant: 70),
                
                officeHours.leadingAnchor.constraint(equalTo: callButton.leadingAnchor),
                officeHours.trailingAnchor.constraint(equalTo: callButton.trailingAnchor),
                officeHours.topAnchor.constraint(equalTo: callButton.bottomAnchor, constant: spacing),
                officeHours.heightAnchor.constraint(equalTo: callButton.heightAnchor),
                
                petsInformation.leadingAnchor.constraint(equalTo: officeHours.leadingAnchor, constant: 0),
                petsInformation.trailingAnchor.constraint(equalTo: officeHours.trailingAnchor, constant: 0),
                petsInformation.topAnchor.constraint(equalTo: officeHours.bottomAnchor, constant: spacing),
                petsInformation.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
            
        } else if callEnabled == false && chatEnabled == false {
            //UI to hide both buttons
            
            NSLayoutConstraint.activate([
                officeHours.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor
                    , constant: spacing),
                officeHours.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spacing),
                officeHours.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -spacing),
                officeHours.heightAnchor.constraint(equalToConstant: 70),
                
                petsInformation.leadingAnchor.constraint(equalTo: officeHours.leadingAnchor, constant: 0),
                petsInformation.trailingAnchor.constraint(equalTo: officeHours.trailingAnchor, constant: 0),
                petsInformation.topAnchor.constraint(equalTo: officeHours.bottomAnchor, constant: spacing),
                petsInformation.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
            
        } else {
            
            // show normal
            // both chat and call enabled and true
            
            NSLayoutConstraint.activate([
                chatButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor
                    , constant: spacing),
                chatButton.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor, constant: spacing),
                chatButton.widthAnchor.constraint(equalToConstant: 135),
                chatButton.heightAnchor.constraint(equalToConstant: 70),
                chatButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
                
                callButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: spacing),
                callButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
                callButton.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: -spacing),
                callButton.widthAnchor.constraint(equalTo: chatButton.widthAnchor),
                callButton.heightAnchor.constraint(equalTo: chatButton.heightAnchor),
                
                officeHours.leadingAnchor.constraint(equalTo: chatButton.leadingAnchor),
                officeHours.trailingAnchor.constraint(equalTo: callButton.trailingAnchor),
                officeHours.topAnchor.constraint(equalTo: chatButton.bottomAnchor, constant: spacing),
                officeHours.heightAnchor.constraint(equalTo: chatButton.heightAnchor),
                
                petsInformation.leadingAnchor.constraint(equalTo: officeHours.leadingAnchor, constant: 0),
                petsInformation.trailingAnchor.constraint(equalTo: officeHours.trailingAnchor, constant: 0),
                petsInformation.topAnchor.constraint(equalTo: officeHours.bottomAnchor, constant: spacing),
                petsInformation.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
            ])
        }
        
        //        // ORIGINAL location to parse pets.JSON file
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allPets.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let petsArray = allPets[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell
            else {
                fatalError("something went wrong with deque")
        }
        
        cell.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        DispatchQueue.global(qos: .userInitiated).async {
            if let imagesUrlString = URL(string: petsArray.image_url){
                cell.photo.downloadImage(from: imagesUrlString)
            }
        }
        
        //TODO: Fix image
        cell.imageView?.clipsToBounds = true
        cell.imageView?.layer.cornerRadius = 10
        cell.imageView?.sizeToFit()
        
        cell.labelName.text = petsArray.title
        cell.labelName.font = UIFont.systemFont(ofSize: 17)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let urlSelected = allPets[indexPath.row]
        
        if let vc = storyboard?.instantiateViewController(identifier: "detail") as? DetailViewController{
            vc.urlToLoad = urlSelected.content_url
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func alertWorkHours(){
        let ac = UIAlertController(title: "Hello", message: "Thank you for getting in touch with us. We’ll get back to you as soon as possible", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Dismiss Alert", style: .default))
        present(ac, animated: true)
    }
    
    func alertNoneWorkHours(){
        let ac = UIAlertController(title: "Hello", message: "Work hours has ended. Please contact us again on the next work day", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Dismiss Alert", style: .default))
        present(ac, animated: true)
    }
    
    
    
}
