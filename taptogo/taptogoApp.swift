//
//  taptogoApp.swift
//  taptogo
//
//  Created by Mac04 on 09/02/26.
//

import SwiftUI
import FirebaseCore

// MARK: - AppDelegate for Firebase setup
final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Configure Firebase as early as possible
        if FirebaseApp.app() == nil {
            FirebaseApp.configure()
        }
        if let app = FirebaseApp.app() {
            print("[Firebase] Configured app: \(app.name)")
        } else {
            assertionFailure("[Firebase] Failed to configure. Check that GoogleService-Info.plist is added to the app target and the bundle.")
            print("[Firebase] Failed to configure. Ensure GoogleService-Info.plist exists and is included in the main app target.")
        }
        return true
    }
}

@main
struct TaptogoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView6()
        }
    }
}

#Preview {
    ContentView6()
}
