//
//  BoekenViewController.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

import UIKit

class BoekenViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var boeken: [Boek]!
    
    var gemeente: String!
    override func viewDidLoad() {
        title = gemeente
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "toonBoek"?:
            let boekViewController = segue.destination as! BoekViewController
            let selection = tableView.indexPathForSelectedRow!
            boekViewController.boek = boeken[selection.row]
            tableView.deselectRow(at: selection, animated: true)
        default:
            fatalError("Unknown segue")
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if !splitViewController!.isCollapsed {
            navigationItem.leftBarButtonItem = splitViewController!.displayModeButtonItem
        }
    }
}

extension BoekenViewController: UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return boeken.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "boekCell", for: indexPath) as! BoekCell
        cell.boek = boeken[indexPath.row]
        return cell
    }
    
}

