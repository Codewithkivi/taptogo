//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView12: View {
    @State private var form : Int = 1
    var body: some View {
        VStack{
            
            NavigationLink(destination: ContentView()){
                Text("Go to 1")
            }
        }
       
    }
}




#Preview {
    ContentView12()
}
