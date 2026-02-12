//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView6: View {
    var body: some View {
        tabv
       
    }
    
    var tabv: some View {
        
        TabView{
            Text("Explore")
                .tabItem {
                    Label("Explore", systemImage: "house")
                    Image("house")
                }
            Text("Save")
                .tabItem {
                    Label("Save", systemImage: "heart")
                }
            Text("Trips")
                .tabItem {
                    Label("Trips", systemImage: "suitcase")
                }
            Text("Profile")
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
        }
    }
}

#Preview {
    ContentView6()
}
