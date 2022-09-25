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
//                var waypoint: CLLocationCoordinate2D = CLLocationCoordinate2D()
//                    waypoint.latitude = location.latitude
//                    waypoint.longitude = location.longitude

                    MapAnnotation(coordinate: location.coordinates) {
                        Image(getSymbolIcon(symbol: location.symbol))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                        
                    }
                    
                }
            )
            
                .ignoresSafeArea()
                .accentColor(Color("PositionColor"))

//            Button(action: viewModel.startUpdatingLocation) {
//                Image(systemName: "mappin.square")
//                    .font(.largeTitle)
//                    .padding()
//
//            }
//            .background(Color("AccentColor"))
//            .foregroundColor(.primary)
//            .padding()
//            .cornerRadius(20)
            

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
    
    func getSymbolIcon(symbol: String) -> String {
        var symbol_icon: String
        
//        switch symbol {
//        case "Beach":
//                symbol_icon = "Beach"
//        case "Campground":
//                symbol_icon = "Campground"
//        case "Flag, Blue":
//                symbol_icon = "Flag Blue"
//        case "Gas Station":
//                symbol_icon = "Gas Station"
//        case "Information":
//                symbol_icon = "Information"
//        case "Lodging":
//                symbol_icon = "Lodging"
//        case "Museum":
//                symbol_icon = "Museum"
//        case "Restaurant":
//                symbol_icon = "Restaurant"
//        case "Scenic Area":
//                symbol_icon = "Scenic Area"
//        case "Shoping Center":
//                symbol_icon = "Shoping Center"
//        case "Toll Booth":
//                symbol_icon = "Toll Booth"
//        default:
//            symbol_icon = "Flag Red"
//        }
        symbol_icon = symbol.replacingOccurrences(of: ",", with: "")
        return symbol_icon
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
