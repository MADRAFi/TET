//
//  MapView.swift
//  TET
//
//  Created by MADRAFi on 11/09/2022.
//
import CoreLocationUI
import MapKit
import SwiftUI

struct MapView: View {
//    @StateObject private var viewModel = MapViewModel()
    @State var region: MKCoordinateRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    var location: CLLocationCoordinate2D?
    @State var locationManager = CLLocationManager()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $region, showsUserLocation: true)
                .edgesIgnoringSafeArea(.all)
            
            LocationButton(.currentLocation) {
                // Start updating location when user taps the button.
                // Location button doesn't require the additional step of calling `requestWhenInUseAuthorization()`.
                locationManager.activityType = .automotiveNavigation
                locationManager.startUpdatingLocation()
//                locationManager.startUpdatingHeading()

            }.foregroundColor(Color.white)
                .cornerRadius(27)
                .frame(width: 210, height: 54)
                .padding(.bottom, 30)
        }
//    }
        
        
//        ZStack(alignment: .bottom) {
//            Map(coordinateRegion: $region, showsUserLocation: true)
//                .ignoresSafeArea()
//                .accentColor(Color("PositionColor"))
//
//
//            LocationButton(.currentLocation) {
//                viewModel.requestLocationPermission()
//            }
//            LocationButton(action: viewModel.requestLocationPermission)
//            LocationButton(.currentLocation) {
                // Start updating location when user taps the button.
                // Location button doesn't require the additional step of calling `requestWhenInUseAuthorization()`.
//                manager.startUpdatingLocation()
//                locationManager.startUpdatingLocation()
//            }
//                .foregroundColor(.primary)
//                .cornerRadius(10)
//                .labelStyle(.titleAndIcon)
//                .symbolVariant(.fill)
//                .tint(Color("AccentColor"))
//                .padding(.bottom, 50)
            

//        }
//        .onAppear {
//            viewModel.requestLocationPermission()
//        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
