//
//  SearchTableViewCell.swift
//  Pokedex
//
//  Created by Nikita Ashok on 9/17/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    var nameLabel : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel = UILabel(frame: CGRect(x: 20, y: contentView.frame.height * (1/4), width: 150, height: contentView.frame.height * (1/2)))
        nameLabel.textColor = UIColor.black
        contentView.addSubview(nameLabel)
        
        
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
