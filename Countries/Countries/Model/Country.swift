//
//  Country.swift
//  Countries
//
//  Created by Kirill on 03.09.2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import Foundation
import SwiftyJSON
class Country {
    var name = String()
    var nativeName = String()
    var alpha3Code = String()
    var borders = [String]()
    convenience init(json: JSON) {
        self.init()
        
        self.name = json["name"].stringValue
        self.nativeName = json["nativeName"].stringValue
        self.alpha3Code = json["alpha3Code"].stringValue
        self.borders = json["borders"].arrayValue.compactMap({$0.string}) 
    }
}

