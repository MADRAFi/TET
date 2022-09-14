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
    @Published var metadata = GPXMetadata()
    @Published var date = Date()
    

    
    init() {
//        super.init()
//        Task {
//            await loadTrack()
//        }
        loadTrack()
    }
    
    func loadTrack() {
        let today = Date()
        let url: URL = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: url) { data, _, error in
//        Task {
            guard let gpx = GPXParser(withURL: url)?.parsedData() else { return }
            
            self.tracks = gpx.tracks
            self.waypoints = gpx.waypoints
            //        self.metadata = gpx.metadata!
            self.date = gpx.metadata?.time ?? today
        }.resume()
        print("time: \(self.date)")
    }
    
    
}
