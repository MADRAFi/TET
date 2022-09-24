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
//    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var currentTrack: TrackModel
    @StateObject private var viewModel = MapViewModel()

    

    
    
    var body: some View {
        
        
        ZStack(alignment: .bottom) {
//            Map(coordinateRegion: $viewModel.region ,showsUserLocation: true)
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: currentTrack.waypoints,
                annotationContent: { location in
                var waypoint: CLLocation
                    waypoint.coordinate.latitude = location.latitude
                    waypoint.coordinate.longitude = location.longitude
                
                    MapAnnotation(coordinate: waypoint) {
                        Image(systemName: "mappin")
                    }
                }
            )
//                .ignoresSafeArea()
                .accentColor(Color("PositionColor"))

            Button(action: viewModel.startUpdatingLocation) {
                Image(systemName: "mappin.square")
                    .font(.largeTitle)
                    .padding()

            }
            .background(Color("AccentColor"))
            .foregroundColor(.primary)
            .padding()
            .cornerRadius(20)
            

//            .padding(.top, 50)
//            LocationButton(.currentLocation) {
//                viewModel.requestLocationPermission()
//            }
//            LocationButton(action: viewModel.requestLocationPermission)
//            LocationButton(.currentLocation) {
//                locationManager.startUpdatingLocation()
//            }
//                .foregroundColor(.primary)
//                .cornerRadius(10)
//                .labelStyle(.titleAndIcon)
//                .symbolVariant(.fill)
//                .tint(Color("AccentColor"))
//                .padding(.bottom, 50)
            

        }
        .navigationBarTitleDisplayMode(.inline)
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
