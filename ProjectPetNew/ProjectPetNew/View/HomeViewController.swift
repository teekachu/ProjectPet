//
//  HomeViewController.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 2/12/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK - IB Properties
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var officeHourLabel: UILabel!
    @IBOutlet weak var petsTableview: UITableView!
    
    @IBAction func chatButtonTapped(_ sender: Any) {
        print("chat")
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
        print("call")
    }
    
    
    // MARK - Properties
    private var workHour = "loading ..."
    private var petsData = [pet]()
//    private let petTableCellIdentifier = "CustomTableViewCell"
    
    
    // MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        applyViewModelsToButton()
        parseJsonForOfficeHour()
        
        parsePetsJson()
        
        configureTableView()
    }
    
    
    // MARK - Privates
    private func configureUI(){
        
        chatButton.backgroundColor = .systemBlue
        callButton.backgroundColor = .systemGreen
        
        officeHourLabel.configureElementUi(cornerRadius: 0, borderColor: .lightGray)
        callButton.configureElementUi(cornerRadius: 8, borderColor: .lightGray)
        chatButton.configureElementUi(cornerRadius: 8, borderColor: .lightGray)
    }
    
    
    private func configureTableView(){
        petsTableview.delegate = self
        petsTableview.dataSource = self
        petsTableview.register(PetTableViewCell.self, forCellReuseIdentifier: PetTableViewCell.petTableCellIdentifier)
    }
    
    private func applyViewModelsToButton(){
        // show or hide based on work hours
    }
    
    private func parseJsonForOfficeHour(){
        // work schedule
        JsonParsingManager.shared.parseJson {[weak self] (result) in
            
            switch result {
            case .failure(let err):
                print("Debug parseJsonForOfficeHour(): \(err), \(err.localizedDescription)")
                let ac = UIAlertController().showControllerWith(title: "Oh - oh", body: "Something went wrong..")
                self?.present(ac, animated: true)
                
            case .success(let msg):
                self?.workHour = msg
                self?.officeHourLabel.text = "Office Hours: " + self!.workHour
            }
        }
    }
    
    private func parsePetsJson(){
        JsonParsingManager.shared.parsePetsJson {[weak self] (result) in
            switch result {
            case .failure(let err):
                print("Debug parsePetsJson(): \(err), \(err.localizedDescription)")
                let ac = UIAlertController().showControllerWith(title: "Oh - oh", body: "Something went wrong..")
                self?.present(ac, animated: true)
                
            case .success(let pets):
                self?.petsData = pets
            }
        }
    }
    
}


//// MARK - TableViewDelegates
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PetTableViewCell.petTableCellIdentifier, for: indexPath) as! PetTableViewCell
        
        let eachPet = petsData[indexPath.row]
        
        // actually calls the pet function inside tableview cell
        (cell as configurePetTableviewCell ).set(petInfo: eachPet)
        
        return cell
    }
    
}


// MARK - Ext+UIView
extension UIView {
    func configureElementUi(cornerRadius:CGFloat, borderColor: UIColor){
        self.layer.cornerRadius = cornerRadius
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = 1.5
    }
}

extension UIAlertController {
    
    func showControllerWith(title: String, body: String) -> UIAlertController {
        let ac = UIAlertController(title: title, message: body, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Dismiss", style: .cancel)
        ac.addAction(cancel)
        return ac
    }
}


