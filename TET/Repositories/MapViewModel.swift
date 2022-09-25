//
//  MapViewModel.swift
//  TET
//
//  Created by MADRAFi on 11/09/2022.
//

import Foundation
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 52.302277871885885, longitude: 20.87165867103657)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
}
//enum WaypointSymbol {
//    static let Museum = "Museum"
//    static let Information = "Information"
//    static let Campground = "Campground"
////    static let "Square, Blue" = "Square"
////    "Scenic Area"
////    "Gas Station"
////    "Shopping Center"
//    static let Lodging = "Lodging"
//}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region: MKCoordinateRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    @Published var location: CLLocationCoordinate2D?

    var locationManager = CLLocationManager()

        override init() {
            super.init()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
//            locationManager.activityType = .automotiveNavigation

        }
    //    func checkLocationServiceIsEnabled() {
    ////        if CLLocationManager.locationServicesEnabled() {
    //            locationManager = CLLocationManager()
    //        locationManager.delegate = self
    //
    ////        } else {
    ////            print("Show alert that location is off")
    ////        }
    //    }
    
//    private func checkLocationAuthorization() {
//        //        guard let locationManager = locationManager else {
//        //            return
//        //        }
//        
//        switch locationManager.authorizationStatus {
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            print("Your location is restricted. Please authorize.")
//        case .denied:
//            print("You have denied this app location permission. Go into settings to change it.")
//        case .authorizedAlways, .authorizedWhenInUse:
//            //            region = MKCoordinateRegion(center: locationManager.location?.coordinate ?? MapDetails.startingLocation,
//            ////                                            locationManager.location?.coordinate ?? MapDetails.startingLocation),
//            //                                        span: MapDetails.defaultSpan)
//            break
//        @unknown default:
//            break
//        }
//    }
    
    func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
//        locationManager.startUpdatingHeading()
    }
    
    
    
    //    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    //        checkLocationAuthorization()
    //    }
    

//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
////                locations.last.map {
////                    region = MKCoordinateRegion(
////                        center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
////                        span: MapDetails.defaultSpan
////                    )
////                }
//
//        guard let latestLocation = locations.first else { return }
//
//        DispatchQueue.main.async {
//            self.location = latestLocation.coordinate
//            self.region = MKCoordinateRegion(center: latestLocation.coordinate, span: MapDetails.defaultSpan)
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error.localizedDescription)
//    }
}
