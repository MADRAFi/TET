//
//  WaypointInfo.swift
//  TET
//
//  Created by MADRAFi on 26/09/2022.
//

import SwiftUI
import CoreLocation

struct WaypointInfo: View {
    @State var location: Waypoint
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Image(location.symbol)
                    .resizable()
                    .frame(width: 48, height: 48, alignment: .center)
                    .padding()
                VStack {

                    HStack {
                        Text("Longitude")
                        Spacer()
                        Text("\(location.coordinates.longitude)°")
                    }
                    HStack {
                        Text("Latitude")
                        Spacer()
                        Text("\(location.coordinates.latitude)°")
                    }
                    HStack {
                        Text("Elevation")
                        Spacer()
                        Text("\(Int(location.elevation))m")
                    }
                }
                
            }
            HStack {
                Text(location.description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer()
            }
        }
        .padding()
        .padding(.bottom, 30)
//        Spacer()
    }
}

struct WaypointInfo_Previews: PreviewProvider {
    
    static let location: Waypoint = Waypoint(time: Date(), elevation: 100, coordinates: CLLocationCoordinate2D(latitude: 20.91124, longitude: 52.18815), name: "Stacja Kontroli", symbol: "Car Repair", description: "Badania techniczne")
    
    static var previews: some View {
        WaypointInfo(location: location)
    }
}
