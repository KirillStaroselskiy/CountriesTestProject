//
//  CountryTabelViewCell.swift
//  Countries
//
//  Created by Kirill on 04/11/2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

var nib = UINib(nibName: "CountryTabelView", bundle: nil)

class CountryTabelViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nativeName: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func fillCell(country: Country) {
        
        self.name.text = country.name
        self.nativeName.text = country.nativeName
    }
    
}
