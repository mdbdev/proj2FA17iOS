//
//  FavoritesViewController.swift
//  Pokedex
//
//  Created by Annie Tang on 9/21/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit
import ObjectMapper

class FavoritesViewController: UIViewController {
    
    var tableView: UITableView!
    var results: [Pokemon]! = []
    var pokemonImages: [UIImage]!
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let jsonifiedPokemon = userDefaults.array(forKey: "favoritesArray") {
            for json in jsonifiedPokemon {
                results.append(Pokemon(JSONString: json as! String)!)
            }
        }
        
        setupTableView()
        setUpPokemonImages()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let jsonifiedPokemon = userDefaults.array(forKey: "favoritesArray") {
            for json in jsonifiedPokemon {
                results.append(Pokemon(JSONString: json as! String)!)
            }
        }
        tableView.reloadData()
    }
    
    func setupTableView(){
        tableView = UITableView(frame:
            CGRect(x: 0,
                   y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.1 + 10,
                   width: view.frame.width,
                   height: view.frame.height - UIApplication.shared.statusBarFrame.maxY))
        
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50/2, right: 0)
        view.addSubview(tableView)
    }
    
    func setUpPokemonImages() {
        pokemonImages = []
        for p in results {
            pokemonImages.append(grabImagesFromURL(p: p))
        }
    }
    
    func grabImagesFromURL(p: Pokemon)->UIImage {
        /* taken from stack overflow question: 24231680 */
        //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        var image: UIImage!
        
        let url = URL(string: p.imageUrl)
        
        /* if url is not nil, try to get the contents of it and use it */
        if url != nil {
            do {
                let data = try Data(contentsOf: url!)
                image = UIImage(data: data)
            }
            catch {
                image = #imageLiteral(resourceName: "pokeball")
            }
        }
        else {
            print("default")
            image = #imageLiteral(resourceName: "question")
        }
        
        if image == nil {
            image = #imageLiteral(resourceName: "question")
        }
        
        print("image: ", image)
        return image
    }
}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    /* number of sections/types of cells in tableview */
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    /* number of cells in section of tableview */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    /* dequeue & set up cell at indexPath.row
     pass over the pokemon image, name, and number into the tableview cell */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* dequeue cell and remove/reset from subview; initialize new cell */
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! PokemonTableViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        cell.awakeFromNib()
        
        let p: Pokemon = results[indexPath.row]
        cell.pokePic.image = pokemonImages[indexPath.row]
        cell.nameLabel.text = p.name
        cell.numberLabel.text = "# " +  String(p.number)
        return cell
    }
    
    /* sets each row to be 1/10 of frame view */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 10
    }
    
}
