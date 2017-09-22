//
//  CategorySelectionViewController.swift
//  Pokedex
//
//  Created by Louie McConnell on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class CategorySelectionViewController: UIViewController {

    
    // UI
    // 
    //
    
    // labels
    var minAttackPointsLabel: UILabel!
    var minDefensePointsLabel: UILabel!
    var minHealthPointsLabel: UILabel!
    
    // sliders
    var attackPointsSlider: UISlider!
    var defensePointsSlider: UISlider!
    var healthPointsSlider: UISlider!
    
    // type selector button
    var typeButton: UIButton!
    var submitButton: UIButton!
    
    // Values
    //
    // 
    
    var minAttack = 10
    var maxAttack = 100
    var minDefense = 10
    var maxDefense = 100
    var minHealth = 10
    var maxHealth = 100
    
    var types: [String] = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Ice", "Electric", "Normal", "Fairy", "Poison", "Fighting", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water"]
    
    var results: [Pokemon]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Add in UI Elements
        addAttackLabel()
        addAttackSlider()
        addDefenseLabel()
        addDefenseSlider()
        addHealthLabel()
        addHealthSlider()
        addTypeButton()
        addSubmitButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSearchResults" {
            let searchResultsVC = segue.destination as! SearchResultsViewController
            searchResultsVC.results = self.results
            
        }
    }
    
    func addAttackLabel() {
        // UI
        minAttackPointsLabel = UILabel()
        minAttackPointsLabel.frame = CGRect(
            x: 20,
            y: 80,
            width: 250,
            height: 50
        )
        minAttackPointsLabel.text = "Minimum Attack Points: " + String(minAttack)
        minAttackPointsLabel.textAlignment = .left
        
        self.view.addSubview(minAttackPointsLabel)
    }
    
    func addAttackSlider() {
        // TODO: Determine the maximum and minimum values programatically.
        
        // get max value
        
        var pokeArray = PokemonGenerator.getPokemonArray()
        maxAttack = pokeArray.reduce(pokeArray[0], {
            ($0).attack > ($1).attack ? $0 : $1
        }).attack
        
        minAttack = pokeArray.reduce(pokeArray[0], {
            ($0).attack < ($1).attack ? $0 : $1
        }).attack
        
        // UI
        
        attackPointsSlider = UISlider()
        attackPointsSlider.frame = CGRect(
            x: 20,
            y: minAttackPointsLabel.frame.maxY,
            width: self.view.frame.width - 40,
            height: 50
        )
        attackPointsSlider.isContinuous = true
        attackPointsSlider.minimumValue = Float(minAttack)
        attackPointsSlider.maximumValue = Float(maxAttack)
        self.view.addSubview(attackPointsSlider)
        
        // Events
        attackPointsSlider.addTarget(self, action: #selector(attackSliderChanged), for: .valueChanged)
        
    }
    
    func addDefenseLabel() {
        
        
        // UI
        minDefensePointsLabel = UILabel()
        minDefensePointsLabel.frame = CGRect(
            x: 20,
            y: attackPointsSlider.frame.maxY + 20,
            width: 250,
            height: 50
        )
        minDefensePointsLabel.text = "Minimum Defense Points: " + String(minDefense)
        minDefensePointsLabel.textAlignment = .left
        
        self.view.addSubview(minDefensePointsLabel)
    }
    
    func addDefenseSlider() {
        
        var pokeArray = PokemonGenerator.getPokemonArray()
        
        maxDefense = pokeArray.reduce(pokeArray[0], {
            ($0).defense > ($1).defense ? $0 : $1
        }).defense
        
        minDefense = pokeArray.reduce(pokeArray[0], {
            ($0).defense < ($1).defense ? $0 : $1
        }).defense
        
        // UI
        defensePointsSlider = UISlider()
        defensePointsSlider.frame = CGRect(
            x: 20,
            y: minDefensePointsLabel.frame.maxY,
            width: self.view.frame.width - 40,
            height: 50
        )
        defensePointsSlider.isContinuous = true
        defensePointsSlider.minimumValue = Float(minDefense)
        defensePointsSlider.maximumValue = Float(maxDefense)
        self.view.addSubview(defensePointsSlider)
        
        // Events
        defensePointsSlider.addTarget(self, action: #selector(defenseSliderChanged), for: .valueChanged)
    }
    
    func addHealthLabel() {
        // UI
        minHealthPointsLabel = UILabel()
        minHealthPointsLabel.frame = CGRect(
            x: 20,
            y: defensePointsSlider.frame.maxY + 20,
            width: 250,
            height: 50
        )
        minHealthPointsLabel.text = "Minimum Health Points: " + String(minHealth)
        minHealthPointsLabel.textAlignment = .left
        
        self.view.addSubview(minHealthPointsLabel)
    }
    
    func addHealthSlider() {
        
        var pokeArray = PokemonGenerator.getPokemonArray()
        
        maxHealth = pokeArray.reduce(pokeArray[0], {
            ($0).health > ($1).health ? $0 : $1
        }).health
        
        minHealth = pokeArray.reduce(pokeArray[0], {
            ($0).health < ($1).health ? $0 : $1
        }).health

        
        // UI
        healthPointsSlider = UISlider()
        healthPointsSlider.frame = CGRect(
            x: 20,
            y: minHealthPointsLabel.frame.maxY,
            width: self.view.frame.width - 40,
            height: 50
        )
        healthPointsSlider.isContinuous = true
        healthPointsSlider.minimumValue = Float(minHealth)
        healthPointsSlider.maximumValue = Float(maxHealth)
        self.view.addSubview(healthPointsSlider)
        
        // Events
        healthPointsSlider.addTarget(self, action: #selector(healthSliderChanged), for: .valueChanged)
    }
    
    func addTypeButton() {
        typeButton = UIButton()
        typeButton.frame = CGRect(
            x: 20,
            y: healthPointsSlider.frame.maxY + 20,
            width: self.view.frame.width - 40,
            height: 40
        )
        typeButton.setTitle("Type", for: .normal)
        typeButton.setTitleColor(UIColor.white, for: .normal)
        typeButton.layer.cornerRadius = 16
        typeButton.backgroundColor = UIColor.blue
        typeButton.contentHorizontalAlignment = .center
       typeButton.addTarget(self, action: #selector(openTypeSelectionVC), for: .touchUpInside)

        self.view.addSubview(typeButton)
    }
    
    func addSubmitButton() {
        submitButton = UIButton()
        submitButton.frame = CGRect(
            x: self.view.center.x - 80,
            y: self.view.frame.height - 110,
            width: 160,
            height: 40
        )
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.layer.cornerRadius = 16
        submitButton.backgroundColor = UIColor.blue
        submitButton.contentHorizontalAlignment = .center
        self.view.addSubview(submitButton)
        submitButton.addTarget(self, action: #selector(toSearchResults), for: .touchUpInside)
    }
    
    func toSearchResults() {
        results = PokemonGenerator.getPokemonArray()
            .filter({$0.health >= Int(healthPointsSlider.value)})
            .filter({$0.attack >= Int(attackPointsSlider.value)})
            .filter({$0.defense >= Int(defensePointsSlider.value)})
        
        // for pokemon in results, we only keep it if one of the types is in types
        results = results.filter({
            $0.types.map({ (type: String) -> Bool in
                self.types.contains(type)
            }).reduce(false, {$0 || $1})
        })
        
        /*
 func typeInTypes(pokemon: Pokemon) {
 var returnVal = false
 for type in pokemon.types {
 returnVal = returnVal or (type in self.types)
 }
 return returnVal
 }
*/
        print(results)
        print("types")
        print(types)
        self.performSegue(withIdentifier: "toSearchResults", sender: self)
    }
    
    func attackSliderChanged() {
        minAttackPointsLabel.text = "Minimum Attack Points: " + String(attackPointsSlider.value)
    }
    
    func defenseSliderChanged() {
        minDefensePointsLabel.text = "Minimum Defense Points: " + String(defensePointsSlider.value)
    }
    
    func healthSliderChanged() {
        minHealthPointsLabel.text = "Minimum Health Points: " + String(healthPointsSlider.value)
    }
    
    func openTypeSelectionVC() {
        self.performSegue(withIdentifier: "toTypeSelector", sender: self)
    }
    
    @IBAction func unwindToCategorySelector(segue: UIStoryboardSegue) {}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
