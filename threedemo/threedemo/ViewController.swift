//
//  ViewController.swift
//  threedemo
//
//  Created by jujiakeji on 2019/5/17.
//  Copyright © 2019年 Soul. All rights reserved.
//

import UIKit
import CoreLocation
class ViewController: UIViewController,CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    let geocoder  = CLGeocoder()
    let locationLabel = UILabel()
    let locationStrLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgImageView = UIImageView(frame: self.view.bounds)
        let newImage = UIImage(named: "phoneBg")
        
        bgImageView.image = newImage
        self.view .addSubview(bgImageView)
        
        let blurEffect:UIBlurEffect = UIBlurEffect(style: .light)
        let blurView : UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        self.view .addSubview(blurView)
        
        locationManager.delegate = self
        locationLabel.frame = CGRect(x: 0, y: 50, width: self.view.bounds.width, height: 100)
        
        locationLabel.textAlignment = .center
        locationLabel.textColor = UIColor.white
        self.view.addSubview(locationLabel)
        
        let findMylocationBtn = UIButton(type: .custom)
        findMylocationBtn.frame = CGRect(x: 50, y: self.view.bounds.height-80, width: self.view.bounds.width-100, height: 50)
        findMylocationBtn.setTitle("Find My Position", for: UIControl.State.normal)
        findMylocationBtn .setTitleColor(UIColor.white , for: UIControl.State.normal)
        
        findMylocationBtn.addTarget(self, action: #selector(findMyLocation), for: UIControl.Event.touchUpInside)
        self.view.addSubview(findMylocationBtn)
        
    
    }
    @objc func findMyLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locations : NSArray = locations as NSArray
        let currentLocation = locations.lastObject as! CLLocation
        let locationStr = "lat:\(currentLocation.coordinate.latitude) lng:\(currentLocation.coordinate.longitude)"
        locationLabel.text = locationStr
        reverseGeocode(location:currentLocation)
        locationManager.stopUpdatingLocation()
    }
    
    func reverseGeocode(location:CLLocation) {
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if(error == nil) {
                let tempArray = placeMark! as NSArray
                let mark = tempArray.firstObject as! CLPlacemark
                //                now begins the reverse geocode
                let addressDictionary = mark.addressDictionary! as NSDictionary
                let country = addressDictionary.value(forKey: "Country") as! String
                let city = addressDictionary.object(forKey: "City") as! String
                let street = addressDictionary.object(forKey: "Street") as! String
                
                let finalAddress = "\(street),\(city),\(country)"
                self.locationStrLabel.text = finalAddress
                
            }
        }
    }

}

