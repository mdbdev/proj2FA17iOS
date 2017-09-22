//
//  Pokemon.swift
//  Pokedex
//
//  Created by SAMEER SURESH on 9/25/16.
//  Copyright © 2016 trainingprogram. All rights reserved.
//

import Foundation
import ObjectMapper

class Pokemon : Mappable{
    
    /* Note 1: 
       There are 18 different types of Pokemon, and a single Pokemon can inherit multiple types:
            Bug, Grass, Dark, Ground, Dragon, Ice, Electric, Normal, Fairy,
            Poison, Fighting, Psychic, Fire, Rock, Flying, Steel, Ghost, Water
    */
    
    /* Note 2:
       The image for each Pokemon is not provided, but a URL is. You should look up how to get an image from it's URL.
    */
    
    /* Note 3:
       You can access the properties of Pokemon using dot notation (e.g. pokemon.name, pokemon.number, etc.)
     */
 
    var name: String!
    var number: Int!
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
    
    init(name: String, number: Int, attack: Int, defense: Int, health: Int, spAttack: Int, spDef: Int, species: String, speed: Int, total: Int, types: [String]) {
        self.name = name
        self.number = number
        self.attack = attack
        self.defense = defense
        self.health = health
        self.specialAttack = spAttack
        self.specialDefense = spDef
        self.species = species
        self.speed = speed
        self.total = total
        self.types = types
        // self.imageUrl = "http://img.pokemondb.net/artwork/\(name.components(separatedBy: " ")[0].lowercased()).jpg"
        var strippedName = String(name.components(separatedBy: " ")[0].lowercased().characters.filter{"abcdefghijklmnopqrstuvwxyz".characters.contains($0)})
        self.imageUrl = "http://img.pokemondb.net/artwork/\(strippedName).jpg"
    }
    
    required init?(map: Map) {
    
    }

    
    func mapping(map: Map) {
        name                <- map["name"]
        number              <- map["number"]
        attack              <- map["attack"]
        defense             <- map["defense"]
        health              <- map["health"]
        specialAttack       <- map["specialAttack"]
        specialDefense      <- map["specialDefense"]
        species             <- map["species"]
        speed               <- map["speed"]
        total               <- map["total"]
        types               <- map["types"]
        imageUrl            <- map["imageUrl"]
    }
    
}
