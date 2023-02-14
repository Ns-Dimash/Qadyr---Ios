//
//  Manager.swift
//  Molitva
//
//  Created by Dimash Nsanbaev on 1/13/23.
//

import Foundation
import CoreLocation


protocol ManagerDelegate{
    
    func didUpdate(_ manager:Manager,with model:Model)
        
    func didFailWithError(error:Error)
    
}



struct Manager{
    var delegate:ManagerDelegate?
    
    static var lat = 43.238293
    static var ln = 76.945465

     func fetchRequest(){
        
        let date = Date()
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "dd"

        let day = dateFormatter.string(from: date)
        let today = Int(day)!-1
        print(today)
        
//        let lat = LocationViewController().locationManager.location?.coordinate.latitude
//        let ln = LocationViewController().locationManager.location?.coordinate.longitude
//        print(lat!)
//        print(ln!)
        
// 1 link
        
//        let link = "https://namaz.muftyat.kz/kk/api/times/2023/\(lat!)/\(ln!)"
//         let link = "https://namaz.muftyat.kz/kk/api/times/2023/43.238293/76.945465"
         let link = "https://namaz.muftyat.kz/kk/api/times/2023/\(String(Manager.lat))/\(String(Manager.ln))"
         print(Manager.lat)
         print(Manager.ln)


//        "lng": "76.945465",
//        "lat": "43.238293",
// 2 link
        
//        let link = "https://api.muftyat.kz/cities/?page=2"
        
        guard let URL = URL(string: link) else { return }
        
        
        let task = URLSession.shared.dataTask(with: URL) { data, response, error in
            if let data,error == nil{
//                print(data)
                let decoder = JSONDecoder()
                do{
                    let decodedData = try decoder.decode(Response.self, from: data)
                    let cityName = decodedData.city_name
                    let fajr = decodedData.result[today].Fajr
                    let sunRise = decodedData.result[today].Sunrise
                    let dhuhr = decodedData.result[today].Dhuhr
                    let asr = decodedData.result[today].Asr
                    let maghrib = decodedData.result[today].Maghrib
                    let isha = decodedData.result[today].Isha
                    let model = Model(Fajr: fajr, Sunrise: sunRise, Dhuhr: dhuhr, Asr: asr, Maghrib: maghrib, Isha: isha,city: cityName)
                    delegate?.didUpdate(self, with: model)
                    
                    print("\(cityName),\(fajr),\(sunRise),\(dhuhr),\(asr),\(maghrib),\(isha)")
                    
//                    for i in decodedData.result{
//                        print(i)
//                    }
//                    print(decodedData.city_name)
//                    print(decodedData)
//                    print(decodedData.result[1].date)

//                    let JSONString = String(data: data, encoding: String.Encoding.utf8)
                }catch{
                    print("Nothing has been decoded! \(error)")
                    return
                }
            }else{
                print("Nothing has been retrived \(String(describing: error))")
            }
        }
        
        
        task.resume()
    }
}

//1 link

struct Response:Decodable{
    let result:[MyResult]
    let city_name:String

}
struct MyResult:Decodable{
    let Asr:String
    let Isha:String
    let Sunrise:String
    let Maghrib:String
    let date:String
    let Dhuhr:String
    let Fajr:String

}




//2 link

//struct Response:Decodable{
//    let results:[MyResult]
//
//    struct MyResult:Decodable{
//        let title:String
//        let lng:String
//        let lat:String
//        let timezone:String
//        let slug:String
     
//    }
//}

