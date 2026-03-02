//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView3: View {
@State private var ispopular: Bool = false
@State private var ispopulars: Bool = false
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
                            .fill(.tint)
                            .frame(width: 400, height: 100)
                        HStack {
                            Image(systemName: "arrow.left")
                                .bold()
                                .foregroundStyle(.white)
                            Spacer()
                            Text("Goa, india")
                                .font(.system(size: 22, weight: .bold, design: .default))
                                .foregroundStyle(.white)
                            Spacer()
                            
                        }.padding(.top,45)
                            .padding(.leading,10)
                    }
                }.padding(.top,-20)
                ZStack (alignment: .leading ){
                    Image("m2")
                        .resizable()
                        .frame(width: 400, height: 300)
                    Rectangle()
                        .fill(.black.opacity(0.35))
                        .frame(width: 400, height: 130)
                        .padding(.top,170)
                    VStack (alignment: .leading){
                        Text("Goa,India")
                            .font(.system(size: 18, weight: .bold, design: .default))
                            .foregroundStyle(.white)
                     Text("A beautiful beach destination")
                            .font(.system(size: 14, weight: .regular))
                            .foregroundStyle(.white)
                        
                    }.padding(EdgeInsets(top:240, leading: 20, bottom: 0, trailing: 0))

                    
                }.padding(.top,-30)
                HStack{
                    Image(systemName: "star.fill")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(Color.yellow)
                        
                    Text("4.8")
                    .foregroundStyle(.primary)
                    .font(.system(size: 16, weight: .bold))
                    Text("(1,200 reviews)")
                    ZStack{
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.thinMaterial)
                            .frame(width: 100, height: 25)
                        Image(systemName: "map")
                            .foregroundStyle(.green)
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .padding(.trailing,75)
                        Text("Map View")
                            .foregroundStyle(.tint)
                            .font(.system(size: 12, weight: .bold, design: .default))
                            .padding(.leading,10)
                    }
                    
//                    Button(action: {
//                        ispopular.toggle()
//                    }) {
//                        if ispopular {
//                            Image(systemName: "star.fill")
//                                .font(.system(size: 16, weight: .bold))
//                                .foregroundColor(Color.yellow)
//                        } else {
//                            Image(systemName: "star")
//                        }
//                    }
                    
                }
                
                
            Text("Explore the best of Goa here and more ! and enjoy the beaches and the nightlife ! and many more ! ")
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(.secondary)
                HStack{
                    Button(action: {
                        ispopular.toggle()
                    }) {
                        if ispopular {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.tint)
                                    .frame(width: 170, height: 40)
                                
                                HStack{
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(Color.red)
                                    Text("Save")
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                
                            }
                            
                        } else {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.tint)
                                    .frame(width: 170, height: 40)
                                HStack{
                                    Image(systemName: "heart.fill")
                                        .foregroundStyle(.white)
                                    Text("Save")
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                
                            }
                        }
                    }
                      
        
                    
                    Button(action: {
                        ispopulars.toggle()
                    }) {
                        if ispopulars {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.tint)
                                    .frame(width: 170, height: 40)
                                
                                HStack{
                                    Image(systemName: "location.fill")
                                        .foregroundStyle(.green)
                                    Text("Directions")
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                
                            }
                            
                        } else {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.tint)
                                    .frame(width: 170, height: 40)
                                HStack{
                                    Image(systemName: "location.fill")
                                        .foregroundStyle(.white)
                                    Text("Directions")
                                        .bold()
                                        .foregroundStyle(.white)
                                }
                                
                            }
                        }
                    }
                    
                }
           
                HStack{
                VStack{
                    Text("Reviews")
                        .bold()
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundStyle(.secondary)
                        .frame(width: 30, height: 30)
                    }
                    
                    HStack{
                        Text("Amazing place !")
                            . bold()
                        
                        Spacer()
                        Text("4.5")
                            .bold()
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        
                    }   .padding(.top, 20)
                    
                }
                
                HStack{
                VStack{
                    Text("Reviews")
                        .bold()
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundStyle(.secondary)
                        .frame(width: 30, height: 30)
                    }
                    
                    HStack{
                        Text("Amazing place !")
                            . bold()
                        
                        Spacer()
                        Text("4.5")
                            .bold()
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        
                    }   .padding(.top, 20)
                    
                }
          
                
                HStack{
                VStack{
                    Text("Reviews")
                        .bold()
                    Image(systemName: "person.fill")
                        .resizable()
                        .foregroundStyle(.secondary)
                        .frame(width: 30, height: 30)
                    }
                    
                    HStack{
                        Text("Amazing!")
                            . bold()
                        
                        Spacer()
                        Text("4.5")
                            .bold()
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        Image(systemName: "star.fill")
                            .foregroundColor(Color.yellow)
                        
                    }   .padding(.top, 20)
                    
                }
          
          
                
                
                
                
                
                
                
                
            }
            .listStyle(.plain)
            .background(Color(.systemBackground))
            .ignoresSafeArea()
            
        }
    }
}



#Preview {
    ContentView3()
}
