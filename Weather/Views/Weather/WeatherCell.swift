//
//  WeatherCell.swift
//  Weather
//
//  Created by Chris Boshoff on 2022/10/26.
//

import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var highTempLabel: UILabel!
    @IBOutlet var LowTempLabel: UILabel!
    @IBOutlet var iconImageView: UIImageView!
    
    var weatherToDisplay = [Daily]()
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    static let identifier = "WeatherCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "WeatherCell", bundle: nil)
    }
    
    func configure(with model: Daily) {
        self.highTempLabel.text = "\(Int((model.temp?.max)!))°"
        self.LowTempLabel.text = "\(Int((model.temp?.min)!))°"

        switch model.weather![0].icon {
        case "01d":
            self.iconImageView.image = UIImage(systemName: "sun.max.fill")
        case "02d":
            self.iconImageView.image = UIImage(systemName: "cloud.sun")
        case "03d":
            self.iconImageView.image = UIImage(systemName: "smoke")
        case "04d":
            self.iconImageView.image = UIImage(systemName: "sun.max.fill")
        case "09d":
            self.iconImageView.image = UIImage(systemName: "cloud.drizzle.fill")
        case "10d":
            self.iconImageView.image = UIImage(systemName: "cloud.sun.rain")
        case "11d":
            self.iconImageView.image = UIImage(systemName: "cloud.bolt")
        case "13d":
            self.iconImageView.image = UIImage(systemName: "cloud.snow")
        case "50d":
            self.iconImageView.image = UIImage(systemName: "cloud.fog")
        default:
            self.iconImageView.image = UIImage(systemName: "cloud.drizzle")
            
        }
        
        // TODO: Format current date
        self.dayLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt!)))
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: inputDate)
    }
    
}
