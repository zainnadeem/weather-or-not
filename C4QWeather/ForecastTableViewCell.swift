//
//  ForecastTableViewCell.swift
//  C4QWeather
//
//  Created by Zain Nadeem on 5/22/17.
//  Copyright © 2017 Zain Nadeem. All rights reserved.
//

import UIKit
import SnapKit

enum scale {
    case Fahrenheit
    case Celsius
}

enum weatherConditions: String {
    case Showers = "Showers"
    case ScatteredShowers = "Scattered Showers"
    case PartlyCloudy = "Partly Cloudy"
    case Sunny = "Sunny"
}

class ForecastTableViewCell: UITableViewCell {

    lazy var weatherImageView           : UIImageView = UIImageView()
    lazy var minTempLabel               : UILabel     = UILabel()
    lazy var maxTempLabel               : UILabel     = UILabel()
    lazy var dateLabel                  : UILabel     = UILabel()
    
    lazy var leftStackView              : UIStackView = UIStackView()
    lazy var rightStackView             : UIStackView = UIStackView()

    lazy var profileImageHeightMultiplier : CGFloat =      (0.5)
    
    var scale: scale!
    
    var day: Day! {
        didSet {
            self.updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        createStackViews()
        setViewConstraints()
        setViewProperties()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func updateUI(){

        self.dateLabel.text = day.dateTimeISO
        
        if scale.hashValue == 0 {

            minTempLabel.text = "Low: \(day.minTempF)"
            maxTempLabel.text = "High: \(day.maxTempF)"
            
        }else{
            minTempLabel.text = "Low: \(day.minTempC)"
            maxTempLabel.text = "High: \(day.maxTempC)"
        }
        
        
        switch day.weatherPrimary {
        case weatherConditions.PartlyCloudy.rawValue:
            weatherImageView.image = #imageLiteral(resourceName: "clouds")
        case weatherConditions.ScatteredShowers.rawValue:
            weatherImageView.image = #imageLiteral(resourceName: "umbrella")
        case weatherConditions.Showers.rawValue:
            weatherImageView.image = #imageLiteral(resourceName: "rain")
        default:
            print("didnt set image yet")
        }
        
        setImageViewCircular()
    }
    
    func setViewConstraints() {
        
        contentView.addSubview(weatherImageView)
        weatherImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
            make.width.equalTo(weatherImageView.snp.height)
            make.left.equalToSuperview().offset(10)
        }
        
        contentView.addSubview(leftStackView)
        leftStackView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.6)
            make.left.equalTo(weatherImageView.snp.right).offset(10)
        }
        
        contentView.addSubview(rightStackView)
        rightStackView.snp.makeConstraints { (make) in
            make.right.equalToSuperview().offset(-5)
            make.height.equalToSuperview().multipliedBy(0.6)
            make.centerY.equalToSuperview()
        }
  
        
    }
    
    func setViewProperties(){

        minTempLabel.textColor = .black
        maxTempLabel.textColor = .darkGray

    }
    
    func createStackViews(){
        leftStackView = UIStackView(arrangedSubviews: [dateLabel, minTempLabel, maxTempLabel])
        leftStackView.axis = .vertical
        leftStackView.distribution = .fillProportionally
        leftStackView.alignment = .leading
        

        
        rightStackView = UIStackView(arrangedSubviews: [])
        rightStackView.axis = .vertical
        rightStackView.distribution = .fillProportionally
        rightStackView.alignment = .center
        rightStackView.spacing = 2
    }
    
    func setImageViewCircular() {
        self.weatherImageView.contentMode = .scaleAspectFill
        self.weatherImageView.isUserInteractionEnabled = true
        self.weatherImageView.layer.cornerRadius = self.frame.height * profileImageHeightMultiplier / 2
        self.weatherImageView.clipsToBounds = true
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}

