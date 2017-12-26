//
//  GemeenteCell.swift
//  Boekenjagers
//
//  Created by Lotte Jespers on 26/12/17.
//  Copyright © 2017 Lotte Jespers. All rights reserved.
//

import UIKit

class GemeenteCell: UICollectionViewCell {
    @IBOutlet weak var gemeenteLabel: UILabel!
    
    var gemeente: String!{
        didSet {
            gemeenteLabel.text = gemeente
        }
    }
    
    private func prepareView() {
        layer.cornerRadius = 8
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        prepareView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareView()
    }
}
