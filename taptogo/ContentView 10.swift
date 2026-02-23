//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI
var imagesss = ["m1", "m2", "m3", "m4"]
let namesss = ["Goa", "Pune", "Mumbai", "Delhi"]

struct ContentView10: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Upcoming Trips ")
                    .bold()
                    .foregroundColor(.blue)
                    .font(.system(size: 24, weight: .bold))
                List {
                    ForEach(imagess, id: \.self) { imageName in
                        HStack{
                            Image("\(imageName)")
                                .resizable()
                                .frame(width: 75, height: 75)
                                .aspectRatio(1/1, contentMode: .fit)
                                .clipped()
                                .cornerRadius(10)
                            VStack(alignment: .leading){
                                    Text("\(namess.randomElement()!)")
                                        .foregroundColor(Color.black)
                                        .font(.system(size: 14, weight: .bold))
                                        
                                    Text("The city of beaches")
                                        .font(.system(size: 12, weight: .bold))
                                        .opacity(0.9)
                                        
                                HStack{
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(Color.yellow)
                                        
                                    Text("4.5")
                                    .font(.system(size: 12, weight: .bold))
                                    
                                }
                                        
                            }.padding(.trailing, 45)
                            .frame(width: 175, height: 60)
                            .foregroundColor(Color.black)
                           
                        
                        }
                    }
                }.ignoresSafeArea()
                    .listStyle(.plain)
                
            }
            
        }
    }
}
#Preview {
    ContentView10()
}
