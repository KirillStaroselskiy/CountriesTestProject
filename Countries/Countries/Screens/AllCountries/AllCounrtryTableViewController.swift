//
//  AllCounrtryTableViewController.swift
//  Countries
//
//  Created by Kirill on 03.09.2018.
//  Copyright © 2018 Kirill. All rights reserved.
//

import UIKit

class AllCounrtryTableViewController: UITableViewController {
    
    var api = Api()
    var countries = [Country]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataFromApi()
        navigationTitleAndRegistrationNib()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataFromApi(){
        api.gatAllCountries { [weak self] countries in
            self?.countries = countries
            self?.tableView.reloadData()
        }
    }
    
    func navigationTitleAndRegistrationNib() {
        let title = "All Countries"
        self.navigationItem.title = title
        
        tableView.register(nib, forCellReuseIdentifier: "countries")
        tableView.rowHeight = UITableView.automaticDimension
        
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countries", for: indexPath) as! CountryTabelViewCell
        
        let country = countries[indexPath.row]
        cell.fillCell(country: country)
        
        return cell
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "border", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "border" {
            let selectedCountryVC = segue.destination as? BorderCountriesTableViewController
            
            let country = countries[(tableView.indexPathForSelectedRow?.row)!]

            selectedCountryVC?.countries = self.countries
            selectedCountryVC?.SearchBorderCountry(country: country)
            
            
        }
    }
    
}
