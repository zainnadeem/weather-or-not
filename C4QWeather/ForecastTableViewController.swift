//
//  ForecastTableViewController.swift
//  C4QWeather
//
//  Created by Zain Nadeem on 5/22/17.
//  Copyright © 2017 Zain Nadeem. All rights reserved.
//

import UIKit


let dayTableViewCellIdentifier = "DayTableViewCellIdentifier"

class ForecastTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var days = [Day]()
    lazy var navBar : NavBarView = NavBarView(withView: self.view, rightButtonImage: nil, leftButtonImage: nil, middleButtonImage: nil)
    lazy var tableView: UITableView = UITableView()
    var scaleSetting: scale = .Fahrenheit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navBar.rightButton.title = "☀️"
        navBar.leftButton.title = "(F)"
        navBar.middleButton.title = "Weather Forecast"
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        navBar.delegate = self
        
        setUpView()

        self.tableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: dayTableViewCellIdentifier)
        
        AriesApiClient.getDaysWithCompletion { (days, error) in
            self.days = days
            self.tableView.reloadData()
        }


    }
    
    func setUpView(){
            
            self.view.addSubview(navBar)
            
            self.view.addSubview(tableView)
            tableView.snp.makeConstraints { (make) in
                make.top.equalTo(navBar.snp.bottom)
                make.bottom.equalToSuperview()
                make.leading.equalToSuperview()
                make.trailing.equalToSuperview()
            }
    }

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return days.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = self.tableView.dequeueReusableCell(withIdentifier: dayTableViewCellIdentifier, for: indexPath) as! ForecastTableViewCell
        cell.scale = scaleSetting
        cell.day = days[indexPath.row]
        
        return cell
    }
 
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  self.view.bounds.width / 4
    }



}

//NavBar
extension ForecastTableViewController : NavBarViewDelegate {
    
    func rightBarButtonTapped(_ sender: AnyObject) {
   
    }
    
    func leftBarButtonTapped(_ sender: AnyObject) {
        
        if scaleSetting == scale.Fahrenheit {
            
            navBar.leftButton.title = ("(C)")
            scaleSetting = scale.Celsius
            
        }else{
            navBar.leftButton.title = ("(F)")
            scaleSetting = scale.Fahrenheit
        }
        
        self.tableView.reloadData()
    }
    
    func middleBarButtonTapped(_ Sender: AnyObject) {
        let index = IndexPath(row: 0, section: 0)
        self.tableView.scrollToRow(at: index, at: .top, animated: true)
    }
    
}
