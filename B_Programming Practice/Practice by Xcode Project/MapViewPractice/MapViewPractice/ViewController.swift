//
//  ViewController.swift
//  MapViewPractice
//
//  Created by Bo-Young PARK on 30/6/2017.
//  Copyright © 2017 Bo-Young PARK. All rights reserved.
//

import UIKit
import MapKit   //맵킷을 import 해야 맵에 대한 framework를 쓸 수 있다. (이 파일에 한해서)

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    /**************************************/
    //           IBOutlet | 전역변수         //
    /**************************************/
    @IBOutlet weak var mapView: MKMapView! //MK: MapKit
    
    lazy var locationManager:CLLocationManager = CLLocationManager()
    
    
    
    /**************************************/
    //              Life Cycle             //
    /**************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        let regionRadius: CLLocationDistance = 1000
        //        let location = CLLocation(latitude: 37.545824, longitude: 127.147042)
        //        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
        //        mapView.setRegion(coordinateRegion, animated: true)
        
        let location = CLLocation(latitude: 37.545824, longitude: 127.147042)
        let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        let coordinateRegion = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(coordinateRegion, animated: true)
        
        let newCoordinate = CLLocationCoordinate2DMake(37.545824, 127.147042) //내가 원하는 위치로 새롭게 coorinate 변수 설정
        let pin1 = MyAnnotation(coordinate: newCoordinate, title: "우리집", subtitle: "서울특별시 강동구") //Annotation Instance 생성
        
        mapView.addAnnotation(pin1)
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        mapView.showsUserLocation = true

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let nowlocation = locations.last {
            let nowLatitude = nowlocation.coordinate.latitude
            let nowLongtitude = nowlocation.coordinate.longitude
            print("\(nowLatitude), \(nowLongtitude)")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

