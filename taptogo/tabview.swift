//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView6: View {
    @StateObject private var auth = LocalAuthViewModel()
    var body: some View {
        if auth.isAuthenticated {
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
                Upcommingtrips()
            }
            .tabItem{
                Label("Trips", systemImage:"suitcase")
            }
            VStack{
               AccountView()
            }
            .tabItem{
                Label("Profile", systemImage:"person")
            }
            
            
        }
        .toolbar(.hidden)
        } else {
            AuthFlow(auth: auth)
        }
    }
    
}
#Preview {
    ContentView6()
}
