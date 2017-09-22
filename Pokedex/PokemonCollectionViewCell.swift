//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Annie Tang on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    
    let grayBlue = UIColor(red:0.58, green:0.67, blue:0.75, alpha:1.0)
    let lightGrayBlue = UIColor(red:0.83, green:0.86, blue:0.88, alpha:1.0)
    let darkGray = UIColor(red:0.17, green:0.25, blue:0.30, alpha:1.0)
 
    var pokemonObject: Pokemon!
    var pokePic: UIImageView = UIImageView(image: #imageLiteral(resourceName: "pokeball"))
    var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNameLabel()
        setupPokePic()
    }
    
    func setupNameLabel() {
        nameLabel = UILabel(frame: CGRect(x: contentView.frame.width * 0.05, y: contentView.frame.width * 0.85, width: contentView.frame.width * 0.9 , height: contentView.frame.height * 0.15))
        nameLabel.textColor = darkGray
        nameLabel.textAlignment = .center
        nameLabel.font = nameLabel.font.withSize(10)
        contentView.addSubview(nameLabel)
        
        nameLabel.layer.zPosition = 1
        nameLabel.layer.cornerRadius = 1
        nameLabel.layer.backgroundColor = lightGrayBlue.cgColor
    }
    
    func setupPokePic() {
        pokePic = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.width, height: contentView.frame.height))
        pokePic.contentMode = .scaleAspectFit
        pokePic.clipsToBounds = true
        contentView.addSubview(pokePic)
        

    }
}
