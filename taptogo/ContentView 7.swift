////
////  ContentView.swift
////  taptogo
////
////  Created by Mac04 on 12/02/26.
////
//
//import SwiftUI
//var images = ["m1", "m2", "m3", "m4"]
//let names = ["Goa", "Pune", "Mumbai", "Delhi"]
//let tmanu = ["Popular", "Mountains", "Beaches", "Cities", "Save","Back"]
//struct ContentView2: View {
//@State private var ispopular: Bool = false
//@StateObject private var auth = AuthViewModel()
//
//let columns = [
//    GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 2),
//    GridItem(.flexible(minimum: 100, maximum: .infinity), spacing: 2),
//]
//    var body: some View {
////       if auth.isAuthenticated {
//        NavigationView{
//            List {
//                VStack{
//                    HStack {
//                        Image(systemName: "line.horizontal.3")
//                            .bold()
//                            .foregroundColor(Color(.blue))
//                        Spacer()
//                        Text("Explore Places")
//                            .font(.system(size: 22, weight: .bold, design: .default))
//                            .foregroundColor(Color(.blue))
//                        Spacer()
//                       
//                            .bold()
//                            .foregroundColor(Color(.blue))
//                                NavigationLink(destination: ContentView()) {
//                                    Image(systemName: "arrow.2.circlepath.circle")
//                            }
//                    }
//                 
//                    
//                    ZStack{
//                        Rectangle()
//                            .fill(Color.gray)
//                            .frame(width: 350,height: 40)
//                            .cornerRadius(55)
//                            .opacity(0.1)
//                        
//                        Image(systemName: "magnifyingglass")
//                            .font(.system(size: 17))
//                            .foregroundColor(.primary)
//                            .padding(.trailing, 300)
//                            .opacity(0.8)
//                        Text("Search places...")
//                            .bold()
//                            .font(.system(size: 16))
//                            .padding(.trailing, 140)
//                            .opacity(0.5)
//                    } .padding(.top, 10)
//                    
//                    Divider()
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack{
//                            ForEach(tmanu, id: \.self){tmanue in
//                                Button {
//                                    ispopular.toggle()
//                                } label: {
//                                    Text("\(tmanue)")
//                                        .frame(width: 90, height: 25)
//                                        .foregroundColor(ispopular ? Color.black : Color.white)
//                                        .background(ispopular ? Color.blue : Color.blue)
//                                        .cornerRadius(5)
//                                        .font(.system(size: 15, weight: .bold))
//                                    
//                                }
//                            }
//                            
//                        } .padding(.top,5)
//                        
//                    }
//                    
//                    Divider()
//                    
//                    LazyVGrid(columns: columns, spacing:20) {
//                        ForEach(images, id: \.self) { imageName in
//                            ZStack{
//                                Image("\(imageName)")
//                                    .resizable()
//                                    .frame(width: 175, height: 175)
//                                    .aspectRatio(1/1, contentMode: .fit)
//                                    .clipped()
//                                    .cornerRadius(10)
//                                VStack(alignment: .leading){
//                                        Text("\(names.randomElement()!)")
//                                            .foregroundColor(Color.white)
//                                            .font(.system(size: 14, weight: .bold))
//                                            
//                                        Text("The city of beaches")
//                                            .foregroundColor(Color.white)
//                                            .font(.system(size: 12, weight: .bold))
//                                            .opacity(0.9)
//                                            
//                                    HStack{
//                                        Image(systemName: "star.fill")
//                                            .font(.system(size: 12, weight: .bold))
//                                            .foregroundColor(Color.yellow)
//                                            
//                                        Text("4.5")
//                                        .foregroundColor(Color.white)
//                                        .font(.system(size: 12, weight: .bold))
//                                        
//                                    }
//                                            
//                                }.padding(.trailing, 45)
//                                .frame(width: 175, height: 60)
//                                .background(Color.black.opacity(0.4))
//                                .offset(x: 0, y: 63)
//                                
//                            
//                            }
//                            .cornerRadius(10)
//                        }
//                    } .padding(EdgeInsets(top:5, leading: 0, bottom: 0, trailing: 0))
//                }
//               
//                
//            }.listStyle(.plain)
//                .toolbar {
//                ToolbarItem(placement: .topBarTrailing) {
//                Button("Logout") { auth.logout() }
//            }
//        }
//            
//        }.ignoresSafeArea()
//         
//           
////    }
////        else {
////        AuthFlow(auth: auth)
////    }
//}
//
//}
//
//
//
//#Preview {
//    ContentView2()
//}
