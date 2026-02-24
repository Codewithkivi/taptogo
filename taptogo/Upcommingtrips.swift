//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

// Corrected data based on your variables
var imagesss = ["m1", "m2", "m3", "m4"]
let namesss = ["Goa", "Pune", "Mumbai", "Delhi"]

struct Upcommingtrips: View {
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                LinearGradient(colors: [Color.blue.opacity(0.1), .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 0) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Upcoming Trips")
                                .font(.system(size: 28, weight: .black, design: .rounded))
                                .foregroundColor(.blue)
                            Text("Your next adventures are waiting")
                                .font(.caption.bold())
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        
                       
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)

                   
                    List {
                        ForEach(0..<imagesss.count, id: \.self) { index in
                            NavigationLink(destination: Text("Trip Detail View")) {
                                TripRowView(imageName: imagesss[index], cityName: namesss[index])
                            }
                            .listRowBackground(Color.clear) 
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        }
                    }
                    .listStyle(.plain)
                }
                
               
                Button(action: { }) {
                    
                       
                }
                .padding(25)
            }
        }
    }
}

struct TripRowView: View {
    let imageName: String
    let cityName: String
    
    var body: some View {
        HStack(spacing: 15) {
          
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 85, height: 85)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(color: .black.opacity(0.1), radius: 5)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(cityName)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.blue)
                
                Text("The city of beaches")
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.secondary)
                
                HStack(spacing: 3) {
                    Image(systemName: "star.fill").foregroundColor(.orange).font(.caption2)
                    Text("4.5").font(.caption.bold())
                    Text("• Sept 10").font(.caption).foregroundColor(.secondary)
                }
                .padding(.top, 2)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right.circle.fill")
                .foregroundColor(.blue.opacity(0.2))
                .font(.title2)
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(22)
        .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 6)
    }
}


struct LogoBrandingIcon: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.black)
                .frame(width: 50, height: 50)
            
            Image(systemName: "plus")
                .foregroundColor(.white)
        }
    }
}

#Preview {
    Upcommingtrips()
}
