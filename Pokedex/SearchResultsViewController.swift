//
//  SearchResultsViewController.swift
//  Pokedex
//
//  Created by Annie Tang on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController {
    
    var segmentedControl: UISegmentedControl!
    var tableView: UITableView!
    var collectionView: UICollectionView!
    
    /* order of images in pokemonImages should be same as in results */
    var results: [Pokemon]!
    // var pokemonImages: [UIImage]!
    
    var pokemonToPass: Pokemon!
    var pokePicToPass: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSegmentedControl()
        setupTableView()
        setupCollectionView()

    }
    
    /* Initializing SegmentedControl and adding to view */
    func setupSegmentedControl() {
        segmentedControl = UISegmentedControl(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.05 + 10, width: view.frame.width, height: view.frame.height * 0.05))
        segmentedControl.insertSegment(withTitle: "List", at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: "Grid", at: 1, animated: true)
        segmentedControl.layer.cornerRadius = 3
        segmentedControl.addTarget(self, action: #selector(switchView), for: .valueChanged)
        view.addSubview(segmentedControl)
    }
    
    /* Initializaing table view, and adding it to view */
    func setupTableView(){
        segmentedControl.selectedSegmentIndex = 0
    
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
    
    /* Initializaing collection view, and adding it to view */
    func setupCollectionView() {
        segmentedControl.selectedSegmentIndex = 1
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame:
            CGRect(x: 0,
                   y: UIApplication.shared.statusBarFrame.maxY + view.frame.height * 0.1 + 10,
                   width: view.frame.width,
                   height: view.frame.height * 0.9 - UIApplication.shared.statusBarFrame.maxY - 10),
            collectionViewLayout: layout)
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "collectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
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
        if segue.identifier == "segueToPokemonDetails" {
            let pokemonDetails = segue.destination as! PokemonProfileViewController
            pokemonDetails.p = pokemonToPass
        }
    }
    
    
    

//    func setUpPokemonImages() {
//        pokemonImages = []
//        for p in results {
//            pokemonImages.append(grabImagesFromURL(p: p))
//        }
//    }
//    
//    func grabImagesFromURL(p: Pokemon)->UIImage {
//        /* taken from stack overflow question: 24231680 */
//        //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//        var image: UIImage!
//        
//        let url = URL(string: p.imageUrl)
//        
//        /* if url is not nil, try to get the contents of it and use it */
//        if url != nil {
//            do {
//                let data = try Data(contentsOf: url!)
//                image = UIImage(data: data)
//            }
//            catch {
//                image = #imageLiteral(resourceName: "pokeball")
//            }
//        }
//        else {
//            print("default")
//            image = #imageLiteral(resourceName: "question")
//        }
//        
//        if image == nil {
//            image = #imageLiteral(resourceName: "question")
//        }
//        
//        print("image: ", image)
//        return image
//    }
    
    
 
}
 


/* extension of TABLEVIEWS */
extension SearchResultsViewController: UITableViewDataSource, UITableViewDelegate {
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
        let p: Pokemon = results[indexPath.row]

        cell.pokemonObject = p

        cell.awakeFromNib()
        
        Utils.getImage(url: p.imageUrl) { img in
            cell.pokePic.image = img
        }
        if cell.pokePic.image == nil {
            cell.pokePic.image = #imageLiteral(resourceName: "pokeball")
        }
        cell.nameLabel.text = p.name
        cell.numberLabel.text = "# " +  String(p.number)
        return cell
    }
    
    /* action after tableCell is selected
       "passes" the pokemon object over into the PokemonDetailsVC through segue */
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pokemonToPass = results[indexPath.row]
        performSegue(withIdentifier: "segueToPokemonDetails", sender: self)
    }
    
    /* sets each row to be 1/10 of frame view */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 10
    }
    
}

/* EXTENSION OF COLLECTIONVIEW */
extension SearchResultsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    /* number of types of cells in collectionView */
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    /* number of cells in a section */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    /* dequeue & setting up collectionView cell 
       sets the pokemon's image, name to the collectionView cell */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        /* dequeue cell and remove/reset from subview; initialize new cell */
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! PokemonCollectionViewCell
        for subview in cell.contentView.subviews {
            subview.removeFromSuperview()
        }
        let p: Pokemon = results[indexPath.row]
        cell.awakeFromNib()
        
        // cell.pokePic.image = pokemonImages[indexPath.row]
        Utils.getImage(url: p.imageUrl) { img in
            cell.pokePic.image = img
        }
        if cell.pokePic.image == nil {
            cell.pokePic.image = #imageLiteral(resourceName: "pokeball")
        }
        cell.nameLabel.text = p.name
        return cell
    }
    
    /* passes the pokemon into PokemonDetails once cell is clicked upon */
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        pokemonToPass = results[indexPath.row]
        performSegue(withIdentifier: "segueToPokemonDetails", sender: self)
    }
    
    /* makes it such that the cells are 1/4 of the view width square */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 4, height: view.frame.width / 4)
    }
}
