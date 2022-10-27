//
//  ViewController.swift
//  Weather
//
//  Created by Chris Boshoff on 2022/10/26.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
        
    @IBOutlet var tableView: UITableView!
    
    var models          = [Daily]()
    var model           : Daily?
    var hourlyModels    = [Hourly]()
    var currentLocation : CLLocation?
    var current         : Current?
    var weatherData     : WeatherData?
    let locationManager = CLLocationManager()
    let locationWeatherIcon = UIImageView()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(HourlyCell.nib(), forCellReuseIdentifier: HourlyCell.identifier)
        tableView.register(WeatherCell.nib(), forCellReuseIdentifier: WeatherCell.identifier)
        tableView.delegate   = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocation()
    }
    
    func  requestWeatherForLocation() {
        guard let currentLocation = currentLocation else { return }
        
        let long = currentLocation.coordinate.longitude
        let lat  = currentLocation.coordinate.latitude
        
        let url = "API_KEY"
        
        URLSession.shared.dataTask(with: URL(string: url)!) { data, response, error in
            guard let data = data, error == nil else { return }
            
            var json: WeatherData?
            do {
                json = try JSONDecoder().decode(WeatherData.self, from: data)
            } catch {
                print(error)
            }
            guard let result = json else { return }
            
            let entries = result.daily!
            
            self.models.append(contentsOf: entries)
            
            let current  = result.current
            self.current = current
            
            let weatherData  = result
            self.weatherData = weatherData

            self.hourlyModels = result.hourly!
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.tableView.tableHeaderView = self.createTableViewHeader()
            }
        }.resume()
    }

    func createTableViewHeader() -> UIView {
        let headerView = UIView(frame: CGRect(x     : 0,
                                              y     : 0,
                                              width : view.frame.size.width,
                                              height: view.frame.size.height/4))
        headerView.backgroundColor    = .clear
        headerView.layer.cornerRadius = 20
        
        let locationLabel = UILabel(frame: CGRect(x     : 10,
                                                  y     : 10,
                                                  width : headerView.frame.size.width-20,
                                                  height: headerView.frame.size.height/5))
        
        let summaryLabel = UILabel(frame: CGRect(x     : 10,
                                                 y     : 20+locationLabel.frame.size.height,
                                                 width : headerView.frame.size.width-20,
                                                 height: headerView.frame.size.height/5))
        
        let tempLabel = UILabel(frame: CGRect(x     : 10,
                                              y     : 20+locationLabel.frame.size.height+summaryLabel.frame.size.height,
                                              width : headerView.frame.size.width-20,
                                              height: headerView.frame.size.height/2))
        
        headerView.addSubview(locationLabel)
        headerView.addSubview(summaryLabel)
        headerView.addSubview(tempLabel)
        
        locationLabel.textAlignment = .center
        summaryLabel.textAlignment  = .center
        tempLabel.textAlignment     = .center
        
        summaryLabel.text  = self.current?.weather![0].description
        locationLabel.text = self.weatherData?.timezone
        tempLabel.text     = "\(Int(self.current!.temp ?? 00))°"
        
        tempLabel.font     = UIFont(name: "Helvetica-Bold", size: 50)
        summaryLabel.font  = UIFont(name: "Helvetica-Bold", size: 32)
        locationLabel.font = UIFont(name: "Helvetica-Bold", size: 20)
        
        tempLabel.backgroundColor     = .clear
        summaryLabel.backgroundColor  = .clear
        locationLabel.backgroundColor = .clear
        
        return headerView
    }

    func setupLocation() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HourlyCell.identifier, for: indexPath) as! HourlyCell
            cell.configure(with: hourlyModels)
            cell.backgroundColor = .clear
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.identifier, for: indexPath) as! WeatherCell
        cell.configure(with: models[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil {
            currentLocation = locations.first
            locationManager.stopUpdatingLocation()
            requestWeatherForLocation()
        }
    }
}

