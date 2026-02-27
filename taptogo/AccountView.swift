import SwiftUI

struct AccountView: View {
    var body: some View {
        List {
            Section {
                HStack(spacing: 16) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 56, height: 56)
                        .foregroundColor(.blue)
                        .padding(6)
                        .background(Color.blue.opacity(0.08))
                        .clipShape(Circle())

                    VStack(alignment: .leading, spacing: 4) {
                        Text("John Doe")
                            .font(.title3.bold())
                        Text("john.doe@example.com")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }

            Section("Account Details") {
                HStack {
                    Text("Phone")
                    Spacer()
                    Text("+91 98765 43210").foregroundColor(.secondary)
                }
                HStack {
                    Text("Member Since")
                    Spacer()
                    Text("Jan 2024").foregroundColor(.secondary)
                }
                HStack {
                    Text("Status")
                    Spacer()
                    Text("Verified").foregroundColor(.green)
                }
            }

            Section("Preferences") {
                Toggle(isOn: .constant(true)) {
                    Text("Push Notifications")
                }
                Toggle(isOn: .constant(false)) {
                    Text("Email Updates")
                }
            }
        }
        .navigationTitle("Account")
    }
}

#Preview {
    NavigationStack { AccountView() }
}
