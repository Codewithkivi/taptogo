//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Image("m1")
                Text("Hello, World!")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
