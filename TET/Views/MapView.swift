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
                .onAppear {
                    viewModel.requestLocationPermission()
                }
            
            LocationButton(.currentLocation) {
                viewModel.requestLocationPermission()
            }
            .foregroundColor(.primary)
            .cornerRadius(10)
            .labelStyle(.titleAndIcon)
            .symbolVariant(.fill)
            .tint(Color("AccentColor"))
            .padding(.bottom, 50)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
