//
//  File.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

class Boek {
    
    var titel: String
    var auteur: String
    var opmerking: String
    var locatie: Locatie
    
    init(titel: String, auteur: String, opmerking: String, locatie: Locatie){
        self.titel = titel
        self.auteur = auteur
        self.opmerking = opmerking
        self.locatie = locatie
    }
}
