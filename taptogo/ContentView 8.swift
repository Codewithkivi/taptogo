//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView7: View {
    var body: some View {
        VStack{
            Text("Log in")
                .font(.system(size: 25))
                .bold()
            Spacer()
            VStack{
                Rectangle()
                    .fill(Color.gray)
                    .opacity(0.4)
                    .frame(width: 350, height: 50)
                    .cornerRadius(10)
                
                ZStack{
                    Rectangle()
                        .fill(Color.gray)
                        .opacity(0.4)
                        .frame(width: 350, height: 50)
                        .cornerRadius(10)
                        
                }
                Text("Forgot password?")
                    .foregroundColor(.blue)
                    .padding(.leading,200)
                    .font(.system(size: 15))
                
                ZStack{
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 350, height: 50)
                        .cornerRadius(10)
                    Text("Log In")
                        .bold()
                }
                Divider()
                    .frame(width:200, height: 20)
                HStack{
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 150, height: 40)
                            .cornerRadius(10)
                        Image(systemName: "")
                        Text("Google")
                            .bold()
                        
                    }
                    
                    
                    ZStack{
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 150, height: 40)
                            .cornerRadius(10)
                        Image(systemName: "")
                        Text("Facebook")
                            .bold()
                        
                    }
                }
                
                
                Spacer()
            }
        }
    }
}
#Preview {
    ContentView7()
}
