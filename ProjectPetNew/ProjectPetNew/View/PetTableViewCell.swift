//
//  TableViewCell.swift
//  ProjectPetNew
//
//  Created by Ting Becker on 2/12/21.
//

import UIKit

protocol configurePetTableviewCell {
    func set(petInfo: pet)
}

class PetTableViewCell: UITableViewCell {
    
    // MARK: - IB-Properties
    @IBOutlet weak var petImageview: UIImageView!
    @IBOutlet weak var petNameLabel: UILabel!
    
    @IBOutlet var contentView: UIView!
    
    // MARK: - Properties
    static let petTableCellIdentifier = "CustomTableViewCell"
    
    //    // MARK: - Lifecycle
    //    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    //        super.init(style: style, reuseIdentifier: reuseIdentifier)
    //
    //    }
    //
    //    required init?(coder: NSCoder) {
    //        fatalError("init(coder:) has not been implemented")
    //    }
    
}

extension PetTableViewCell: configurePetTableviewCell {
    func set(petInfo: pet) {
        // URL from string -> wrap it in data(contents of: )
        if let imageData = try? Data(contentsOf: URL(string: petInfo.image_url)!) {
            print(imageData)
            
            //            petImageview.image = UIImage(data: imageData)
        }
        
        //        self.petNameLabel.text = petInfo.title
    }
}
