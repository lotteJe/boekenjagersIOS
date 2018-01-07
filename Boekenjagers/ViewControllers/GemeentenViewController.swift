//
//  GemeentenViewController.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class GemeentenViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var gemeenten: [String] = []
    
    var boeken: Results<Boek>!
    
    override func viewDidLoad() {
        title = "Boekenjagers"
       // initDummyData()
        boeken = try! Realm().objects(Boek.self)
        uniekeGemeenten()
        splitViewController!.delegate = self
    }
    
    func uniekeGemeenten(){
        var alleGemeenten: [String] = []
        for boek in boeken {
            alleGemeenten.insert((boek.locatie?.gemeente.lowercased())!, at: 0)
        }
        gemeenten = Array(Set(alleGemeenten)).sorted()
    }
    
    func boekenPerGemeente(voor: String)-> [Boek]{
        var boekenPerGemeente: [Boek] = []
        
        for boek in boeken {
            if(boek.locatie!.gemeente.lowercased() == voor){
                boekenPerGemeente.insert(boek, at: 0)
            }
        }
        let sortedBoekenPerGemeente = boekenPerGemeente.sorted(by:{ $0.titel < $1.titel })
        return sortedBoekenPerGemeente
    }
    func initDummyData(){
        let locatie1 = Locatie(straat: "Eiklaan", nummer: "23", postcode: 1600, gemeente: "Sint-Pieters-Leeuw")
        let boek1 = Boek(titel: "Stolen", auteur: "Lesley Pearse", opmerking: "Hoog en droog vind je mij", locatie: locatie1)
        let locatie2 = Locatie(straat: "Esdoornlaan", nummer: "34", postcode: 1600, gemeente: "Sint-Pieters-Leeuw")
        let boek2 = Boek(titel: "De helaasheid der dingen", auteur: "Dimitri Verhulst", opmerking: "Zoek goed", locatie: locatie2)
        let locatie3 = Locatie(straat: "Impeleer", nummer: "2", postcode: 1600, gemeente: "Sint-Pieters-Leeuw")
        let boek3 = Boek(titel: "Het diner", auteur: "Herman Koch", opmerking: "Voetjes onder tafel", locatie: locatie3)
        let locatie4 = Locatie(straat: "Galgstraat", nummer: "60", postcode: 1600, gemeente: "Sint-Pieters-Leeuw")
        let boek4 = Boek(titel: "Belle", auteur: "Lesley Pearse", opmerking: "Kijk goed rond in de hoogte", locatie: locatie4)
        let locatie5 = Locatie(straat: "Zilverhof", nummer: "18", postcode: 9000, gemeente: "Gent")
        let boek5 = Boek(titel: "Kartonnen dozen", auteur: "Tom Lanoye", opmerking: "Vergeet niet bij het papier te kijken", locatie: locatie5)
        let locatie6 = Locatie(straat: "Molenaarstraat", nummer: "3", postcode: 9000, gemeente: "Gent")
        let boek6 = Boek(titel: "Oorlogswinter", auteur: "Jan Telrouw", opmerking: "Brr even koud hier zo laag bij de grond", locatie: locatie6)
        let locatie7 = Locatie(straat: "Burgstraat", nummer: "10", postcode: 9000, gemeente: "Gent")
        let boek7 = Boek(titel: "Slaap!", auteur: "Annelies Verbeke", opmerking: "Zet je even neer om te dagdromen", locatie: locatie7)
        let locatie8 = Locatie(straat: "Korenmarkt", nummer: "1", postcode: 9000, gemeente: "Gent")
        let boek8 = Boek(titel: "Slecht", auteur: "Jan Simoen", opmerking: "Achter de boom", locatie: locatie8)
        let locatie9 = Locatie(straat: "Dries", nummer: "57", postcode: 9300, gemeente: "Aalst")
        let boek9 = Boek(titel: "Animal farm", auteur: "George Orwell", opmerking: "Je zoekt best in de hoogte", locatie: locatie9)
        let locatie10 = Locatie(straat: "Arbeidstraat", nummer: "14", postcode: 9300, gemeente: "Aalst")
        let boek10 = Boek(titel: "Karakter", auteur: "Ferdinand Bordewijk", opmerking: "Even zoeken..", locatie: locatie10)
        let locatie11 = Locatie(straat: "Kluisstraat", nummer: "4", postcode: 1500, gemeente: "Halle")
        let boek11 = Boek(titel: "Twilight", auteur: "Stephenie Meyer", opmerking: "Open je ogen", locatie: locatie11)
        let locatie12 = Locatie(straat: "Villalaan", nummer: "9", postcode: 1500, gemeente: "Halle")
        let boek12 = Boek(titel: "Blauwe plekken", auteur: "Anke de Vries", opmerking: "Ik lig op en bloot", locatie: locatie12)
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(boek1)
            realm.add(boek2)
            realm.add(boek3)
            realm.add(boek4)
            realm.add(boek5)
            realm.add(boek6)
            realm.add(boek7)
            realm.add(boek8)
            realm.add(boek9)
            realm.add(boek10)
            realm.add(boek11)
            realm.add(boek12)
        }
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
            let realm = try! Realm()
            try! realm.write {
                realm.add(nieuwBoekViewController.boek!)
            }
            uniekeGemeenten()
            collectionView.reloadData()
        case "didFoundBoek"?:
            let boekViewcontroller = segue.source as! BoekViewController
            let boek = boekViewcontroller.boek!
            let realm = try! Realm()
            try! realm.write {
                realm.delete(boek)
            }
            //boeken.remove(at: index!)
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
