//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView4: View {
@State private var ispopular: Bool = false
  let img = ["m1","m2","m3"]
let columns = [
    GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 2),
    GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 2),
]
    var body: some View {
       
        NavigationView{
            List {
                VStack{
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 410, height: 90)
                        HStack {
                            Image(systemName: "arrow.left")
                                .bold()
                                .foregroundColor(Color(.white))
                            Spacer()
                            Text("Save Places")
                                .font(.system(size: 22, weight: .bold, design: .default))
                                .foregroundColor(Color(.white))
                                
                            Spacer()
                            
                        }.padding(.leading)
                         .padding(.top,35)
                    }.padding(.top, -15)
                }
                
            
                
                ForEach(0..<5){item in
                    HStack{
                        VStack{
                            Image("m1")
                                .resizable()
                                .foregroundColor(Color.gray)
                                .frame(width: 70, height: 60)
                                .cornerRadius(5)
                        }
                        
                        VStack (alignment: .leading) {
                            Text("Mumbai")
                                .bold()
                                .font(Font.system(size: 20))
                                .foregroundColor(Color.blue)
                            
                            Text("Heart of india ")
                                .bold()
                                .font(Font.system(size: 15))
                                .opacity(0.6)
                        }.padding(.leading,5)
                        
                        Spacer()
                        Image(systemName: "cross.circle")
                            .foregroundColor(Color.black)
                            .font(Font.system(size: 26))
                        
                        
                    }
                }
                
                
                
            }.listStyle(.plain)
             .ignoresSafeArea()
            
        }
    }
}



#Preview {
    ContentView4()
}
