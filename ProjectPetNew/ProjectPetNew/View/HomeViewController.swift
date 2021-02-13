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
    
    @IBAction func chatButtonTapped(_ sender: Any) {
        print("chat")
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
        print("call")
    }
    // MARK - Properties
    
    
    
    // MARK - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        applyViewModelsToButton()
        parseJsonForOfficeHour()
    }
    
    
    // MARK - Privates
    private func configureUI(){
        
        chatButton.backgroundColor = .systemBlue
        callButton.backgroundColor = .systemGreen
        
        officeHourLabel.configureElementUi(cornerRadius: 0, borderColor: .lightGray)
        callButton.configureElementUi(cornerRadius: 8, borderColor: .lightGray)
        chatButton.configureElementUi(cornerRadius: 8, borderColor: .lightGray)
    }
    
    private func applyViewModelsToButton(){
        
    }
    
    private func parseJsonForOfficeHour(){
        
        // work schedule
        JsonParsingManager.shared.parseJson { (result) in
            switch result {
            case .failure(let err):
                print(err)
                
            case .success(let msg):
                print(msg)
            }
        }
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
