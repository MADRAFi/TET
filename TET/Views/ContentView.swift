//
//  ContentView.swift
//  TET
//
//  Created by MADRAFi on 11/09/2022.
//

import CoreGPX
import SwiftUI

struct ContentView: View {
    
//    let urlString: String = "https://transeurotrail.org/wp-content/uploads/gpxsync/PL.gpx"
    @StateObject var currentTrack: TrackModel = TrackModel()
    let formatter = DateFormatter()
    
    init() {
        formatter.dateStyle = .short
        formatter.dateFormat = "dd/MM/yyyy HH:MM"
    }
    
//    func getWaypointSymbol(symbol: String) -> Image {
//        switch symbol {
//        case "Museum":
//            Image(
//        }
//    }
    
    var body: some View {
        if currentTrack.isLoading {
            VStack {
                ProgressView()
            }
        } else {
            List {
                Section(header: Text("Information")) {
                    VStack {
                        HStack {
                            Text("Date")
                            Spacer()
                            Text(formatter.string(from: currentTrack.date))
                            
                        }
                        HStack {
                            Text("Tracks")
                            Spacer()
                            Text(String(currentTrack.tracks.count))
                        }
                        HStack {
                            Text("Waypoints")
                            Spacer()
                            Text(String(currentTrack.waypoints.count))
                        }
                        HStack {
                            Text("Total Distance")
                            Spacer()
                            Text("\(String(Int(round(currentTrack.totalDistance / 1000)))) km")
                        }
                        ForEach(currentTrack.trackDistances, id: \.name) { track in
                            HStack {
                                Text(track.name)
                                Spacer()
                                Text("\(String(Int(round(track.distance / 1000)))) km")
                            }
                        }
                        //                List {
                        //                    ForEach(currentTrack.waypoints, id: \.name) { waypoint in
                        //                        HStack {
                        //                            Text(waypoint.symbol ?? "waypoint")
                        //                        }
                        //                    }
                        //                }
                        Spacer()
                    }
                    
                }
                
            }
            .padding()
//            .scrollDisabled(true)

        }
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
