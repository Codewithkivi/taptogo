import SwiftUI

struct NotificationsView: View {
    struct NotificationItem: Identifiable {
        let id = UUID()
        let title: String
        let message: String
        let time: String
        let systemImage: String
    }

    private let items: [NotificationItem] = [
        .init(title: "Booking Confirmed", message: "Your trip to Goa is confirmed!", time: "2h ago", systemImage: "checkmark.seal.fill"),
        .init(title: "Price Drop", message: "Mumbai hotels are 15% off today.", time: "5h ago", systemImage: "tag.fill"),
        .init(title: "New Destination", message: "Explore mountains in Manali this weekend.", time: "1d ago", systemImage: "mountain.2.fill")
    ]

    var body: some View {
        NavigationStack {
            List {
                ForEach(items) { item in
                    HStack(alignment: .top, spacing: 12) {
                        Image(systemName: item.systemImage)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                            .frame(width: 28, height: 28)
                            .padding(8)
                            .background(Color.blue.opacity(0.08))
                            .clipShape(Circle())

                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text(item.title)
                                    .font(.headline)
                                Spacer()
                                Text(item.time)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                            Text(item.message)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("Notifications")
        }
    }
}

#Preview {
    NotificationsView()
}
