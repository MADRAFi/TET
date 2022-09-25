//
//  CountryDetailView.swift
//  TET
//
//  Created by MADRAFi on 18/09/2022.
//

import SwiftUI

struct CountryDetailView: View {
    
    @State var country: Country
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    List {
                        Section(header: Text("Overview")) {
                            Text(country.overview)
                                .padding()
                        }
                    }
                    .tabItem {
                        Image(systemName: "info.square")
                            .font(Font.system(.title))
                    }
                    List {
                        Section(header: Text("Details")) {
                            HStack {
                                Text("Entry")
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(country.entry_point)
                            }
                            HStack {
                                Text("Exit")
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(country.exit_point)
                            }
                            HStack {
                                Text("Drive side")
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(country.drive_side)
                            }
                            HStack {
                                Text("Currency")
                                    .fontWeight(.semibold)
                                Spacer()
                                Text(country.currency)
                            }
                        }
                        Section(header: Text("Languages")) {
                            Text(country.languages)
                        }
                        Section(header: Text("Emergency")) {
                            Text(country.emergency)
                        }
                        Section(header: Text("Best Time")) {
                            Text(country.best_time)
                        }
                        Section(header: Text("Trial Riding")) {
                            Text(country.trial_riding)
                        }
                        Section(header: Text("Wild Camping")) {
                            Text(country.wild_camping)
                        }
                        Section(header: Text("Not to Miss")) {
                            Text(country.not_miss)
                        }
                        Section(header: Text("Events")) {
                            if (country.bike_events.first == "") {
                                Text("No info about events")
//                                    .padding()
                            } else {
                                VStack(alignment: .leading) {
                                    ForEach(country.bike_events, id: \.self) { event in
                                        Text(event)
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        }
                        Section(header: Text("Resources")) {
                            if (country.resources.first == "") {
                                Text("No info about resources")
                                    .padding()
                            } else {
                                VStack(alignment: .leading) {
                                    ForEach(country.resources, id: \.self) { resource in
                                        Text(resource)
                                            .padding(.vertical, 5)
                                            .padding(.horizontal, 10)
                                    }
                                }
                            }
                        }
                        
                    }
                    .listStyle(.insetGrouped)
                    
                    .tabItem {
                        Image(systemName: "books.vertical")
                            .font(Font.system(.title))
                    }
                }
            }
        }
//        .navigationTitle(LocalizedStringKey(country.name))
    }

}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: Country.example)
    }
}
