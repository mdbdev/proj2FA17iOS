//
//  PokemonViewController.swift
//  Pokedex
//
//  Created by Annie Tang on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit
import ObjectMapper

class PokemonProfileViewController: UIViewController {
    
    let grayBlue = UIColor(red:0.58, green:0.67, blue:0.75, alpha:1.0)
    let lightGrayBlue = UIColor(red:0.83, green:0.86, blue:0.88, alpha:1.0)
    let darkGray = UIColor(red:0.17, green:0.25, blue:0.30, alpha:1.0)
    
    var p: Pokemon!
    
    var pokemonImage: UIImage!
    var pokemonImageView: UIImageView!
    var nameLabel: UILabel!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupImage()
        setupNameAndNumber()
        setUpStatisticsLabels()
        addSearchButton()
        addFavoriteButton()
    }
    
    func setupImage() {
        pokemonImageView = UIImageView(frame:
            CGRect(x: view.frame.width * 0.1,
                   y: view.frame.width * 0.25,
                   width: view.frame.width * 0.8,
                   height: view.frame.width * 0.5))
        pokemonImageView.image = pokemonImage
        pokemonImageView.contentMode = .scaleAspectFit
        pokemonImageView.clipsToBounds = true
        view.addSubview(pokemonImageView)
        
        Utils.getImage(url: p.imageUrl) { img in
            self.pokemonImageView.image = img
        }
        if pokemonImageView.image == nil {
            pokemonImageView.image = #imageLiteral(resourceName: "pokeball")
        }
    }
    
    func setupNameAndNumber() {
        let nameLabel = UILabel(frame:
            CGRect(x: view.frame.width * 0.1,
                   y: view.frame.width * 0.67,
                   width: view.frame.width * 0.8,
                   height: view.frame.height * 0.2))
        nameLabel.text = p.name
        nameLabel.textColor = UIColor.darkGray
        nameLabel.textAlignment = .left
        nameLabel.font = nameLabel.font.withSize(20)
        view.addSubview(nameLabel)
        
        let numberLabel = UILabel(frame:
            CGRect(x: view.frame.width * 0.1,
                   y: view.frame.width * 0.67,
                   width: view.frame.width * 0.8,
                   height: view.frame.height * 0.2))
        numberLabel.text = " # " + String(p.number)
        numberLabel.textColor = .lightGray
        numberLabel.textAlignment = .right
        numberLabel.font = numberLabel.font.withSize(14)
        view.addSubview(numberLabel)
    }
    
    func setUpStatisticsLabels() {
        var labels: [UILabel] = []
        let labelsNames: [String] = ["Attack", "Defense", "Health", "Special Attack", "Special Defense", "Species", "Speed", "Total", "Type"]
        
        let info: [String] = [String(p.attack), String(p.defense), String(p.health), String(p.specialAttack), String(p.specialDefense), p.species, String(p.speed), String(p.total)]
        
        var OFFSET_Y: CGFloat = 0.43
        for i in 0...(labelsNames.count - 1) {
            let label = UILabel(frame:
                CGRect(x: view.frame.width * 0.1,
                       y: view.frame.height * OFFSET_Y,
                       width: view.frame.width * 0.8,
                       height: view.frame.height * 0.2))
            labels.append(label)
            
            let info = grabInfo(index: i, infoArr: info, types: p.types)
            
            label.text = labelsNames[i] + ": " + info
            label.textColor = .darkGray
            label.textAlignment = .left
            label.font = label.font.withSize(15)
            view.addSubview(label)
            OFFSET_Y += 0.035
        }
    }
    
    func addSearchButton() {
        let searchButton = UIButton(frame:
            CGRect(x: view.frame.width * 0.1,
                   y: view.frame.height * 0.85,
                   width: view.frame.width * 0.35,
                   height: view.frame.height * 0.08))
        searchButton.layer.cornerRadius = 3
        searchButton.backgroundColor = lightGrayBlue
        searchButton.setTitle("Web Search", for: .normal)
        searchButton.setTitleColor(darkGray, for: .normal)
        searchButton.titleLabel?.font = UIFont(name: (searchButton.titleLabel?.font.fontName)!, size: 14)
        searchButton.addTarget(self, action: #selector(searchGoogle), for: .touchUpInside)
        
        view.addSubview(searchButton)
    }
    
    func addFavoriteButton() {
        let favoriteButton = UIButton(frame:
            CGRect(x: view.frame.width * 0.55,
                   y: view.frame.height * 0.85,
                   width: view.frame.width * 0.35,
                   height: view.frame.height * 0.08))
        favoriteButton.layer.cornerRadius = 3
        favoriteButton.backgroundColor = lightGrayBlue
        favoriteButton.setTitle("Add to Favorites", for: .normal)
        favoriteButton.setTitleColor(darkGray, for: .normal)
        favoriteButton.titleLabel?.font = UIFont(name: (favoriteButton.titleLabel?.font.fontName)!, size: 14)
        favoriteButton.addTarget(self, action: #selector(addToFavorites), for: .touchUpInside)
    
        view.addSubview(favoriteButton)
    }
    
    func addToFavorites() {
        /*
        if UserDefaults.standard.object(forKey: p.name) as? NSData == nil {
            UserDefaults.standard.set(p, forKey: p.name)
            print("successful")
        }
        */
        
        /*
         if UserDefaults.standard.object(forKey: "favoritesArr") == nil {
            var favorites: [Pokemon] = [p]
            var encodedFavorites = NSKeyedArchiver.archivedData(withRootObject: favorites)
            UserDefaults.standard.set(encodedFavorites, forKey: "favoritesArr")
        } else {
            var currentEncodedFavorites = UserDefaults.standard.object(forKey: "favoritesArr")
            var decodedFavorites = NSKeyedUnarchiver.unarchiveObject(with: currentEncodedFavorites as! Data) as? [Pokemon]
            decodedFavorites!.append(p)
            
            var newEncodedFavorites = NSKeyedArchiver.archivedData(withRootObject: decodedFavorites)
            UserDefaults.standard.set(newEncodedFavorites, forKey: "favoritesArr")
 
        }
         */
        var jsonifiedP = p.toJSONString()
        
        if userDefaults.object(forKey: "favoritesArray") == nil {
            var favorites: [String] = [jsonifiedP!]
            userDefaults.set(favorites, forKey: "favoritesArray")
            print("howdy")
        } else {
            var jsonifiedPokemon = userDefaults.array(forKey: "favoritesArray") as! [String]
            jsonifiedPokemon.append(jsonifiedP!)
            userDefaults.set(jsonifiedPokemon, forKey: "favoritesArray")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWebView" {
            let webView = segue.destination as! GoogleSearchWebViewController
            webView.pokeName = p.name
        }
    }
    
    
    
    func searchGoogle() {
        performSegue(withIdentifier: "segueToWebView", sender: self)
    }
    
    /* helper function to create a string with all of the pokemon's types */
    func grabInfo(index: Int!, infoArr: [String], types: [String]) -> String {
        var info: String = ""
        let delimiter: String = ", "
        if index == infoArr.count {
            for i in 0...(types.count - 1) {
                if i == (types.count - 1) {
                    info += types[i]
                } else {
                    info = info + types[i] + delimiter
                }
            }
        } else {
            info = infoArr[index]
        }
        return info
    }
}
