//
//  Api.swift
//  Countries
//
//  Created by Kirill on 03.09.2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Api{
    
    
    func gatAllCountries(completion: @escaping ([Country]) -> Void){
        request(URLContainer.Country.getAll).responseData{ response in
           
            guard let data = response.value else { return }
           
            let json  = try! JSON(data: data)
            var сountries = [Country]()
            
            сountries = json.compactMap{ Country(json: $0.1) }
            completion(сountries)
        }
    }
    
}
