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
    @StateObject var currentTrack: TrackModel
    //    @State var cm: CountryModel
    //    @State var selectedTab: Int = 0
    
    var body: some View {
            VStack {
//                Text(LocalizedStringKey(country.name))
//                    .font(.title2)
//                    .fontWeight(.heavy)
//                    .padding(.top, 10)
                TabView() {
                    ForEach(country.images, id: \.self) { img in
                        Image("\(img)")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .padding()
                            .shadow(color: .secondary ,radius: 5)
                            .tag("\(img)")
                            .tabItem {
                                Text("\(img)")
                            }
                        
                    }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .always))
                Spacer()
                GPXTrackView()
                    .environmentObject(currentTrack)
                Spacer()
                TabBarCountryView()
//                Spacer(minLength: .infinity)
                
            }
        
        //        .navigationBarHidden(true)
        //        .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(LocalizedStringKey(country.name))
    }
    
    @ViewBuilder
    func TabBarCountryView() -> some View {
        ZStack {
            HStack {
                NavigationLink {
                    MapView()
                        .environmentObject(currentTrack)
                } label: {
                    Image(systemName: "mappin.and.ellipse")
                        .frame(width: 44, height: 44)
                }
                Spacer()
                NavigationLink {
                    CountryDetailView(country: country)
                } label: {
                    Image(systemName: "list.bullet.rectangle")
                        .frame(width: 44, height: 44)
                }
            }
            .font(.title)
            .foregroundColor(Color("AccentColor"))
            .padding(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
            
        }
        //        .frame(maxHeight: .infinity, alignment: .bottom)
        //        .ignoresSafeArea()
        
    }
    
    
    
    
}



struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        //        CountryView(country: Country.example, cm: CountryModel(code: Country.example.code))
        CountryView(country: Country.example, currentTrack: TrackModel(file: Country.example.file))
    }
}

