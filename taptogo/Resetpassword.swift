//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct Resetpassword: View {
    @State private var email: String = ""
    @State private var notifyMe: Bool = true 
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.blue.opacity(0.1), .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    
                    VStack(spacing: 15) {
                     
                        Text("Reset Password")
                            .font(.system(size: 28, weight: .black, design: .rounded))
                            .foregroundColor(.blue)
                    }
                    .padding(.top, 40)
                    
                  
                    Text("Enter your travel email below to receive a magic recovery link.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 40)
                    
                    // 4. Simple List-Style Input Card
                    VStack(spacing: 20) {
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.blue)
                                .font(.headline)
                            
                            TextField("Email Address", text: $email)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                        }
                        .padding()
                        .background(Color.white)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.05), radius: 5)
                        
                        Toggle("Get travel alerts on this email", isOn: $notifyMe)
                            .font(.caption.bold())
                            .foregroundColor(.blue)
                            .tint(.blue)
                            .padding(.horizontal, 5)
                    }
                    .padding(.horizontal, 25)
                    
                    Button(action: { }) {
                        HStack {
                            Text("Send Link")
                                .font(.headline)
                            Image(systemName: "paperplane.fill")
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(18)
                        .shadow(color: .blue.opacity(0.3), radius: 10, y: 5)
                    }
                    .padding(.horizontal, 25)
                    
                    Spacer()
                    
                    NavigationLink(
                        destination: ContentView2(),
                       
                    ) {
                        Text("Back to Login")
                    }
                   
                    .bold()
                    .foregroundColor(.blue)
                    .padding(.bottom, 20)
                }
               
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}





#Preview {
    Resetpassword()
}
