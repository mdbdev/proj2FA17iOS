//
//  TypesTableViewCell.swift
//  Pokedex
//
//  Created by Nikita Ashok on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class TypesTableViewCell: UITableViewCell {
    var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        typeLabel = UILabel(frame: CGRect(x: 20, y: contentView.frame.height * (1/4), width: 150, height: contentView.frame.height * (1/2)))
        typeLabel.textColor = UIColor.black
        contentView.addSubview(typeLabel)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}


