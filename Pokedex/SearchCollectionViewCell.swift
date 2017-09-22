//
//  SearchCollectionViewCell.swift
//  Pokedex
//
//  Created by Nikita Ashok on 9/17/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    var pokeImage: UIImageView!
    
    override func awakeFromNib() {
        pokeImage = UIImageView(frame: CGRect(x: contentView.frame.width * 0.15, y: contentView.frame.height * 0.15, width: contentView.frame.width * 0.7, height: contentView.frame.height * 0.7))
        pokeImage.contentMode = .scaleAspectFill
        contentView.addSubview(pokeImage)
    }

    
}
