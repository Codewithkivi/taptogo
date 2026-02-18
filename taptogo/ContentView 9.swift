//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView8: View {
    var body: some View {
        NavigationStack{
            ZStack{
                Rectangle()
                    .frame(width: 400, height: 70)
                    .foregroundColor(.blue)
                Text("Settings")
                    .foregroundColor(.white)
                    .bold()
                    .font(Font.system(size: 23))
            
            }
            List{
                HStack{
                    Image(systemName: "bell.fill")
                    Text("Notifications")
                }
                HStack{
                    Image(systemName: "person.crop.circle")
                    Text("Account")
                }
                HStack{
                    Image(systemName: "lock.shield")
                    Text("Security")
                }
                HStack{
                    Image(systemName: "moon.stars.fill")
                    Text("Dark mode")
                }
                HStack{
                    Image(systemName: "person.2.fill")
                    Text("Support")
                }
                HStack{
                    Image(systemName: "info.circle")
                    Text("About Us")
                }
                HStack{
                    Image(systemName: "play.square.stack")
                    Text("Animations")
                }
                HStack{
                    Image(systemName: "lifepreserver")
                    Text("Help center")
                }
            }.ignoresSafeArea()
            
            
            
            
        }
    }
}
#Preview {
    ContentView8()
}
