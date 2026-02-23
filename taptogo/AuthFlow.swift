//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI
import Combine

final class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?

private var users: [String: String] = [:] // email -> password
    func login(email: String, password: String) {
            errorMessage = nil
            isLoading = true
            // Simulate async auth; replace with real backend later
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
                guard let self else { return }
                self.isLoading = false
                if email.isEmpty || password.isEmpty {
                    self.errorMessage = "Please enter email and password."
                    return
                }

                guard let savedPassword = self.users[email] else {
                    self.errorMessage = "No account found for this email. Please sign up."
                    return
                }

                guard password == savedPassword else {
                    self.errorMessage = "Password is incorrect."
                    return
                }

                self.errorMessage = nil
                self.isAuthenticated = true
            }
        }

        func signup(email: String, password: String, username: String) {
            errorMessage = nil
            isLoading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) { [weak self] in
                guard let self else { return }
                self.isLoading = false
                if email.isEmpty || password.isEmpty || username.isEmpty {
                    self.errorMessage = "Please fill all fields."
                    return
                }

                // Add or update the user in-memory
                self.users[email] = password

                self.errorMessage = nil
                self.isAuthenticated = false
            }
        }

        func logout() {
            isAuthenticated = false
        }
    }


struct AuthFlow: View {
    @State private var form : Int = 1
    @ObservedObject var auth: AuthViewModel
    @State private var selection: Int = 0
    
    
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
           Image("m6")
                .resizable()
                .scaledToFit()
                .frame(width: 180)

               Picker("Auth", selection: $selection) {
                   Text("Log In").tag(0)
                   Text("Sign Up").tag(1)
               }
               .pickerStyle(.segmented)
               .padding(.horizontal)

               if selection == 0 {
                   LoginView(auth: auth)
                   
               }
               else{
                   SignupView(auth: auth)
               }

               if let error = auth.errorMessage {
                   Text(error)
                       .font(.footnote)
                       .foregroundStyle(.red)
                       .padding(.horizontal)
               }

               if auth.isLoading {
                   ProgressView().padding(.top, 8)
               }

               Spacer()
            
        }
           .padding()
       }
   }
    
    struct LoginView: View {
        @ObservedObject var auth: AuthViewModel
        @State private var email: String = ""
        @State private var password: String = ""

        var body: some View {
            VStack {
                HStack{
                    Image(systemName: "envelope.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 18))
                    TextField("Email", text: $email)
                        .foregroundColor(.gray)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .textInputAutocapitalization(.never)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(.roundedBorder)
                }
                HStack{
                    Image(systemName: "lock.shield.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 23))
                    SecureField("Password", text: $password)
                        .foregroundColor(.gray)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .textFieldStyle(.roundedBorder)
                }
                Button(action: { auth.login(email: email, password: password) }) {
                         ZStack{
                             Rectangle()
                                 .fill(Color.blue)
                                 .frame(width: 350, height: 50)
                                 .cornerRadius(10)
                             Text("Log In")
                                 .bold()
                                 .foregroundColor(Color.white)
                         }
                         
                }
                .disabled(auth.isLoading)
            }.padding(.horizontal)
            
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
                                .frame(width: 40, height: 35)
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
                            Image("g4")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Text("Facebook")
                                .bold()
                        }

                        
                    }

                }
            }

        }
    }
    
struct SignupView: View {
    @ObservedObject var auth: AuthViewModel
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            HStack{
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 23))
                TextField("Username", text: $username)
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Image(systemName: "envelope.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 18))
                TextField("Email", text: $email)
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(.roundedBorder)
            }
            HStack{
                Image(systemName: "lock.shield.fill")
                    .foregroundColor(.blue)
                    .font(.system(size: 23))
                SecureField("Password", text: $password)
                    .foregroundColor(.gray)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .textFieldStyle(.roundedBorder)
            }
            
            Button(action: { auth.signup(email: email, password: password, username: username) }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 20))
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .bold()
            }
            .disabled(auth.isLoading)
        }.padding(.horizontal)
        
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
                            .frame(width: 40, height: 35)
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
                        Image("g4")
                            .resizable()
                            .frame(width: 22, height: 22)
                        Text("Facebook")
                            .bold()
                    }

                    
                }

            }
        }

    }
}
        


//#Preview {
//    AuthFlow()
//}
