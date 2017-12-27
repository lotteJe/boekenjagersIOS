//
//  Locatie.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

import RealmSwift

class Locatie: Object {
    
    @objc dynamic var straat:String = ""
    @objc dynamic var nummer: String = ""
    @objc dynamic var postcode: Int = 0
    @objc dynamic var gemeente: String = ""

    
    convenience init(straat: String, nummer: String, postcode: Int, gemeente: String){
        
        self.init()
        self.straat = straat
        self.nummer = nummer
        self.postcode = postcode
        self.gemeente = gemeente
    }
}
