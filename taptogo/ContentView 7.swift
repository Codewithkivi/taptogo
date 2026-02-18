//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView6: View {
    var body: some View {
        TabView{
            VStack{
                ContentView2()
            }
            .tabItem{
                Label("Home", systemImage:"house")
            }
            VStack{
                ContentView4()
            }
            .tabItem{
                Label("Save", systemImage:"heart")
            }
            VStack{
                ContentView3()
            }
            .tabItem{
                Label("Trips", systemImage:"suitcase")
            }
            VStack{
                ContentView5()
            }
            .tabItem{
                Label("Profile", systemImage:"person")
            }
            
            
        }
    }
}
#Preview {
    ContentView6()
}
