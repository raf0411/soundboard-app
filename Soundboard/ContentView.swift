//
//  ContentView.swift
//  Soundboard
//
//  Created by Raissa Raffi Darmawan on 05/07/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }
            Tab("Settings", systemImage: "gear") {
                
            }
        }
    }
}

#Preview {
    ContentView()
}
