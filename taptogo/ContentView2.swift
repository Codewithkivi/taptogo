import SwiftUI

struct TravelAppHome: View {
    // 1. Data Setup
    let tmanu = ["Popular", "Mountains", "Beaches", "Cities", "Save", "Back"]
    let images = ["m1", "m2", "m3", "m4"]
    let names = ["Goa", "Pune", "Mumbai", "Delhi"]
    
    // 2. Perfect Grid Alignment (2 Columns)
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        // 3. Proper NavigationStack Implementation
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(colors: [Color.blue.opacity(0.1), .white], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        // Header Section
                        HeaderView()
                        
                        // Glassmorphism Search Bar
                        SearchBar()
                        
                        // Horizontal Categories
                        CategoryScroll(tmanu: tmanu)
                        
                        // 4. Fixed & Aligned Grid
                        VStack(alignment: .leading) {
                            Text("Trending Now")
                                .font(.title3.bold())
                                .padding(.horizontal)
                            
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(0..<images.count, id: \.self) { index in
                                    // NavigationLink(value:) triggers the NavStack logic
                                    NavigationLink(value: names[index]) {
                                        TravelCard(name: names[index], img: images[index])
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.bottom, 30)
                }
            }
            // 5. NavStack Destination Handler
            .navigationDestination(for: String.self) { city in
                DestinationDetailView(cityName: city)
            }
        }
    }
}

// MARK: - Components

struct TravelCard: View {
    let name: String
    let img: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // High-Resolution Styled Image
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.gray.opacity(0.2)) // Placeholder for m1, m2 etc.
                .frame(height: 230)
                .overlay(
                    Image(img)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 25))
                )
            
            // Info Overlay with your Plus Logo
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(name)
                        .font(.headline)
                    Spacer()
                    // Your Logo as an Action Button
                    Image(systemName: "plus.circle.fill")
                        .font(.title3)
                        .foregroundColor(.blue)
                }
                Text("Explore the Magic").font(.caption2).opacity(0.8)
            }
            .padding(15)
            .background(.ultraThinMaterial) // Premium Glass Blur
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
        .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.3.horizontal.circle.fill").font(.title)
            Spacer()
            Text("Explore+").font(.system(size: 24, weight: .black, design: .rounded))
            Spacer()
            // Your Logo integrated in Header
            ZStack {
                Circle().fill(Color.blue).frame(width: 35, height: 35)
                Image(systemName: "plus").foregroundColor(.white).bold()
            }
        }
        .foregroundColor(.blue)
        .padding(.horizontal)
    }
}

struct SearchBar: View {
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass").bold()
            TextField("Search your next journey...", text: .constant(""))
        }
        .padding()
        .background(Color.white.opacity(0.8))
        .cornerRadius(18)
        .shadow(color: .black.opacity(0.05), radius: 10)
        .padding(.horizontal)
    }
}

struct CategoryScroll: View {
    let tmanu: [String]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(tmanu, id: \.self) { item in
                    Text(item)
                        .font(.system(size: 14, weight: .bold))
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(item == "Popular" ? Color.blue : Color.white)
                        .foregroundColor(item == "Popular" ? .white : .blue)
                        .clipShape(Capsule())
                }
            }
            .padding(.horizontal)
        }
    }
}

struct DestinationDetailView: View {
    let cityName: String
    var body: some View {
        VStack {
            Text("Discover \(cityName)")
                .font(.largeTitle.bold())
        }
        .navigationTitle(cityName)
        .navigationBarTitleDisplayMode(.inline)
    }
}
#Preview {
    ContentView2()
}
