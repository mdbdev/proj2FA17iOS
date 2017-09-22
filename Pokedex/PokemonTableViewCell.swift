//
//  PokemonTableViewCell.swift
//  Pokedex
//
//  Created by Annie Tang on 9/20/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    
    var pokemonObject: Pokemon!
    // how to get pokemon? do that PokemonTableViewCell.pokemonObject = something thing like fruitVC
    var pokePic: UIImageView! = UIImageView(image: #imageLiteral(resourceName: "pokeball"))
    
    var nameLabel: UILabel!
    var numberLabel: UILabel!
    
    //When do you think this is called?
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpImageView()
        setUpNameLabel()
        setUpNumberLabel()
    }
    
    func setUpImageView() {
        pokePic = UIImageView(frame: CGRect(x: 0, y: 0, width: contentView.frame.height, height: contentView.frame.height))
        pokePic.contentMode = .scaleAspectFill
        pokePic.clipsToBounds = true
        contentView.addSubview(pokePic)
    }
    
    func setUpNameLabel() {
        nameLabel = UILabel(frame: CGRect(x: contentView.frame.height * 1.2, y: 0, width: contentView.frame.width - contentView.frame.height * 1.2, height: contentView.frame.height * 0.7))
        nameLabel.textColor = UIColor.black
        nameLabel.textAlignment = .left
        nameLabel.font = nameLabel.font.withSize(18)
        contentView.addSubview(nameLabel)

    }
    
    func setUpNumberLabel() {
        numberLabel = UILabel(frame: CGRect(x: contentView.frame.height * 1.2, y: contentView.frame.height * 0.25, width: contentView.frame.width * 0.5, height: contentView.frame.height * 0.8))
        numberLabel.textColor = UIColor.lightGray
        numberLabel.textAlignment = .left
        numberLabel.font = nameLabel.font.withSize(14)
        contentView.addSubview(numberLabel)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
}
