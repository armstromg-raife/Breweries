//
//  ContentView.swift
//  Breweries
//
//  Created by Armstrong, Raife (SPH) on 11/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter brewery search here", text: $search)
                .onChange(of: search) { oldValue, newValue in
                    print(newValue)
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
