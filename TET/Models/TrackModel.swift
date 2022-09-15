//
//  TrackModel.swift
//  TET
//
//  Created by MADRAFi on 13/09/2022.
//
import CoreGPX
import MapKit
import Foundation

struct TrackDistance {
    var id = UUID().uuidString
    var name: String = ""
    var distance: Double = 0.0
}
class TrackModel: ObservableObject {
    
    let urlString: String = "https://transeurotrail.org/wp-content/uploads/gpxsync/PL.gpx"
    @Published var tracks = [GPXTrack]()
    @Published var waypoints = [GPXWaypoint]()
//    @Published var metadata = GPXMetadata()
    @Published var trackDistances: [TrackDistance] = []
    @Published var totalDistance: Double = 0.0
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
                self.calculateTrackDistance()
                self.isLoading = false
            }
            
        }.resume()

    }

    func calculateTrackDistance() {
        var index: Int = 0
        var pointDistance: Double = 0.0
        var segmentDistance: Double = 0.0
        var totalDistance: Double = 0.0
        
        for track in tracks {
            for segment in track.segments {
                segmentDistance = 0.0
                index = 0
                for _ in 1...segment.points.count - 1 {
                    let start = segment.points[index]
                    let end = segment.points[index+1]
                    let coordinate1 = CLLocation(latitude: start.latitude ?? 0.0, longitude: start.longitude ?? 0.0)
                    let coordinate2 = CLLocation(latitude: end.latitude ?? 0.0, longitude: end.longitude ?? 0.0)
                    pointDistance = coordinate1.distance(from: coordinate2)
                    segmentDistance += pointDistance
//                    print("Point: \(pointDistance)")
                    index += 1
                }
                trackDistances.append(TrackDistance(name: track.name ?? "track", distance: segmentDistance))
//                print("Segment: \(segmentDistance)")
            }
            totalDistance += segmentDistance
        }
        self.totalDistance = totalDistance
    }
    
    
//    func draw() {
//
//    }
    
    
}
