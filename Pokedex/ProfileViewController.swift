//
//  ProfileViewController.swift
//  Pokedex
//
//  Created by Nikita Ashok on 9/17/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    var pokemon : String?
    var pic : UIImage!
    var backButton: UIButton!
    var numer: Int!
    var attack: Int!
    var defense: Int!
    var health: Int!
    var specialAttack: Int!
    var specialDefense: Int!
    var species: String!
    var speed: Int!
    var total: Int!
    var types: [String]!
    var imageUrl: String!
    var profileImage : UIImageView!
    var topBar : UIImageView!
    var attackLabel: UILabel!
    var defenseLabel: UILabel!
    var healthLabel: UILabel!
    var specAttackLabel: UILabel!
    var specDefenseLabel: UILabel!
    var speciesLabel: UILabel!
    var speedLabel: UILabel!
    var totalLabel: UILabel!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        backButton = UIButton(frame: CGRect(x: view.frame.width*0.04, y: 10, width: 27, height: 30))
        backButton.setTitle("-", for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(backButton)
        
        profileImage = UIImageView(frame: CGRect(x: view.frame.width * 0.072, y: view.frame.height * 0.148, width: 118, height: 115))
        profileImage.contentMode = .scaleAspectFill
        profileImage.image = pic
        view.addSubview(profileImage)
        
        topBar = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height * 0.09))
        topBar.contentMode = .scaleAspectFill
        topBar.image = #imageLiteral(resourceName: "profileTopBar")
        view.addSubview(topBar)
        view.sendSubview(toBack: topBar)
        
        attackLabel = UILabel(frame: CGRect(x: 30, y: 276, width: view.frame.width, height: 20))
        attackLabel.text = "Attack: \(attack!)"
        attackLabel.textAlignment = .left
        attackLabel.font = UIFont(name: attackLabel.font.fontName, size: 20)
        view.addSubview(attackLabel)
        
        defenseLabel = UILabel(frame: CGRect(x: 30, y: 309, width: view.frame.width, height: 20))
        defenseLabel.text = "Defense: \(defense!)"
        defenseLabel.textAlignment = .left
        defenseLabel.font = UIFont(name: attackLabel.font.fontName, size: 20)
        view.addSubview(defenseLabel)
        
        healthLabel = UILabel(frame: CGRect(x: 30, y: 340, width: view.frame.width, height: 20))
        healthLabel.text = "Health: \(health!)"
        healthLabel.textAlignment = .left
        view.addSubview(healthLabel)
        
        specAttackLabel = UILabel(frame: CGRect(x: 30, y: 376, width: view.frame.width, height: 20))
        specAttackLabel.text = "Special Attack: \(specialAttack!)"
        specAttackLabel.textAlignment = .left
        specAttackLabel.font = UIFont(name: attackLabel.font.fontName, size: 20)
        view.addSubview(specAttackLabel)
        
        specDefenseLabel = UILabel(frame: CGRect(x: 30, y: 406, width: view.frame.width, height: 20))
        specDefenseLabel.text = "Special Defense: \(specialDefense!)"
        specDefenseLabel.textAlignment = .left
        specDefenseLabel.font = UIFont(name: attackLabel.font.fontName, size: 20)
        view.addSubview(specDefenseLabel)
        
        speciesLabel = UILabel(frame: CGRect(x: 30, y: 440, width: view.frame.width, height: 20))
        speciesLabel.text = "Species: \(species!)"
        speciesLabel.textAlignment = .left
        speciesLabel.font = UIFont(name: attackLabel.font.fontName, size: 20)
        view.addSubview(speciesLabel)
        
        speedLabel = UILabel(frame: CGRect(x: 30, y: 480, width: view.frame.width, height: 20))
        speedLabel.text = "Speed: \(speed!)"
        speedLabel.textAlignment = .left
        speedLabel.font = UIFont(name: attackLabel.font.fontName, size: 20)
        view.addSubview(speedLabel)
        
        totalLabel = UILabel(frame: CGRect(x: 30, y: 515, width: view.frame.width, height: 20))
        totalLabel.text = "Total: \(total!)"
        totalLabel.textAlignment = .left
        totalLabel.font = UIFont(name: attackLabel.font.fontName, size: 20)
        view.addSubview(totalLabel)
    }
    
    func setupUI(){
        let pokemonLabel = UILabel(frame: CGRect(x: view.frame.width * 0.348, y: view.frame.height * 0.02, width: 113, height: 30))
        
        pokemonLabel.text = pokemon ?? "No pokemon passed?"  //nil coalescing operator
        pokemonLabel.textColor = UIColor.white
        pokemonLabel.textAlignment = .center
        view.addSubview(pokemonLabel)
    }
    
    func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
