//
//  ContentView.swift
//  TET
//
//  Created by MADRAFi on 11/09/2022.
//

import CoreGPX
import SwiftUI

struct CountryView: View {
    
    @State var country: Country
    @StateObject var currentTrack: TrackModel = TrackModel()
    let formatter = DateFormatter()
    
//    init(code: String) {
////        formatter.dateStyle = .short
////        formatter.dateFormat = "dd/MM/yyyy HH:MM"
//        currentTrack.loadTrack(code: code)
//    }
//
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
            .onAppear {
                currentTrack.isLoading = true
                currentTrack.loadTrack(file: country.file)
            }
            .navigationTitle(LocalizedStringKey(country.name))
            
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
                                    .font(.caption2)
                                Spacer()
                                Text("\(String(Int(round(track.distance / 1000)))) km")
                                    .font(.caption2)
                            }
                            .padding(.vertical, 3)
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
            .onAppear {
                formatter.dateStyle = .short
                formatter.dateFormat = "dd/MM/yyyy HH:MM"
            }
            .padding()
//            .navigationTitle(country.name)
            .navigationTitle(LocalizedStringKey(country.name))

        }


    }


    
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView(country: Country(name:"Poland", code: "PL", file: "pl.gpx"))
    }
}

