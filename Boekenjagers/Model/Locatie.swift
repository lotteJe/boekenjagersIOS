//
//  Locatie.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

class Locatie {
    
    var straat: String
    var nummer: String
    var postcode: Int
    var gemeente: String
    
    init(straat: String, nummer: String, postcode: Int, gemeente: String){
        self.straat = straat
        self.nummer = nummer
        self.postcode = postcode
        self.gemeente = gemeente
    }
}
