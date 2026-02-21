//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView5: View {
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
                                    Text("My Trip To Goa ")
                                        .font(.system(size: 22, weight: .bold, design: .default))
                                        .foregroundColor(Color(.white))
                                        .padding(.top, 7)
                                    Spacer()
                                    
                                }.padding(.trailing, 10)
                                .padding(.leading, 10)
                                .padding(.bottom, -90)
                            }.padding(.top,-15)
                        }
                        
                        HStack{
                            Text("Dates:")
                            Text("Sept 10 -Sept 18")
                                .opacity(0.8)
                        }
                        .font(Font.system(size: 17))
                        .foregroundColor(Color.blue)
                        .bold()
                        
                        HStack{
                            Text("Planned Stops:")
                        }  .foregroundColor(Color.blue)
                            .bold()
                        
                        
                        
                        ForEach(0..<3){item in
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
                                        .font(Font.system(size: 20))
                                        .bold(true)
                                    Text("Heart of india ")
                                        .font(Font.system(size: 15))
                                        .opacity(0.6)
                                }.padding(.leading,5)
                                
                                    .foregroundColor(Color.blue)
                                
                                Spacer()
                                Image(systemName: "cross.circle")
                                    .foregroundColor(Color.black)
                                    .font(Font.system(size: 26))
                                
                                
                            }
                        }
                        
                        HStack{
                            Text("Notes:")
                                .font(Font.system(size: 17))
                                .foregroundColor(Color.blue)
                                .bold()
                        }
                        HStack{
                            Image(systemName: "square")
                                .resizable()
                                .foregroundColor(Color.black)
                                .frame(width: 20, height: 20)
                            Text("Dinner reservation at 10 PM")
                                .font(Font.system(size: 15))
                                .foregroundColor(Color.blue)
                                .bold()
                        }
                        
                        HStack{
                            
                            Button(action: {
                                ispopular.toggle()
                            }) {
                                if ispopular {
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.blue)
                                            .frame(width: 170, height: 40)
                                            .cornerRadius(10)
                                        
                                        HStack{
                                            Text("Edit Trip")
                                                .bold()
                                                .foregroundColor(Color.white)
                                        }
                                        
                                    }
                                    
                                } else {
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.blue)
                                            .frame(width: 170, height: 40)
                                            .cornerRadius(10)
                                        HStack{
                                            Text("Edit Trip")
                                                .bold()
                                                .foregroundColor(Color.white)
                                        }
                                        
                                    }
                                }
                            }
                            
                            
                            Button(action: {
                                ispopular.toggle()
                            }) {
                                if ispopular {
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.blue)
                                            .frame(width: 170, height: 40)
                                            .cornerRadius(10)
                                        
                                        HStack{
                                            Text("Add Place")
                                                .bold()
                                                .foregroundColor(Color.white)
                                        }
                                        
                                    }
                                    
                                } else {
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.blue)
                                            .frame(width: 170, height: 40)
                                            .cornerRadius(10)
                                        HStack{
                                            Text("Add Place")
                                                .bold()
                                                .foregroundColor(Color.white)
                                        }
                                        
                                    }
                                }
                            }
                        }.padding(.horizontal)
                        
                        HStack {
                            Button(action: {
                                ispopular.toggle()
                            }) {
                                if ispopular {
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.blue)
                                            .frame(width: 170, height: 40)
                                            .cornerRadius(10)
                                        
                                        HStack{
                                            Text("Add Place")
                                                .bold()
                                                .foregroundColor(Color.white)
                                        }
                                        
                                    }
                                    
                                } else {
                                    ZStack{
                                        Rectangle()
                                            .fill(Color.blue)
                                            .frame(width: 170, height: 40)
                                            .cornerRadius(10)
                                        HStack{
                                            Text("Add Place")
                                                .bold()
                                                .foregroundColor(Color.white)
                                        }
                                        
                                    }
                                }
                            }
                            
                        } .padding(.leading,95)
                        
                    }.listStyle(.plain)
                     .ignoresSafeArea()
          
            
        }
        
        
        
    }
    
    
}



#Preview {
    ContentView5()
}
