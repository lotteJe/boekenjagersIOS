//
//  NieuwBoekViewController.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

import UIKit

class NieuwBoekViewController: UITableViewController {
    
    @IBOutlet weak var opslaanButton: UIBarButtonItem!
    
    @IBOutlet weak var titelVeld: UITextField!
    @IBOutlet weak var auteurVeld: UITextField!
    @IBOutlet weak var straatVeld: UITextField!
    @IBOutlet weak var nummerVeld: UITextField!
    @IBOutlet weak var postcodeVeld: UITextField!
    @IBOutlet weak var gemeenteVeld: UITextField!
    @IBOutlet weak var opmerkingVeld: UITextField!
    
    var boek: Boek?
    
    @IBAction func opslaan(){
        performSegue(withIdentifier: "didAddBoek", sender: self)
    }
    
    @IBAction func moveFocus() {
        titelVeld.resignFirstResponder()
        opmerkingVeld.becomeFirstResponder()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "didAddBoek"?:
            let locatie = Locatie(straat: straatVeld.text!, nummer: nummerVeld.text!, postcode: Int(postcodeVeld.text!)!, gemeente: gemeenteVeld.text!)
            boek = Boek(titel: titelVeld.text!, auteur: auteurVeld.text!, opmerking: opmerkingVeld.text!, locatie: locatie)
        default:
            fatalError("Unknown segue")
        }
    }
}

extension NieuwBoekViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            let oldText = text as NSString
            let newText = oldText.replacingCharacters(in: range, with: string)
            opslaanButton.isEnabled = newText.count > 0
        } else {
            opslaanButton.isEnabled = string.count > 0
        }
        return true
    }
}
