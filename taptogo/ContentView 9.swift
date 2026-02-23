//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI
var imagess = ["m1", "m2", "m3", "m4"]
let namess = ["Goa", "Pune", "Mumbai", "Delhi"]

struct ContentView9: View {
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 2),
        GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 2),
    ]
    var body: some View {
        NavigationStack{
            VStack{
                Text("Search Results For Island")
                    .bold()
                    .foregroundColor(.blue)
                    .font(.system(size: 24, weight: .bold))
                LazyVGrid(columns: columns, spacing:20) {
                    ForEach(imagess, id: \.self) { imageName in
                        ZStack{
                            Image("\(imageName)")
                                .resizable()
                                .frame(width: 175, height: 175)
                                .aspectRatio(1/1, contentMode: .fit)
                                .clipped()
                                .cornerRadius(10)
                            VStack(alignment: .leading){
                                    Text("\(namess.randomElement()!)")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 14, weight: .bold))
                                        
                                    Text("The city of beaches")
                                        .foregroundColor(Color.white)
                                        .font(.system(size: 12, weight: .bold))
                                        .opacity(0.9)
                                        
                                HStack{
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 12, weight: .bold))
                                        .foregroundColor(Color.yellow)
                                        
                                    Text("4.5")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 12, weight: .bold))
                                    
                                }
                                        
                            }.padding(.trailing, 45)
                            .frame(width: 175, height: 60)
                            .background(Color.black.opacity(0.4))
                            .offset(x: 0, y: 63)
                            
                        
                        }
                        .cornerRadius(10)
                    }
                } .padding(EdgeInsets(top:5, leading: 0, bottom: 0, trailing: 0))
                Spacer()
                
            }
            
        }
    }
}
#Preview {
    ContentView9()
}
