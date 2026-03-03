//
//  taptogoApp.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI
import FirebaseCore

// Helper to configure Firebase on app start
final class AppConfigurator {
    static let shared = AppConfigurator()
    private var configured = false
    private init() {}

    func configureIfNeeded() {
        guard !configured else { return }
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        configured = true
    }
}

@main
struct TaptogoApp: App {
    init() {
        AppConfigurator.shared.configureIfNeeded()
    }

    var body: some Scene {
        WindowGroup {
            ContentView6()
        }
    }
}
#Preview {
    ContentView6()
}