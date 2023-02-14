//
//  ViewController.swift
//  Molitva
//
//  Created by Dimash Nsanbaev on 1/13/23.
//
import SnapKit
import UIKit
import UserNotifications

class TimeViewController: UIViewController {
    var a = ""
    
    var manager = Manager()
    
    var dimash = [[String.SubSequence]]()
    
    private var label:UILabel = {
        let label = UILabel()
        return label
    }()
    
    static var backgroundImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "Image1")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    lazy var backView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 1
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.cgColor
        return view
    }()
    
    
    private let today:UILabel = {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont(name: "times", size: 23)
        label.text = dateFormatter.string(from: date)
        return label
        
    }()
    
    static var city:UIButton = {
        let label = UIButton()
        label.setTitle("", for: .normal)
        label.addTarget(self, action: #selector(changeLocation), for: .touchUpInside)
        return label
        
    }()
    
    
    private var fajr:UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont(name: "times", size: 25)
        label.alpha = 1
        return label
    }()
    
    lazy private var sunrise: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "times", size: 25)
        label.textColor = .label
        
        return label
    }()
    
    lazy private var dhuhr: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "times", size: 25)
        label.textColor = .label
        
        return label
    }()
    
    lazy private var asr: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "times", size: 25)
        label.textColor = .label
        
        return label
    }()
    lazy private var maghrib: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "times", size: 25)
        label.textColor = .label
        
        return label
    }()
    lazy private var isha: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "times", size: 25)
        label.textColor = .label
        
        return label
    }()
    
    @objc func didTaped(){
        let setVc = SettingsViewController()
        navigationController?.pushViewController(setVc, animated: true)
    }
    
    @objc func changeLocation(){
        let locVC = LocationViewController()
        navigationController?.pushViewController(locVC, animated: true)
    }
    
    // MARK: - notification
    
    func checkForPermission(){
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings{settings in
            switch settings.authorizationStatus{
            case .authorized:
                self.dispatchNotification()
            case .denied:
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert,.sound]){didAllow,error in
                    if didAllow{
                        self.dispatchNotification()
                    }
                }
            default:return
                
            }
        }
    }
    
    func dispatchNotification(){
        let fajrId = "fajrId"
        let sunriseId = "sunriseId"
        let dukhrId = "dukhrId"
        let asrId = "asrId"
        let maghribId = "maghribId"
        let ishaId = "ishaId"

        var title = "Time To Pray!"
        var body = ""
        
        print(self.dimash)
        
        let notificationCenter = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        
        let calendar = Calendar.current
        var fajrDC = DateComponents(calendar: calendar,timeZone: TimeZone.current)
        var sunriseDC = DateComponents(calendar: calendar,timeZone: TimeZone.current)
        var duhrDC = DateComponents(calendar: calendar,timeZone: TimeZone.current)
        var asrDC = DateComponents(calendar: calendar,timeZone: TimeZone.current)
        var maghribDC = DateComponents(calendar: calendar,timeZone: TimeZone.current)
        var ishaDC = DateComponents(calendar: calendar,timeZone: TimeZone.current)
        
        let hour1 = dimash[0][0]
        var min1 = dimash[0][1]
        let hour2 = dimash[1][0]
        var min2 = dimash[1][1]
        let hour3 = dimash[2][0]
        var min3 = dimash[2][1]
        let hour4 = dimash[3][0]
        var min4 = dimash[3][1]
        let hour5 = dimash[4][0]
        var min5 = dimash[4][1]
        let hour6 = dimash[5][0]
        var min6 = dimash[5][1]

        min1.removeLast()
        min2.removeLast()
        min3.removeLast()
        min4.removeLast()
        min5.removeLast()
        min6.removeLast()

        
        fajrDC.hour = Int(hour1)!
        fajrDC.minute = Int(min1)!
        sunriseDC.hour = Int(hour2)!
        sunriseDC.minute = Int(min2)!
        duhrDC.hour = Int(hour3)!
        duhrDC.minute = Int(min3)!
        asrDC.hour = Int(hour4)!
        asrDC.minute = Int(min4)!
        maghribDC.hour = Int(hour5)!
        maghribDC.minute = Int(min5)!
        ishaDC.hour = Int(hour6)!
        ishaDC.minute = Int(min6)!
        
      
        
        let fajrTrigger = UNCalendarNotificationTrigger(dateMatching: fajrDC, repeats: true)
        let sunriseTrigger = UNCalendarNotificationTrigger(dateMatching: sunriseDC, repeats: true)
        let duhrTrigger = UNCalendarNotificationTrigger(dateMatching: duhrDC, repeats: true)
        let asrTrigger = UNCalendarNotificationTrigger(dateMatching: asrDC, repeats: true)
        let maghribTrigger = UNCalendarNotificationTrigger(dateMatching: maghribDC, repeats: true)
        let ishaTrigger = UNCalendarNotificationTrigger(dateMatching: ishaDC, repeats: true)
        
        let fajrRequest = UNNotificationRequest(identifier: fajrId, content: content, trigger: fajrTrigger)
        let sunriseRequest = UNNotificationRequest(identifier: sunriseId, content: content, trigger: sunriseTrigger)
        let duhrRequest = UNNotificationRequest(identifier: dukhrId, content: content, trigger: duhrTrigger)
        let asrRequest = UNNotificationRequest(identifier: asrId, content: content, trigger: asrTrigger)
        let maghribRequest = UNNotificationRequest(identifier: maghribId, content: content, trigger: maghribTrigger)
        let ishaRequest = UNNotificationRequest(identifier: ishaId, content: content, trigger: ishaTrigger)
        
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [fajrId])
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [sunriseId])
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [dukhrId])
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [asrId])
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [maghribId])
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [ishaId])
        
        notificationCenter.add(fajrRequest)
        notificationCenter.add(sunriseRequest)
        notificationCenter.add(duhrRequest)
        notificationCenter.add(asrRequest)
        notificationCenter.add(maghribRequest)
        notificationCenter.add(ishaRequest)
        
        
        
        
    }
    // MARK: - MAIN
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(TimeViewController.backgroundImageView)
        view.addSubview(backView)
        view.addSubview(TimeViewController.city)
        view.addSubview(today)
        backView.addSubview(fajr)
        backView.addSubview(sunrise)
        backView.addSubview(dhuhr)
        backView.addSubview(asr)
        backView.addSubview(maghrib)
        backView.addSubview(isha)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "gear", image: UIImage(systemName: "gear"), target: self, action: #selector(didTaped))
        navigationController?.navigationBar.tintColor = .label
        
        manager.delegate = self
        manager.fetchRequest()
        
        setupConstraint()
        
        
        
    }
    
    private func setupConstraint(){
        TimeViewController.backgroundImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        today.snp.makeConstraints { make in
            make.top.equalTo(60)
            make.leading.equalToSuperview().inset(30)
        }
        TimeViewController.city.snp.makeConstraints { make in
            make.top.equalTo(90)
            make.leading.equalToSuperview().inset(30)
        }
        backView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(300)
            
        }
        fajr.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().inset(20)
        }
        sunrise.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(fajr.snp.bottom).offset(16)
        }
        dhuhr.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(sunrise.snp.bottom).offset(16)
        }
        asr.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(dhuhr.snp.bottom).offset(16)
        }
        maghrib.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(asr.snp.bottom).offset(16)
        }
        isha.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(20)
            make.top.equalTo(maghrib.snp.bottom).offset(16)
        }
        
        
    }
    
}

extension TimeViewController:ManagerDelegate{
    func didUpdate(_ manager: Manager, with model: Model) {
        DispatchQueue.main.async {
            self.fajr.text = "Fajr:                         \(model.Fajr)"
            self.sunrise.text = "Sunrise:                   \(model.Sunrise)"
            self.dhuhr.text = "Dhuhr:                     \(model.Dhuhr)"
            self.asr.text = "Asr:                          \(model.Asr)"
            self.maghrib.text = "Maghrib:                  \(model.Maghrib)"
            self.isha.text = "Isha:                         \(model.Isha)"
            TimeViewController.city.setTitle(model.city, for: .normal)
            self.dimash.append(model.Fajr.split(separator:":"))
            self.dimash.append(model.Sunrise.split(separator:":"))
            self.dimash.append(model.Dhuhr.split(separator:":"))
            self.dimash.append(model.Asr.split(separator:":"))
            self.dimash.append(model.Maghrib.split(separator:":"))
            self.dimash.append(model.Isha.split(separator:":"))
            self.checkForPermission()
            
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
