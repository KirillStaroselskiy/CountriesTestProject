//
//  URLContainer.swift
//  Countries
//
//  Created by Kirill on 03/11/2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import Foundation


enum URLContainer {
    
    private static let baseUrl = "https://restcountries.eu/rest/v2/"

    enum Country {
        static let getAll = baseUrl.appending("all")
        //static let getByAlphaCode = baseUrl.appending("alpha/")

    }
}
