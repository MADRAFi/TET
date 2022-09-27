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
                            let markdown = try? AttributedString(markdown: country.overview)
                            Text(markdown ?? "unknown")
//                            Text(country.overview)
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
                            HStack {
                                Text("Contact")
                                    .fontWeight(.semibold)
                                Spacer()
                                let markdown = try? AttributedString(markdown: country.contact)
                                Text(markdown ?? "unknown")
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
                            let markdown = try? AttributedString(markdown: country.trial_riding)
                            Text(markdown ?? "unknown")
//                            Text(country.trial_riding)
                        }
                        Section(header: Text("Wild Camping")) {
                            let markdown = try? AttributedString(markdown: country.wild_camping)
                            Text(markdown ?? "unknown")
//                            Text(country.wild_camping)
                        }
                        Section(header: Text("Not to Miss")) {
                            let markdown = try? AttributedString(markdown: country.not_miss)
                            Text(markdown ?? "unknown")
//                            Text(country.not_miss)
                        }
                        Section(header: Text("Events")) {
                            if (country.bike_events.first == "") {
                                Text("No info about events")
//                                    .padding()
                            } else {
                                VStack(alignment: .leading) {
                                    ForEach(country.bike_events, id: \.self) { event in
                                        let markdown = try? AttributedString(markdown: event)
                                        Text(markdown ?? "uknown")
//                                        Text(event)
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
                                        let markdown = try? AttributedString(markdown: resource)
                                        Text(markdown ?? "unknown")
//                                        Text(resource)
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
        .navigationBarTitleDisplayMode(.inline)
//        .navigationTitle(LocalizedStringKey(country.name))
        
    }

}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: Country.example)
    }
}
