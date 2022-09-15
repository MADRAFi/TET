//
//  CountryView.swift
//  TET
//
//  Created by MADRAFi on 15/09/2022.
//

import SwiftUI

struct CountryListView: View {
    
    @State var countryList : [Country] = [
        Country(name: "Albania", code: "AL"),
        Country(name: "Andorra", code: "AD"),
        Country(name: "Austria", code: "AT"),
        Country(name: "Belarus", code: "BY"),
        Country(name: "Belgium", code: "BE"),
        Country(name: "Bosnia and Herzegovina", code: "BA"),
        Country(name: "Bulgaria", code: "BG"),
        Country(name: "Croatia", code: "HR"),
        Country(name: "Denmark", code: "DK"),
        Country(name: "Estonia", code: "EE"),
        Country(name: "Finland", code: "FI"),
        Country(name: "France", code: "FR"),
        Country(name: "Germany", code: "DE"),
        Country(name: "Greece", code: "GR"),
        Country(name: "Hungary", code: "HU"),
        Country(name: "Italy", code: "IT"),
        Country(name: "Latvia", code: "LV"),
        Country(name: "Lithuania", code: "LT"),
        Country(name: "Montenegro", code: "ME"),
        Country(name: "Netherlands", code: "NL"),
        Country(name: "North Macedonia", code: "MK"),
        Country(name: "Norway", code: "NO"),
        Country(name: "Poland", code: "PL"),
        Country(name: "Portugal", code: "PT"),
        Country(name: "Romania", code: "RO"),
        Country(name: "Serbia", code: "RS"),
        Country(name: "Slovakia", code: "SK"),
        Country(name: "Slovenia", code: "SI"),
        Country(name: "Spain", code: "ES"),
        Country(name: "Sweden", code: "SE"),
        Country(name: "Switzerland", code: "CH"),
        Country(name: "Turkey", code: "TR"),
        Country(name: "Ukraine", code: "UA"),
        Country(name: "United Kingdom", code: "UK"),
        ]
    
    var body: some View {
        NavigationView {
            List(countryList, id: \.code) { country in
                NavigationLink(destination: CountryView(code: country.code)) {
                    HStack {
                        Image(country.code)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 66, height: 66, alignment: .leading)
                            .shadow(radius: 5)
                            .padding(.trailing, 10)
                        Text(country.name)
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
