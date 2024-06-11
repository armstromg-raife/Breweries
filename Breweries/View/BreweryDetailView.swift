//
//  BreweryDetailView.swift
//  Breweries
//
//  Created by Armstrong, Raife (SPH) on 11/06/2024.
//

import SwiftUI

struct BreweryDetailView: View {
    let breweryID: String
    let breweryWebAdaptor=BreweryWebAdaptor.shared
//    var brewery:BreweryLightweight
    
    var body: some View {
        VStack{
            Text("\(breweryID)")
        }
    }
}

#Preview {
    BreweryDetailView(breweryID:"10")
}
