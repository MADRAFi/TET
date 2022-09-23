//
//  ContentView.swift
//  TET
//
//  Created by MADRAFi on 23/09/2022.
//

import SwiftUI
import CoreLocationUI
import MapKit

struct ContentView: View {
    
    @StateObject var locationManager = MapViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if let location = locationManager.location {
                    Text("**Current location:** \(location.latitude), \(location.longitude)")
                        .font(.callout)
                        .foregroundColor(.white)
                        .padding()
                        .background(.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }

                Spacer()
                LocationButton {
                    locationManager.startUpdatingLocation()
                }
                .frame(width: 180, height: 40)
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
            }
            .padding()
        }
    }
}
