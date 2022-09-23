//
//  GPXTrackView.swift
//  TET
//
//  Created by MADRAFi on 17/09/2022.
//

import SwiftUI

struct GPXTrackView: View {
    
    @EnvironmentObject var currentTrack: TrackModel
    let formatter = DateFormatter()
    
    var body: some View {
        VStack {
            if currentTrack.isLoading {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                VStack {
                    HStack {
                        Text("Track Information")
                            .foregroundColor(.secondary)
                        Spacer()
                    }
                    .padding(.vertical, 5)
//                    .padding(.horizontal)
                    VStack {
                        HStack {
                            Text("Date")
                            Spacer()
//                            let d: Date = currentTrack.date
//                            let s: String = formatter.string(from: d)
//                            Text(s)
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
                                    .font(.caption)
                                Spacer()
                                Text("\(String(Int(round(track.distance / 1000)))) km")
                                    .font(.caption)
                            }
                            .padding(.vertical, 3)
                        }
                    }
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 15, style: .continuous)
                            .fill(.primary)
                            .opacity(0.1)
                    }
                }
            }
        }
        .padding()
        .onAppear {
            formatter.dateStyle = .short
//            formatter.dateFormat = "dd/MM/yyyy HH:MM"
        }
        Spacer()
    }
    
}


struct GPXTrackView_Previews: PreviewProvider {
    static var previews: some View {
        GPXTrackView()
            .environmentObject(TrackModel(file: Country.example.file))
    }
}
