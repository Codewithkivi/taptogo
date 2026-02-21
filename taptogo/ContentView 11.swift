//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView7: View {
    @State private var form : Int = 1
    var body: some View {
            VStack{
                // for login
                
                
//                Spacer()
//                Text("Log In")
//                    .font(.system(size: 25))
//                    .bold()
//                    .foregroundColor(.blue)
//                VStack{
//                      
//                        HStack{
//                            Image(systemName: "person.crop.circle.fill")
//                            TextField("Email", text: .constant(""))
//                                .foregroundColor(.gray)
//                                .padding()
//                                .background(Color.white)
//                                .cornerRadius(10)
//                            
//                        }
//                    
//                        HStack{
//                            Image(systemName: "lock.shield.fill")
//                            TextField("Password", text: .constant(""))
//                                .foregroundColor(.gray)
//                                .padding()
//                                .background(Color.white)
//                                .cornerRadius(10)
//                               
//                        }
//                    
//                    Button (action: {
//                    }) {
//                        Text("Forgot password?")
//                            .foregroundColor(.blue)
//                            .padding(.leading, 205)
//                            .font(.system(size: 15))
//                    }
//
//                }.padding(20)
//                
//           Button (action: {
//                    
//                }){
//               
//                    ZStack{
//                        Rectangle()
//                            .fill(Color.blue)
//                            .frame(width: 350, height: 50)
//                            .cornerRadius(10)
//                        Text("Log In")
//                            .bold()
//                            .foregroundColor(Color.white)
//                    }
//                    
//           }
//                
//                
//                
//                
//                Divider()
//                    .frame(width:200, height: 20)
//                
//                
//                HStack{
//                    
//                    Button (action: {}){
//                        
//                        ZStack{
//                            Rectangle()
//                                .fill(Color.white)
//                                .frame(width: 150, height: 40)
//                                .cornerRadius(10)
//                            HStack{
//                                Image("g1")
//                                    .resizable()
//                                    .frame(width: 42, height: 43)
//                                Text("Google")
//                                    .bold()
//                            }
//                            
//                        }
//                        
//                    }
//                    
//                    
//                    Button (action: {}){
//                        
//                        ZStack{
//                            Rectangle()
//                                .fill(Color.white)
//                                .frame(width: 150, height: 40)
//                                .cornerRadius(10)
//                            HStack{
//                                Image("g2")
//                                    .resizable()
//                                    .frame(width: 43, height: 40)
//                                Text("Facebook")
//                                    .bold()
//                            }
//                            
//                        }
//                        
//                    }
//                }
                Picker("Log", selection: $form) {
                    Text("Log In").tag(1)
                    Text("Sign Up").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                 .padding(50)
                
                                
                                  Text("Sign Up")
                                 .font(.system(size: 25))
                                 .bold()
                                 .foregroundColor(.blue)
                             VStack{
                                 
                                 HStack{
                                     Image(systemName: "person.crop.circle.fill")
                                         .foregroundColor(Color.blue)
                                     TextField("Username", text: .constant(""))
                                         .foregroundColor(.gray)
                                         .padding()
                                         .background(Color.white)
                                         .cornerRadius(10)
                                 }
                                     HStack{
                                         Image(systemName: "person.crop.circle.fill")
                                            .foregroundColor(Color.blue)
                                         TextField("Email", text: .constant(""))
                                             .foregroundColor(.gray)
                                             .padding()
                                             .background(Color.white)
                                             .cornerRadius(10)
             
                                     }
             
                                     HStack{
                                         Image(systemName: "lock.shield.fill")
                                             .foregroundColor(Color.blue)
                                         TextField("Password", text: .constant(""))
                                             .foregroundColor(.gray)
                                             .padding()
                                             .background(Color.white)
                                             .cornerRadius(10)
             
                                     }
             
                                 Button (action: {
                                 }) {
                                     Text("Forgot password?")
                                         .foregroundColor(.blue)
                                         .padding(.leading, 205)
                                         .font(.system(size: 15))
                                 }
             
                             }.padding(20)
             
                        Button (action: {
             
                             }){
             
                                 ZStack{
                                     Rectangle()
                                         .fill(Color.blue)
                                         .frame(width: 350, height: 50)
                                         .cornerRadius(10)
                                     Text("Sign Up")
                                         .bold()
                                         .foregroundColor(Color.white)
                                 }
             
                        }
             
//             
//                Toggle (isOn: $ok ){
//                Text("I agree to the terms and conditions")
//                       // .font(Font.custom("Arial", size: 12))
//                        .font(Font.system(size: 14))
//                }
             
                             Divider()
                                 .frame(width:200, height: 20)
             
             
                             HStack{
             
                                 Button (action: {}){
             
                                     ZStack{
                                         Rectangle()
                                             .fill(Color.white)
                                             .frame(width: 150, height: 40)
                                             .cornerRadius(10)
                                         HStack{
                                             Image("g1")
                                                 .resizable()
                                                 .frame(width: 42, height: 43)
                                             Text("Google")
                                                 .bold()
                                         }
             
                                     }
             
                                 }
             
             
                                 Button (action: {}){
             
                                     ZStack{
                                         Rectangle()
                                             .fill(Color.white)
                                             .frame(width: 150, height: 40)
                                             .cornerRadius(10)
                                         HStack{
                                             Image("g2")
                                                 .resizable()
                                                 .frame(width: 43, height: 40)
                                             Text("Facebook")
                                                 .bold()
                                         }
             
                                         
                                     }
             
                                 }
                             }
                
                Spacer()
            }
       
    }
}




#Preview {
    ContentView7()
}
