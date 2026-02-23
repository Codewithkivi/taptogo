//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI
struct SavedPlace: Identifiable {
    let id = UUID()
    let name: String
    let subtitle: String
    let img: String
}
struct ContentView4: View {
    let savedPlaces = [
        SavedPlace(name: "Mumbai", subtitle: "Heart of India", img: "m1"),
        SavedPlace(name: "Goa", subtitle: "Paradise of India", img: "m2"),
        SavedPlace(name: "Pune", subtitle: "The Cultural Hub", img: "m3")
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
//                LinearGradient(colors: [Color.blue.opacity(0.1), .white], startPoint: .top, endPoint: .bottom)
//                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    HStack {
                        Button(action: { }) {
                            Image(systemName: "chevron.left.circle.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                        }
                        Spacer()
                        Text("Saved Places")
                            .font(.system(size: 24, weight: .black, design: .rounded))
                            .foregroundColor(.blue)
                        Spacer()
                        ZStack {
                            Circle().fill(Color.black).frame(width: 30, height: 30)
                            Image(systemName: "plus").foregroundColor(.white).font(.caption.bold())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                    
                    List {
                        ForEach(savedPlaces) { place in
                            SavedPlaceRow(place: place)
                                .listRowBackground(Color.clear)
                                .listRowSeparator(.hidden)
                                .listRowInsets(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
    }
}

struct SavedPlaceRow: View {
    let place: SavedPlace
    
    var body: some View {
        HStack(spacing: 15) {
            Image(place.img)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 85, height: 85)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .shadow(color: .black.opacity(0.1), radius: 5)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(place.name)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.blue)
                
                Text(place.subtitle)
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                HStack(spacing: 2) {
                    Image(systemName: "star.fill").foregroundColor(.orange).font(.caption)
                    Text("4.5").font(.caption2.bold())
                }
                .padding(.top, 2)
            }
            
            Spacer()
            Button(action: {}) {
                ZStack {
                    Circle()
                        .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        .frame(width: 35, height: 35)
                    
                    Image(systemName: "xmark") 
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.black)
                }
            }
        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.04), radius: 10, x: 0, y: 5)
    }
}






#Preview {
    ContentView4()
}
