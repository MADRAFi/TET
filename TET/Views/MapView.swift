//
//  MapView.swift
//  TET
//
//  Created by MADRAFi on 11/09/2022.
//
import CoreLocationUI
import MapKit
import SwiftUI
import BottomSheet

struct MapView: View {
    @EnvironmentObject var currentTrack: TrackModel
    @StateObject private var viewModel = MapViewModel()
//    @State var showInfo: Bool = false   /// variable to show or hide InfoPanel for the waypoint
    @State var bottomSheetPosition: BottomSheetPosition = .hidden
    @State private var chosenlocation: Waypoint = Waypoint(id: UUID(), time: Date(), elevation: 0.0, coordinates: CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0), name: "", symbol: "", description: "")
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: currentTrack.waypoints,
                annotationContent: { location in
                    MapAnnotation(coordinate: location.coordinates) {
                        ZStack {
                            Image(getSymbolIcon(symbol: location.symbol))
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                        }
                        .onTapGesture(count: 1, perform: {
                            print("IT WORKS")
                            chosenlocation = location
                            bottomSheetPosition = .dynamicBottom
                        })
                        

                        
                    }
                
                }

            )
            
//                .ignoresSafeArea()
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
        .bottomSheet(
            bottomSheetPosition: $bottomSheetPosition,
            switchablePositions: [.dynamic],
            headerContent: {
                VStack(alignment: .leading) {
                    Text(chosenlocation.name.capitalized)
                        .font(.title)
                        .bold()
                    if bottomSheetPosition == .dynamicBottom {
                            Text("\(chosenlocation.coordinates.longitude)°  \(chosenlocation.coordinates.latitude)° ")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                    }
                    
                    Divider()
                        .padding(.trailing, -30)
                }
                .padding([.top, .leading])
            },
            mainContent: { WaypointInfo(location: chosenlocation) }
            
        )
        .onDismiss {
            bottomSheetPosition = .hidden
        }
        .showCloseButton(true)
        .enableTapToDismiss(true)
        
        .navigationBarTitleDisplayMode(.inline)

    }
    
    func getSymbolIcon(symbol: String) -> String {
        var symbol_icon: String
        
        switch symbol {
        case "Airport", "Anchor Prohibited", "Anchor", "Bait and Tackle", "Ball Park", "Block, Red":
            symbol_icon = "Flag Red"
        case "Blood Trail", "Bridge", "Car", "Controlled Area", "Danger Area", "Diamond, Red", "Dropoff":
            symbol_icon = "Flag Red"
        case "Flag", "Pin, Red":
            symbol_icon = "Flag Red"
            
        case "Beacon", "Bell", "Bike Trail", "Blind", "Block, Blue", "Boat Ramp", "Building", "Buoy, White":
            symbol_icon = "Flag Blue"
        case "Car Rental", "Civil", "Coast Guard", "Dam", "Diamond, Blue", "Exit", "Pin, Blue":
            symbol_icon = "Flag Blue"
            
        case "Bowling", "Circle with X", "City Hall", "Cover", "Covey", "Department Store", "Diamond, Green":
            symbol_icon = "Flag Green"
        case "Dot, White", "Fishing Area", "Fishing Hot Spot Facility", "Fitness Center", "Food Source":
            symbol_icon = "Flag Green"
        case "Pin, Green":
            symbol_icon = "Flag Green"
        default:
            symbol_icon = symbol.replacingOccurrences(of: ",", with: "")
        }
//        symbol_icon = symbol.replacingOccurrences(of: ",", with: "")
        return symbol_icon
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(TrackModel(file: "PL.gpx"))
    }
}
