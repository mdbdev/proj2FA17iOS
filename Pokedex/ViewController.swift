//
//  ViewController.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //let name = "pikachu"
    var pokemon : [String]!
    //let pokemon = ["Abomasnow", "Abomasnow( Mega Abowmasnow)", "Abra", "Absol", "Accelgor"]
    
    var pokemonpics : [UIImage]!
    var attacks : [Int]!
    var defenses: [Int]!
    var healths : [Int]!
    var SP: [Int]!
    var SD: [Int]!
    var species: [String]!
    var speed: [Int]!
    var total: [Int]!
    
    var tableView : UITableView!
    var segmentedControl : UISegmentedControl!
    var collectionView : UICollectionView!
    
    var pokemonToPass: String?
    var pokemonPicToPass: UIImage!
    var pokemonAttackToPass: Int!
    var pokemonDefenseToPass: Int!
    var pokemonHealthToPass: Int!
    var pokemonSPToPass: Int!
    var pokemonSDToPass: Int!
    var pokemonSpeciesToPass: String!
    var pokemonSpeedToPass: Int!
    var pokemonTotalToPass: Int!
    
    
    /*for pokemon in allPokemon {
        print(pokemon.name)
    }*/

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        setupTableView()
        //print(pokemon)
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    
    func setupSegmentedControl() {
        segmentedControl = UISegmentedControl(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.05 + 10, width: view.frame.width, height: view.frame.height * 0.05))
        segmentedControl.insertSegment(withTitle: "Names", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Pictures", at: 1, animated: true)
        segmentedControl.layer.cornerRadius = 3
        segmentedControl.addTarget(self, action: #selector(switchView), for: .valueChanged)
        view.addSubview(segmentedControl)
    }
    
    func setupTableView(){
        segmentedControl.selectedSegmentIndex = 0
        
        //Initialize TableView Object here
        tableView = UITableView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.1 + 10, width: view.frame.width, height: view.frame.height - UIApplication.shared.statusBarFrame.maxY))
        //Register the tableViewCell you are using
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        //Set properties of TableView
        tableView.delegate = self
        tableView.dataSource =  self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50/2, right: 0)
        //Add tableView to view
        view.addSubview(tableView)
    }
    
    func setupCollectionView() {
        segmentedControl.selectedSegmentIndex = 1
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.1 + 10, width: view.frame.width, height: view.frame.height * 0.9 - UIApplication.shared.statusBarFrame.maxY - 10), collectionViewLayout: layout)
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.gray
        view.addSubview(collectionView)
    }
    
    func switchView(sender: UISegmentedControl) {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
        view.addSubview(segmentedControl)
        if (sender.selectedSegmentIndex == 0) {
            setupTableView()
        } else {
            setupCollectionView()
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfile" {
            let profileVC = segue.destination as! ProfileViewController
            profileVC.pokemon = pokemonToPass
            profileVC.pic = pokemonPicToPass
            profileVC.attack = pokemonAttackToPass
            profileVC.defense = pokemonDefenseToPass
            profileVC.health = pokemonHealthToPass
            profileVC.specialAttack = pokemonSPToPass
            profileVC.specialDefense = pokemonSDToPass
            profileVC.species = pokemonSpeciesToPass
            profileVC.speed = pokemonSpeedToPass
            profileVC.total = pokemonTotalToPass
        }
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! SearchTableViewCell
        
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.nameLabel.text = pokemon[indexPath.row]
        print(indexPath.section)
        print(indexPath.row)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokemonToPass = pokemon[indexPath.row]
        pokemonPicToPass = pokemonpics[indexPath.row]
        pokemonAttackToPass = attacks[indexPath.row]
        pokemonDefenseToPass = defenses[indexPath.row]
        pokemonHealthToPass = healths[indexPath.row]
        pokemonSPToPass = SP[indexPath.row]
        pokemonSDToPass = SD[indexPath.row]
        pokemonSpeciesToPass = species[indexPath.row]
        pokemonSpeedToPass = speed[indexPath.row]
        pokemonTotalToPass = total[indexPath.row]
        performSegue(withIdentifier: "toProfile", sender: self)
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonpics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! SearchCollectionViewCell
        cell.awakeFromNib()
        cell.pokeImage.image = pokemonpics[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pokemonToPass = pokemon[indexPath.row]
        pokemonPicToPass = pokemonpics[indexPath.row]
        pokemonAttackToPass = attacks[indexPath.row]
        pokemonDefenseToPass = defenses[indexPath.row]
        pokemonHealthToPass = healths[indexPath.row]
        pokemonSPToPass = SP[indexPath.row]
        pokemonSDToPass = SD[indexPath.row]
        pokemonSpeciesToPass = species[indexPath.row]
        pokemonSpeedToPass = speed[indexPath.row]
        pokemonTotalToPass = total[indexPath.row]
        
        performSegue(withIdentifier: "toProfile", sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: 100)
    }
    
}

