//
//  ContentView.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI

struct Trip: Identifiable, Equatable {
    let id: UUID
    var destination: String
    var date: Date
    var notes: String
    var imageName: String

    init(id: UUID = UUID(), destination: String, date: Date, notes: String, imageName: String) {
        self.id = id
        self.destination = destination
        self.date = date
        self.notes = notes
        self.imageName = imageName
    }
}

struct Upcommingtrips: View {
    @State private var trips: [Trip] = [
        Trip(destination: "Goa", date: .now.addingTimeInterval(60*60*24*10), notes: "Beach time!", imageName: "m1"),
        Trip(destination: "Pune", date: .now.addingTimeInterval(60*60*24*30), notes: "Friends meetup", imageName: "m2"),
        Trip(destination: "Mumbai", date: .now.addingTimeInterval(60*60*24*45), notes: "Food tour", imageName: "m3")
    ]
    @State private var savedTrips: [Trip] = []
    @State private var showAddTrip = false
    @State private var showSaved = false

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
                        Button { showSaved = true } label: {
                            HStack(spacing: 6) {
                                Image(systemName: "bookmark.fill")
                                Text("Saved")
                            }
                            .font(.subheadline.weight(.semibold))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .shadow(color: .black.opacity(0.06), radius: 6, y: 3)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 20)

                    List {
                        ForEach(trips) { trip in
                            NavigationLink(destination: TripDetailView(trip: trip)) {
                                TripRowView(imageName: trip.imageName, cityName: trip.destination, date: trip.date, notes: trip.notes, isSaved: savedTrips.contains(trip))
                            }
                            .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                Button {
                                    toggleSave(trip)
                                } label: {
                                    Label(savedTrips.contains(trip) ? "Unsave" : "Save", systemImage: savedTrips.contains(trip) ? "bookmark.slash" : "bookmark")
                                }.tint(.blue)
                            }
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                            .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                        }
                        .onDelete { indexSet in
                            trips.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(.plain)
                }

                Button(action: { showAddTrip = true }) {
                    HStack(spacing: 8) {
                        Image(systemName: "plus")
                            .font(.headline)
                        Text("Add Trip")
                            .font(.headline)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 12)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                    .shadow(color: .black.opacity(0.15), radius: 10, y: 6)
                }
                .padding(25)
            }
            .sheet(isPresented: $showAddTrip) {
                NavigationStack {
                    AddTripView { newTrip in
                        trips.append(newTrip)
                    }
                }
            }
            .sheet(isPresented: $showSaved) {
                NavigationStack { SavedTripsView(savedTrips: $savedTrips) }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

    private func toggleSave(_ trip: Trip) {
        if let idx = savedTrips.firstIndex(of: trip) {
            savedTrips.remove(at: idx)
        } else {
            savedTrips.append(trip)
        }
    }
}

struct TripRowView: View {
    let imageName: String
    let cityName: String
    let date: Date
    let notes: String
    let isSaved: Bool

    var body: some View {
        HStack(spacing: 15) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 85, height: 85)
                .clipShape(RoundedRectangle(cornerRadius: 18))
                .shadow(color: .black.opacity(0.1), radius: 5)

            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(cityName)
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.blue)
                    if isSaved {
                        Image(systemName: "bookmark.fill").foregroundColor(.blue)
                    }
                }

                Text(notes)
                    .font(.system(size: 13, weight: .medium))
                    .foregroundColor(.secondary)

                HStack(spacing: 6) {
                    Image(systemName: "calendar").font(.caption2).foregroundColor(.secondary)
                    Text(date.formatted(date: .abbreviated, time: .omitted))
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding(.top, 2)
            }

            Spacer()

        }
        .padding(12)
        .background(Color.white)
        .cornerRadius(22)
        .shadow(color: .black.opacity(0.04), radius: 12, x: 0, y: 6)
    }
}

struct TripDetailView: View {
    let trip: Trip
    var body: some View {
        VStack(spacing: 16) {
            Image(trip.imageName)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 220)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(radius: 8)

            Text(trip.destination)
                .font(.largeTitle.bold())

            Text(trip.notes)
                .foregroundColor(.secondary)

            HStack(spacing: 8) {
                Image(systemName: "calendar")
                Text(trip.date.formatted(date: .abbreviated, time: .omitted))
            }
            .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
        .navigationTitle("Trip Details")
    }
}

struct AddTripView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var destination: String = ""
    @State private var date: Date = .now
    @State private var notes: String = ""
    @State private var selectedImageName: String = "m1"

    let onAdd: (Trip) -> Void

    let sampleImages = ["m1", "m2", "m3", "m4"]

    var body: some View {
        Form {
            Section("Destination") {
                TextField("Enter destination", text: $destination)
            }
            Section("Date") {
                DatePicker("Select date", selection: $date, displayedComponents: .date)
            }
            Section("Notes") {
                TextField("Add notes", text: $notes)
            }
            Section("Image") {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(sampleImages, id: \.self) { img in
                            Image(img)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 60)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(selectedImageName == img ? Color.blue : Color.clear, lineWidth: 2))
                                .onTapGesture { selectedImageName = img }
                        }
                    }
                }
            }
        }
        .navigationTitle("Add Trip")
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let newTrip = Trip(destination: destination.isEmpty ? "New Trip" : destination, date: date, notes: notes, imageName: selectedImageName)
                    onAdd(newTrip)
                    dismiss()
                }
                .disabled(destination.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") { dismiss() }
            }
        }
    }
}

struct SavedTripsView: View {
    @Binding var savedTrips: [Trip]

    var body: some View {
        List {
            if savedTrips.isEmpty {
                Text("No saved trips yet").foregroundColor(.secondary)
            } else {
                ForEach(savedTrips) { trip in
                    HStack {
                        Image(trip.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 60, height: 60)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                        VStack(alignment: .leading) {
                            Text(trip.destination).font(.headline)
                            Text(trip.date.formatted(date: .abbreviated, time: .omitted)).font(.caption).foregroundColor(.secondary)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 4)
                }
                .onDelete { indexSet in
                    savedTrips.remove(atOffsets: indexSet)
                }
            }
        }
        .navigationTitle("Saved Trips")
    }
}

#Preview {
    Upcommingtrips()
}
