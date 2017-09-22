//
//  SearchBarViewController.swift
//  Pokedex
//
//  Created by Louie McConnell on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController {

    var searchBar : UITextField!
    var submitButton : UIButton!
    var results: [Pokemon]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addSearchBar()
        addSubmitButton()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSearchResults" {
            let searchResultsVC = segue.destination as! SearchResultsViewController
            searchResultsVC.results = self.results
            print(self.results)
        }
    }
    
    func addSearchBar() {
        searchBar = UITextField()
        searchBar.frame = CGRect(
            x: 20,
            y: self.view.frame.height / 2 - 50,
            width: self.view.frame.width - 40,
            height: 40)
        searchBar.layer.cornerRadius = 16
        searchBar.layer.borderColor = UIColor.lightGray.cgColor
        searchBar.layer.borderWidth = 1
        searchBar.textAlignment = .center
        searchBar.placeholder = "pokemon name or number"
        view.addSubview(searchBar)
    }
    
    func addSubmitButton() {
        submitButton = UIButton()
        submitButton.frame = CGRect(
            x: self.view.center.x - 80,
            y: self.view.frame.height - 110,
            width: 160,
            height: 40
        )
        submitButton.setTitle("submit", for: .normal)
        submitButton.setTitleColor(UIColor.white, for: .normal)
        submitButton.layer.cornerRadius = 16
        submitButton.backgroundColor = UIColor.blue
        submitButton.contentHorizontalAlignment = .center
        submitButton.addTarget(self, action: #selector(queryAndGoToSearchResults), for: .touchUpInside)
        self.view.addSubview(submitButton)
    }
    
    func queryAndGoToSearchResults() {
        let pokeArray = PokemonGenerator.getPokemonArray()
        
        if Int(searchBar.text!) != nil {
            results = pokeArray.filter{$0.number == Int(searchBar.text!)}
        } else {
            results = pokeArray.filter{$0.name.lowercased() == searchBar.text!.lowercased()}
        }
        
        performSegue(withIdentifier: "toSearchResults", sender: self)
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
