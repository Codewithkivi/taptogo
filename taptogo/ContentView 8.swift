//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView8: View {
    @State private var isDarkMode = true
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .frame(height: 130)
                        .foregroundColor(.blue)
                    Text("Settings")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 29))
                        .padding(.top, 39)
                }
                .ignoresSafeArea()
                
                List {
                    HStack {
                        Image(systemName: "bell.fill")
                        Text("Notifications")
                    }
                    HStack {
                        Image(systemName: "person.crop.circle")
                        Text("Account")
                    }
                    HStack {
                        Image(systemName: "lock.shield")
                        Text("Security")
                    }
                    
                   
                    Toggle(isOn: $isDarkMode) {
                        HStack {
                            Image(systemName: "moon.stars.fill")
                            Text("Dark mode")
                        }
                    }
                    
                    HStack {
                        Image(systemName: "person.2.fill")
                        Text("Support")
                    }
                    HStack {
                        Image(systemName: "info.circle")
                        Text("About Us")
                    }
                    
                    NavigationLink(destination: Text("Animations Detail")) {
                        HStack {
                            Image(systemName: "play.square.stack")
                            Text("Animations")
                        }
                    }
                    HStack {
                        Image(systemName: "lifepreserver")
                        Text("Help center")
                    }
                }
                .listStyle(.plain)
            }
        }
        
    }
}

#Preview {
    ContentView8()
}
