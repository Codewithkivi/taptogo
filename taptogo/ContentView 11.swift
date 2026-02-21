//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView11: View {
    @State private var email: String = ""
    var body: some View {
            VStack{
                    
                   
                        Text("Forgot password?")
                            .foregroundColor(.blue)
                            .font(.system(size: 20))
                        
                        HStack{
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 13))
                            TextField("Email", text: $email)
                                .foregroundColor(.gray)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                                .textFieldStyle(.roundedBorder)
                            Button(action: { }) {
                                Text("send")
                                    .padding()
                                    .background(Color.blue)
                                    .foregroundStyle(.white)
                                    .cornerRadius(10)
                                    .bold()
                                    .font(.system(size: 10))
                            }
                                
                        }.padding(.leading,20)
                         .padding(.trailing,20)
                    }

                }
                

                
                        
             
            }
       






#Preview {
    ContentView11()
}
