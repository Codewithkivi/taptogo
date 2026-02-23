//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI
struct ContentView5: View {
        @State private var isEditing: Bool = false
        
        var body: some View {
            NavigationStack {
                ZStack {
//                    LinearGradient(colors: [Color.blue.opacity(0.15), .white], startPoint: .top, endPoint: .bottom)
//                        .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        HStack {
                            Image(systemName: "chevron.left.circle.fill")
                                .font(.title2)
                                .foregroundColor(.blue)
                            Spacer()
                            Text("My Trip To Goa")
                                .font(.system(size: 24, weight: .black, design: .rounded))
                                .foregroundColor(.blue)
                            Spacer()
                           
                            ZStack {
                                Circle().fill(Color.black).frame(width: 30, height: 30)
                                Image(systemName: "plus").foregroundColor(.white).font(.caption.bold())
                            }
                        }
                        .padding()

                        ScrollView(showsIndicators: false) {
                            VStack(alignment: .leading, spacing: 25) {
                                
                                VStack(alignment: .leading, spacing: 12) {
                                    Label("Sept 10 - Sept 18", systemImage: "calendar")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                    
                                    Text("Planned Stops")
                                        .font(.title3.bold())
                                        .padding(.top, 5)
                                    
                                   
                                    ForEach(0..<3) { _ in
                                        StopRow()
                                    }
                                }
                                .padding()
                                .background(Color.white.opacity(0.6))
                                .cornerRadius(25)
                                .padding(.horizontal)
                                
                                VStack(alignment: .leading, spacing: 10) {
                                    Text("Notes")
                                        .font(.headline)
                                        .foregroundColor(.blue)
                                    
                                    HStack {
                                        Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                                        Text("Dinner reservation at 10 PM").font(.subheadline)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(BlurView(style: .systemThinMaterialLight))
                                    .cornerRadius(15)
                                }
                                .padding(.horizontal)
                                
                                HStack(spacing: 15) {
                                    Button ("Cancel Trip") {
                                        
                                    }
                                    CustomActionButton(title: "Edit Trip", icon: "pencil", color: .gray.opacity(0.8))
                                    CustomActionButton(title: "Add Place", icon: "plus.circle.fill", color: .blue)
                                }
                                .padding(.horizontal)
                            }
                            .padding(.top)
                        }
                    }
                }
            }
        }
    }

    struct StopRow: View {
        var body: some View {
            HStack(spacing: 15) {
                Image("m1") // Your 70x60 image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                VStack(alignment: .leading) {
                    Text("Mumbai").font(.headline).foregroundColor(.blue)
                    Text("Heart of India").font(.caption).foregroundColor(.secondary)
                }
                
                Spacer()
                
        
                Image(systemName: "ellipsis.circle.fill")
                    .foregroundColor(.blue.opacity(0.3))
                    .font(.title3)
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(15)
        }
    }

    struct CustomActionButton: View {
        var title: String
        var icon: String
        var color: Color
        
        var body: some View {
            Button(action: {}) {
                HStack {
                    Image(systemName: icon)
                    Text(title).bold()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(18)
                .shadow(color: color.opacity(0.3), radius: 10, y: 5)
            }
        }
    }

    struct BlurView: UIViewRepresentable {
        var style: UIBlurEffect.Style
        func makeUIView(context: Context) -> UIVisualEffectView { UIVisualEffectView(effect: UIBlurEffect(style: style)) }
        func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
    }

    
    




#Preview {
    ContentView5()
}
