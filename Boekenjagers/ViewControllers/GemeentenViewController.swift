//
//  GemeentenViewController.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

import Foundation
import UIKit

class GemeentenViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var gemeenten: [String] = []
    
    var boeken: [Boek] = [
        Boek(titel: "stolen", auteur: "lesley", opmerking: "Ligt achter de hoek", locatie: Locatie(straat: "Eiklaan", nummer: "23", postcode: 1600, gemeente: "SPL")),
        Boek(titel: "Harry Potter", auteur: "J.K. Rowling", opmerking: "Hoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mijHoog en droog vind je mij", locatie: Locatie(straat: "Esdoornlaan", nummer: "1234", postcode: 1600, gemeente: "Halle")),
        Boek(titel: "Programmeren", auteur: "Jakkes", opmerking: "Zoek het niet te ver", locatie: Locatie(straat: "Dries", nummer: "57", postcode: 1600, gemeente: "Nieuwerkerken")),
        Boek(titel: "Lotte Jespers", auteur: "J.K. Rowling", opmerking: "Hoog en droog vind je mij", locatie: Locatie(straat: "Esdoornlaan", nummer: "1234", postcode: 1600, gemeente: "Halle")),
        Boek(titel: "Ontwerpen", auteur: "Jakkes", opmerking: "Zoek het niet te ver", locatie: Locatie(straat: "Dries", nummer: "57", postcode: 1600, gemeente: "Nieuwerkerken"))
    ]
    
    override func viewDidLoad() {
        uniekeGemeenten()
        splitViewController!.delegate = self
    }
    
    private var indexPathToEdit: IndexPath!
    
    func uniekeGemeenten(){
        var alleGemeenten: [String] = []
        for boek in boeken {
            alleGemeenten.insert(boek.locatie.gemeente, at: 0)
        }
        gemeenten = Array(Set(alleGemeenten))
    }
    
    func boekenPerGemeente(voor: String)-> [Boek]{
        var boekenPerGemeente: [Boek] = []
        
        for boek in boeken {
            if(boek.locatie.gemeente == voor){
                boekenPerGemeente.insert(boek, at: 0)
            }
        }
        return boekenPerGemeente
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "nieuwBoek"?:
            break
        case "toonBoeken"?:
            let boekenViewController = (segue.destination as! UINavigationController).topViewController as! BoekenViewController
            let selection = collectionView.indexPathsForSelectedItems!.first!
            boekenViewController.boeken = boekenPerGemeente(voor: gemeenten[selection.item])
            boekenViewController.gemeente = gemeenten[selection.item]
        default:
            fatalError("Unknown segue")
        }
    }
    
    @IBAction func unwindFromAddBoek(_ segue: UIStoryboardSegue) {
        switch segue.identifier {
        case "didAddBoek"?:
            let nieuwBoekViewController = segue.source as! NieuwBoekViewController
            boeken.append(nieuwBoekViewController.boek!)
            // let selection = collectionView.indexPathsForSelectedItems!.first!
            uniekeGemeenten()
            collectionView.reloadData()
        case "didFoundBoek"?:
            let boekViewcontroller = segue.source as! BoekViewController
            let index = boeken.index(where: {$0 === boekViewcontroller.boek!})
            boeken.remove(at: index!)
            uniekeGemeenten()
            collectionView.reloadData()
        default:
            fatalError("Unknown segue")
        }
    }
}

extension GemeentenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gemeenten.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gemeenteCell", for: indexPath) as! GemeenteCell
        cell.gemeente = gemeenten[indexPath.item]
        return cell
    }
    
}
extension GemeentenViewController: UISplitViewControllerDelegate {
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        // Do not collapse when the boeken view controller is showing, only when the empty view controller is showing.
        let isShowingBoeken = (secondaryViewController as? UINavigationController)?.topViewController is BoekenViewController
        return !isShowingBoeken
    }
}
