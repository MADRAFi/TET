//
//  CountryView.swift
//  TET
//
//  Created by MADRAFi on 15/09/2022.
//

import SwiftUI

struct CountryListView: View {
    
    @State var countryList : [Country] = [
        Country(name: "Albania", code: "AL", file: "AL.gpx"),
        Country(name: "Andorra", code: "AD", file: "AND.gpx"),
//        Country(name: "Austria", code: "AT", file: "AT.gpx"),
        Country(name: "Belarus", code: "BY", file: "BY.gpx"),
        Country(name: "Belgium", code: "BE", file: "B.gpx"),
        Country(name: "Bosnia and Herzegovina", code: "BA", file: "BIH.gpx"),
        Country(name: "Bulgaria", code: "BG", file: "BG.gpx"),
        Country(name: "Croatia", code: "HR", file: "HR.gpx"),
        Country(name: "Denmark", code: "DK", file: "DK.gpx"),
        Country(name: "Estonia", code: "EE", file: "EST.gpx"),
        Country(name: "Finland", code: "FI", file: "FIN.gpx"),
        Country(name: "France", code: "FR", file: "F.gpx"),
        Country(name: "Germany", code: "DE", file: "D.gpx"),
        Country(name: "Greece", code: "GR", file: "GR.gpx"),
        Country(name: "Hungary", code: "HU", file: "H.gpx"),
        Country(name: "Italy", code: "IT", file: "I.gpx"),
        Country(name: "Latvia", code: "LV", file: "LV.gpx"),
        Country(name: "Lithuania", code: "LT", file: "LT.gpx"),
        Country(name: "Montenegro", code: "ME", file: "MNE.gpx"),
        Country(name: "Netherlands", code: "NL", file: "NL.gpx"),
        Country(name: "North Macedonia", code: "MK", file: "NMK.gpx"),
        Country(name: "Norway", code: "NO", file: "N.gpx"),
        Country(name: "Poland", code: "PL", file: "PL.gpx"),
        Country(name: "Portugal", code: "PT", file: "P.gpx"),
        Country(name: "Romania", code: "RO", file: "RO.gpx"),
        Country(name: "Serbia", code: "RS", file: "SRB.gpx"),
//        Country(name: "Slovakia", code: "SK", file: "SK.gpx"),
        Country(name: "Slovenia", code: "SI", file: "SLO.gpx"),
        Country(name: "Spain", code: "ES", file: "E.gpx"),
        Country(name: "Sweden", code: "SE", file: "S.gpx"),
        Country(name: "Switzerland", code: "CH", file: "CH.gpx"),
        Country(name: "Turkey", code: "TR", file: "TR.gpx"),
//        Country(name: "Ukraine", code: "UA", file: "UA.gpx"),
        Country(name: "United Kingdom", code: "UK", file: "GB.gpx"),
        ]
    
    var body: some View {
        NavigationView {
            List(countryList, id: \.code) { country in
                NavigationLink(destination: CountryView(country: country)) {
                    HStack {
                        Image(country.code)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 66, height: 66, alignment: .leading)
                            .shadow(radius: 5)
                            .padding(.trailing, 10)
                        Text(LocalizedStringKey(country.name))
                            .font(.title)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Available Countries")
        }

    }
}

struct CountryListView_Previews: PreviewProvider {
    static var previews: some View {
        CountryListView()
    }
}
