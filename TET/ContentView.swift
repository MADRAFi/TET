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
    var body: some View {
        if currentTrack.isLoading {
            VStack {
                ProgressView()
            }
        } else {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                
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
            }
            .padding()
        }
    }
    

    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
