//
//  LocationViewController.swift
//  Molitva
//
//  Created by Dimash Nsanbaev on 1/22/23.
//

import UIKit
import SnapKit
import CoreLocation

class LocationViewController: UIViewController,CLLocationManagerDelegate{
    
    let locationManager = CLLocationManager()

    var arr = ["Almaty","Atyrau","Astana","Mangystau","Aktobe","Oral","Karaganda","Shymkent","Zhambyl","Kyzylorda","Kostanay","Petropavol","Pavlodar"]
    private let table:UITableView = {
        let tab = UITableView()
        tab.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tab
        
    }()
    
    @objc func currentLoc(){
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(table)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "location", image: UIImage(systemName: "location"), target: self, action:#selector(currentLoc))
        table.delegate = self
        table.dataSource = self
        setupConst()
        
       
//        DispatchQueue.global().async {
//            self.locationManager.requestAlwaysAuthorization()
//            self.locationManager.requestWhenInUseAuthorization()
//            if CLLocationManager.locationServicesEnabled() {
//                self.locationManager.delegate = self
//                self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
//                self.locationManager.startUpdatingLocation()
//                
//            }
//        }
    }
    
//
    
    func setupConst(){
        table.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}

extension LocationViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(arr[indexPath.row])")
//        print("\(arr[0])")
//        ["Almaty","Atyrau","Astana","Aktau","Aktobe","Shymkent","Karaganda","Semey"]
        
        
        switch arr[indexPath.row]{
        case "Almaty":
            TimeViewController.city.setTitle("\(arr[0])", for: .normal)
            Manager.lat = 43.238293
            Manager.ln = 76.945465
            print("ALA")
        case "Atyrau":
            TimeViewController.city.setTitle("\(arr[1])", for: .normal)
            Manager.lat = 51.133333
            Manager.ln = 71.433333
            print("GUW")

        default:print("No")
        }
    }
    
    
}
