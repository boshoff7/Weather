//
//  HourlyWeatherCellCollectionViewCell.swift
//  Weather
//
//  Created by Chris Boshoff on 2022/10/27.
//

import UIKit

class HourlyWeatherCell: UICollectionViewCell {
    
    static let identifier = "HourlyWeatherCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "HourlyWeatherCell", bundle: nil)
    }
    
    @IBOutlet var iconImageView : UIImageView!
    @IBOutlet var tempLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    
    func configure(with model: Hourly) {
        self.tempLabel.text = "\(Int(model.temp ?? 0))°"
        self.timeLabel.text = getDayForDate(Date(timeIntervalSince1970: Double(model.dt ?? 0)))
        
        self.iconImageView.contentMode = .scaleAspectFit
        self.iconImageView.tintColor   = .label
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
    }
    
    func getDayForDate(_ date: Date?) -> String {
        guard let inputDate = date else { return "" }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "E' 'HH:mm"
        return formatter.string(from: inputDate)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
