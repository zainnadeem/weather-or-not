//
//  ForecastTableViewController.swift
//  C4QWeather
//
//  Created by Zain Nadeem on 5/22/17.
//  Copyright © 2017 Zain Nadeem. All rights reserved.
//

import UIKit


let dayTableViewCellIdentifier = "DayTableViewCellIdentifier"

class ForecastTableViewController: UITableViewController {
    
    lazy var days = [Day]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        AriesApiClient.getLocationsWithCompletion { (days, error) in
            self.days = days
        }
        self.tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: dayTableViewCellIdentifier)

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return days.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: dayTableViewCellIdentifier, for: indexPath) as! ForecastTableViewCell
        cell.day = days[indexPath.row]
        
        return cell
    }




}
