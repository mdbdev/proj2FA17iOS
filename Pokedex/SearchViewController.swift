//
//  SearchViewController.swift
//  Pokedex
//
//  Created by Nikita Ashok on 9/20/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
    var sortedPokemon : [Pokemon]!
    var searchButton : UIButton!
    var logo: UIImageView!
    var pokemonName: UITextField!
    var minAttackPts: UITextField!
    var minDefensePts: UITextField!
    var minHealthpts: UITextField!
    var typeBackground: UIImageView!
    var typeSelectedTextField: UITextField! //favoriteDayTextField
    let types = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Fighting", "Ice", "Electric", "Normal", "Fairy",
                 "Poison", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water"]
    var selectedType: String? //selectedDay
    var typePicker: UIPickerView!
    var typesSelected: [String] = []
    var doneSelectingTypes: UIButton!
    
    let allPokemon = PokemonGenerator.getPokemonArray()
    var nameSearched: String!
    var numberSearched: Int!
    var minAttackPtsSearched: Int!
    var minDefensePtsSearched: Int!
    var minHealthPtsSearched: Int!
    var searchButtonUser: UIButton!
    var typeSearched: [String]!
    var pokemonNames: [String] = []
    var pokemonImages: [UIImage] = []
    var typesButton: UIButton!
    var typesTableView: UITableView!
    var typesToPass: String!
    var goDirect : Bool!
    var pokemonURL : [String] = []
    var pokeImage: UIImage!
    var pics : [UIImage] = []
    
    var pokemonAttacks : [Int] = []
    var pokemonDefenses : [Int] = []
    var pokemonHealths : [Int] = []
    var pokemonSP : [Int] = []
    var pokemonSD : [Int] = []
    var pokemonSpecies : [String] = []
    var pokemonSpeed : [Int] = []
    var pokemonTotal : [Int] = []
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneSelectingTypes = UIButton(frame: CGRect(x: view.frame.width * 0.45, y: view.frame.height * 0.412, width: 60, height: 30))
        doneSelectingTypes.setTitle("DONE", for: .normal)
        doneSelectingTypes.addTarget(self, action: #selector(doneSelecting), for: .touchUpInside)
        doneSelectingTypes.titleLabel?.font =  UIFont(name: "Print Clearly", size: 10)
        
        view.addSubview(doneSelectingTypes)
        doneSelectingTypes.isHidden = true
        
        view.backgroundColor = UIColor(red: 230/255, green: 72/255, blue: 72/255, alpha: 1)
        logo = UIImageView(frame: CGRect(x: view.frame.width * 0.21, y: view.frame.height * 0.15, width: 219, height: 58))
        logo.image = #imageLiteral(resourceName: "pokedexIOS")
        logo.contentMode = .scaleAspectFill
        view.addSubview(logo)
        pokemonName = UITextField(frame: CGRect(x: view.frame.width * 0.197, y: view.frame.height * 0.344, width: 227, height: 42))
        pokemonName.background = #imageLiteral(resourceName: "nameNumberField")
        pokemonName.borderStyle = .none
        pokemonName.placeholder = "name/no."
        pokemonName.textAlignment = .center
        pokemonName.font = UIFont(name: "AppleSDGothicNeo", size: 14)
        view.addSubview(pokemonName)
        minAttackPts = UITextField(frame: CGRect(x: view.frame.width * 0.197, y: view.frame.height * 0.5457, width: 227, height: 42))
        minAttackPts.background = #imageLiteral(resourceName: "nameNumberField")
        minAttackPts.borderStyle = .none
        minAttackPts.placeholder = "minimum attack pts"
        minAttackPts.textAlignment = .center
        minAttackPts.font = UIFont(name: "AppleSDGothicNeo", size: 14)
        view.addSubview(minAttackPts)
        minDefensePts = UITextField(frame: CGRect(x: view.frame.width * 0.197, y: view.frame.height * 0.646, width: 227, height: 42))
        minDefensePts.background = #imageLiteral(resourceName: "nameNumberField")
        minDefensePts.borderStyle = .none
        minDefensePts.placeholder = "minimum defense pts"
        minDefensePts.textAlignment = .center
        minDefensePts.font = UIFont(name: "AppleSDGothicNeo", size: 14)
        view.addSubview(minDefensePts)
        minHealthpts = UITextField(frame: CGRect(x: view.frame.width * 0.197, y: view.frame.height * 0.7466, width: 227, height: 42))
        minHealthpts.background = #imageLiteral(resourceName: "nameNumberField")
        minHealthpts.borderStyle = .none
        minHealthpts.placeholder = "minimum health pts"
        minHealthpts.textAlignment = .center
        minHealthpts.font = UIFont(name: "AppleSDGothicNeo", size: 14)
        view.addSubview(minHealthpts)
        //typeBackground = UIImageView(frame: CGRect(x: view.frame.width * 0.197, y: view.frame.height * 0.445, width: 227, height: 42))
        //typeBackground.image = #imageLiteral(resourceName: "searchArea")
        //sview.addSubview(typeBackground)
        //pokemonType = UIPickerView(frame: CGRect(x: view.frame.width * 0.197, y: view.frame.height * 0.445, width: 227, height: 42))
        //view.addSubview(pokemonType)
        typesButton = UIButton(frame: CGRect(x: view.frame.width * 0.197, y: view.frame.height * 0.445, width: 227, height: 42))
        typesButton.setTitle("types", for: .normal)
        typesButton.addTarget(self, action: #selector(displayTypes), for: .touchUpInside)
        typesButton.setTitle("types", for: .normal)
        view.addSubview(typesButton)
        //createTypePicker()
        
        //var logo: UIImageView!
        //var pokemonName: UITextField!
        //var minAttackPts: UITextField!
        ///var minDefensePts: UITextField!
        //var minHealthpts: UITextField!
        //var typeBackground: UIImageView!
        //var typeSelectedTextField: UITextField! //favorit
        pokemonName.delegate = self
        minAttackPts.delegate = self
        minDefensePts.delegate = self
        minHealthpts.delegate = self
        
        searchButtonUser = UIButton(frame: CGRect(x: view.frame.width * 0.384, y: view.frame.height * 0.847, width: 87, height: 25))
        searchButtonUser.setTitle("search", for: .normal)
        //searchButtonUser.background = #imageLiteral(resourceName: "nameNumberField")
        searchButtonUser.addTarget(self, action: #selector(goToList), for: .touchUpInside)
        
        view.addSubview(searchButtonUser)
        
        doneSelectingTypes = UIButton(frame: CGRect(x: view.frame.width * 0.45, y: view.frame.height * 0.412, width: 60, height: 30))
        doneSelectingTypes.setTitle("DONE", for: .normal)
        doneSelectingTypes.addTarget(self, action: #selector(doneSelecting), for: .touchUpInside)
        doneSelectingTypes.titleLabel?.font =  UIFont(name: "Print Clearly", size: 10)
        
        view.addSubview(doneSelectingTypes)
        doneSelectingTypes.isHidden = true

        // Do any additional setup after loading the view.
    }
    
    func doneSelecting() {
        typesTableView.isHidden = true
        var typ = ""
        for t in typesSelected {
            typ = typ + t + " ,"
        }
        doneSelectingTypes.setTitle("TYPE", for: .normal)
        typesButton.setTitle(typ, for: .normal)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return(true)
    }
    /*func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == typeSelectedTextField {
            typePicker.isHidden = false
            textField.endEditing(true)
        }
    }*/
    
    func displayTypes() {
        setUpTableView()
        doneSelectingTypes.isHidden = false
        
    }
    func setUpTableView() {
        typesTableView = UITableView(frame: CGRect(x: view.frame.width * 0.192, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.429 , width: view.frame.width * 0.616, height: view.frame.height * 0.287  - UIApplication.shared.statusBarFrame.maxY ))
        typesTableView.register(TypesTableViewCell.self, forCellReuseIdentifier: "tableViewCellTypes")
        
        //Set properties of TableView
        typesTableView.delegate = self
        typesTableView.dataSource = self
        typesTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50/2, right: 0)
        //Add tableView to view
        view.addSubview(typesTableView)
    }
    
    
    func narrowChoices () {
        var meetsCriteriaMinAttackPtsSearched: [Pokemon] = []
        if minAttackPtsSearched != nil {
            for p in allPokemon {
                if p.attack >= minAttackPtsSearched {
                    (meetsCriteriaMinAttackPtsSearched).append(p)
                }
            }
        }
        var meetsCriteriaMinDefensePtsSearched: [Pokemon] = []
        if minDefensePtsSearched != nil {
            for p in allPokemon {
                if p.defense >= minDefensePtsSearched {
                    meetsCriteriaMinDefensePtsSearched.append(p)
                }
            }
        }
        var meetsCriteriaMinHealthPtsSearched: [Pokemon] = []
        if minHealthPtsSearched != nil {
            for p in allPokemon {
                if p.health >= minHealthPtsSearched {
                    meetsCriteriaMinHealthPtsSearched.append(p)
                }
            }
        }
        var meetsCriteriaTypeSearched: [Pokemon] = []
        if !typesSelected.isEmpty {
            for p in allPokemon {
                for t in typesSelected {
                    if p.types.contains(t) {
                        meetsCriteriaTypeSearched.append(p)
                    }
                }
            }
        }
        var meetsMinAttackMinDefense: [Pokemon] = []
        for minA in meetsCriteriaMinAttackPtsSearched {
            for minD in meetsCriteriaMinDefensePtsSearched {
                if minD.number == minA.number {
                    meetsMinAttackMinDefense.append(minD)
                }
            }
        }
        
        var meetsMinHealthMinAD: [Pokemon] = []
        for minAD in meetsMinAttackMinDefense {
            for minH in meetsCriteriaMinHealthPtsSearched {
                if minAD.number == minH.number {
                    meetsMinHealthMinAD.append(minAD)
                }
            }
        }
        /*var allSortedPokemonRepeats: [Pokemon] = []
        for minHAD in meetsMinHealthMinAD {
            for minT in meetsCriteriaTypeSearched {
                if minHAD.number == minT.number {
                    allSortedPokemonRepeats.append(minHAD)
                }
            }
        }*/
        
        
        /*if meetsCriteriaTypeSearched.isEmpty && meetsCriteriaMinHealthPtsSearched.isEmpty && meetsCriteriaMinDefensePtsSearched.isEmpty && !meetsCriteriaMinAttackPtsSearched.isEmpty {
            allSortedPokemonRepeats = meetsCriteriaMinAttackPtsSearched
        }
        if !meetsCriteriaTypeSearched.isEmpty && meetsCriteriaMinHealthPtsSearched.isEmpty && meetsCriteriaMinDefensePtsSearched.isEmpty && meetsCriteriaMinAttackPtsSearched.isEmpty {
            allSortedPokemonRepeats = meetsCriteriaTypeSearched
        }
        if meetsCriteriaTypeSearched.isEmpty && !meetsCriteriaMinHealthPtsSearched.isEmpty && meetsCriteriaMinDefensePtsSearched.isEmpty && meetsCriteriaMinAttackPtsSearched.isEmpty {
            allSortedPokemonRepeats = meetsCriteriaMinHealthPtsSearched
        }
        if meetsCriteriaTypeSearched.isEmpty && meetsCriteriaMinHealthPtsSearched.isEmpty && !meetsCriteriaMinDefensePtsSearched.isEmpty && meetsCriteriaMinAttackPtsSearched.isEmpty {
            allSortedPokemonRepeats = meetsCriteriaMinDefensePtsSearched
        }
        allSortedPokemonRepeats = Array(Set(allSortedPokemonRepeats))*/
        
        sortedPokemon = Array(Set(meetsMinHealthMinAD))
    }
        
    
    
    func getPics() {
        
        //for each pokemon in sortedPokemon, access their image url and store into an array
        //go through each url and do the following below code and store each image into an array
        for p in sortedPokemon {
            pokemonURL.append(p.imageUrl)
        }
        print(pokemonURL)
        
        for u in pokemonURL {
            let url = URL(string: u)
            if let i = url {
                let data = try? Data(contentsOf: i)
                if let x = data {
                    self.pics.append(UIImage(data: x)!)
                } else {
                    self.pics.append(UIImage())
                }
            }
            else {
                self.pics.append(UIImage())
            }
            
            
            
            //self.pics.append(self.pokeImage)
            
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(goDirect!)
        if (goDirect!) {
            let profileController = segue.destination as! ProfileViewController
            profileController.pokemon = nameSearched
        } else {
            let listController = segue.destination as! ViewController
            for p in sortedPokemon {
                pokemonNames.append(p.name)
                pokemonAttacks.append(p.attack)
                pokemonDefenses.append(p.defense)
                pokemonHealths.append(p.health)
                pokemonSP.append(p.specialAttack)
                pokemonSD.append(p.specialDefense)
                pokemonSpecies.append(p.species)
                pokemonSpeed.append(p.speed)
                pokemonTotal.append(p.total)
            }
            listController.pokemon = pokemonNames
            getPics()
            listController.pokemonpics = pics
            listController.attacks = pokemonAttacks
            listController.defenses = pokemonDefenses
            listController.healths = pokemonHealths
            listController.SP = pokemonSP
            listController.SD = pokemonSD
            listController.species = pokemonSpecies
            listController.speed = pokemonSpeed
            listController.total = pokemonTotal
            
        }
        
    }
    
    func directProfile() {
        goDirect = true
        self.performSegue(withIdentifier: "directProfile", sender: self)
    }
    
    func goToList() {
        //goDirect = false
        minAttackPtsSearched = Int(minAttackPts.text!)
        minHealthPtsSearched = Int(minHealthpts.text!)
        minDefensePtsSearched = Int(minDefensePts.text!)
        nameSearched = pokemonName.text
        
        print(nameSearched)
        
        if nameSearched != "" {
            directProfile()
        } else {
            goDirect = false
            narrowChoices()
            self.performSegue(withIdentifier: "toList", sender: self)
        }
        
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

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCellTypes") as! TypesTableViewCell
        
        //below forLoop idk if necessary
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib() //idk if necessary
        cell.typeLabel.text = types[indexPath.row]
        
        return cell
        
    }
    
    /**func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     typesToPass = types[indexPath.row]
     performSegue(withIdentifier: "segueToFruitVC", sender: self)
     //STORE VAIRABLE
     }*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
            var typeSelected = types[indexPath.row]
            print(typeSelected)
            typesSelected.append(typeSelected)
            
            //GET TITLE OF CELL
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}



