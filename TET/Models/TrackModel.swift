//
//  TrackModel.swift
//  TET
//
//  Created by MADRAFi on 13/09/2022.
//
import CoreGPX
import Foundation


class TrackModel: ObservableObject {
    
    let urlString: String = "https://transeurotrail.org/wp-content/uploads/gpxsync/PL.gpx"
    @Published var tracks = [GPXTrack]()
    @Published var waypoints = [GPXWaypoint]()
//    @Published var metadata = GPXMetadata()
    @Published var date = Date()
    @Published var isLoading: Bool = true
    
    init() {
        loadTrack()
    }
    
    func loadTrack() {
        let today = Date()
        guard let url: URL = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let gpx = GPXParser(withURL: url)?.parsedData() else { return }

            DispatchQueue.main.async {
                self.tracks = gpx.tracks
                self.waypoints = gpx.waypoints
                self.date = gpx.metadata?.time ?? today
                self.isLoading = false
            }
            
        }.resume()
        
        print("Track's date: \(self.date)")
    }
    
    
}
