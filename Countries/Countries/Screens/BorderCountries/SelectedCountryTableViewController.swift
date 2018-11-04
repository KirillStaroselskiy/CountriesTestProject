//
//  BorderCountriesTableViewController.swift
//  Countries
//
//  Created by Kirill on 04.09.2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

class BorderCountriesTableViewController: UITableViewController {

    var borderCountries = [Country]()
    var countries = [Country]()
    var countryName = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleAndRegistrationNib()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func navigationTitleAndRegistrationNib() {
        navigationItem.title = countryName
        
        tableView!.register(nib, forCellReuseIdentifier: "countries")
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func SearchBorderCountry(country: Country) {
        
        for cntr in countries{
            for borderCntr in country.borders{
                if cntr.alpha3Code == borderCntr{
                    borderCountries.append(cntr)
                }
            }
        }
        countryName = country.nativeName
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return borderCountries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "countries", for: indexPath) as! CountryTabelViewCell
        let borderCountry = borderCountries[indexPath.row]
        
        cell.fillCell(country: borderCountry)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
    }
}
