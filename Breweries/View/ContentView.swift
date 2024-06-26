//
//  ContentView.swift
//  Breweries
//
//  Created by Armstrong, Raife (SPH) on 11/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    @State private var breweries: [BreweryLightweight]=[]
    
    let breweryWebAdaptor = BreweryWebAdaptor.shared
    
    var body: some View {
        NavigationStack {
            TextField("Enter brewery search here", text: $search)
                .onChange(of: search) { oldValue, newValue in
                    breweryWebAdaptor.search(for: newValue){ results in
                        breweries = results
                    }
                }
            Text("List of Breweries")
            
            List {
                ForEach(breweries, id:\.id) { brewery in
                    NavigationLink("\(brewery.name)"){
                        BreweryDetailView(breweryID:brewery.id)
                    }
                }
                
            }
            .navigationTitle("brewery API")
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
