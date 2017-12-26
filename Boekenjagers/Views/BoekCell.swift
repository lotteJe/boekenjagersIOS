//
//  File.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

import UIKit

class BoekCell: UITableViewCell {
    
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var auteurLabel: UILabel!
    
    var boek: Boek! {
        didSet{
            titelLabel.text = boek.titel
            auteurLabel.text = boek.auteur
        }
    }
}
