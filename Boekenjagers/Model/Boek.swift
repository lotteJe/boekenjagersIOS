//
//  File.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

import RealmSwift

class Boek: Object {
    
   
    @objc dynamic var titel: String = ""
    @objc dynamic var auteur: String  = ""
    @objc dynamic var opmerking: String  = ""
    @objc dynamic var locatie: Locatie? = Locatie()
    
    
    
    convenience init(titel: String, auteur: String, opmerking: String, locatie: Locatie){
        self.init()
        self.titel = titel
        self.auteur = auteur
        self.opmerking = opmerking
        self.locatie = locatie
    }
}
