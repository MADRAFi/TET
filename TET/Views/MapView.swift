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
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color("PositionColor"))

            
//            LocationButton(.currentLocation) {
//                viewModel.requestLocationPermission()
//            }
//            LocationButton(action: viewModel.requestLocationPermission)
            LocationButton(LocationButton.Title.currentLocation) {
                // Start updating location when user taps the button.
                // Location button doesn't require the additional step of calling `requestWhenInUseAuthorization()`.
//                manager.startUpdatingLocation()
                viewModel.startUpdatingLocation()
            }
//                .foregroundColor(.primary)
//                .cornerRadius(10)
//                .labelStyle(.titleAndIcon)
//                .symbolVariant(.fill)
//                .tint(Color("AccentColor"))
//                .padding(.bottom, 50)
            

        }
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
