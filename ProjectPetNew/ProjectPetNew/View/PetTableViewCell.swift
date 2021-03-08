//
//  TableViewCell.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 2/12/21.
//

import UIKit

class PetTableViewCell: UITableViewCell {
    
    // MARK: - IB-Properties
    
    @IBOutlet weak var petImageview: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    
    // MARK: - Properties
    static let petTableCellIdentifier = "CustomTableViewCell"
    
    func set(petInfo: pet) {
        // URL from string -> wrap it in data(contents of: )
        if let imageData = try? Data(contentsOf: URL(string: petInfo.image_url)!) {
            petImageview.image = UIImage(data: imageData)
        }
        
        self.petNameLabel.text = petInfo.title
    }
}

