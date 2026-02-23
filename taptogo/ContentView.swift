//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 12/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
           Spacer()
                Image("m6")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
            Spacer()
            Text("All rights reserved")
                .bold()
                
        }
    }
}

#Preview {
    ContentView()
}
