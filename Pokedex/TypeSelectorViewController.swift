//
//  TypeSelectorViewController.swift
//  Pokedex
//
//  Created by Louie McConnell on 9/18/17.
//  Copyright © 2017 trainingprogram. All rights reserved.
//

import UIKit

class TypeSelectorViewController: UIViewController {

    var tableView: UITableView!
    var doneButton: UIButton!
    var types = ["Bug", "Grass", "Dark", "Ground", "Dragon", "Ice", "Electric", "Normal", "Fairy", "Poison", "Fighting", "Psychic", "Fire", "Rock", "Flying", "Steel", "Ghost", "Water"]
    var selectedTypes: [String] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Initialize TableView Object here
        initializeTableView()
        // add done button
        addDoneButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindToCategorySelector" {
            let categorySelectorVC = segue.destination as! CategorySelectionViewController
            categorySelectorVC.types = selectedTypes
        }
    }
    
    func initializeTableView() {
        tableView = UITableView(frame: CGRect(x: 0, y: UIApplication.shared.statusBarFrame.maxY + 10, width: view.frame.width, height: view.frame.height - UIApplication.shared.statusBarFrame.maxY - 100))
        // Register the tableViewCell you are using
        tableView.register(TypeTwoTableViewCell.self, forCellReuseIdentifier: "tableViewCell")
        
        //Set properties of TableView
        tableView.delegate = self as UITableViewDelegate
        tableView.dataSource = self as UITableViewDataSource
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 50/2, right: 0)
        //Add tableView to view
        view.addSubview(tableView)
    }
    // add a prepare function before any segue to pass parameters
    
    func addDoneButton() {
        doneButton = UIButton()
        doneButton.frame = CGRect(
            x: 20,
            y: self.view.frame.height - 70,
            width: self.view.frame.width - 40,
            height: 40
        )
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(UIColor.white, for: .normal)
        doneButton.layer.cornerRadius = 16
        doneButton.backgroundColor = UIColor.blue
        doneButton.contentHorizontalAlignment = .center
        doneButton.addTarget(self, action: #selector(goBackToCategorySelector), for: .touchUpInside)
        self.view.addSubview(doneButton)
    }
    
    func goBackToCategorySelector() {
        performSegue(withIdentifier: "unwindToCategorySelector", sender: self)
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

extension TypeSelectorViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! TypeTwoTableViewCell
        
        for subview in cell.contentView.subviews{
            subview.removeFromSuperview()
        }
        
        cell.awakeFromNib()
        cell.typeLabel.text = types[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // CHANGE THIS LINE SO YOU ARE SENDING MULTIPLE TYPES AT ONCE
        // typesToPass = types[indexPath.row]
        
        // if the cell text is already in selectedTypes 
        if let cell = tableView.cellForRow(at: indexPath) {
            let selectedType = types[indexPath.row]
            if selectedTypes.contains(selectedType) {
                cell.accessoryType = .none
                selectedTypes = selectedTypes.filter {$0 != selectedType}
            } else {
                cell.accessoryType = .checkmark
                selectedTypes.append(selectedType)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
