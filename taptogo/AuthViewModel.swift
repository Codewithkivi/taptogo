import Foundation
import Combine
import FirebaseAuth

@MainActor
final class AuthViewModel: ObservableObject {
    @Published var isAuthenticated: Bool = false
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    class AuthViewModel: ObservableObject {
           @Published var isAuthenticated: Bool = true

           func signOut() {
               // Sign-out logic...
               isAuthenticated = false
           }
       }

    private var authStateHandle: AuthStateDidChangeListenerHandle?

    init() {
        // Observe Firebase Auth state changes
        authStateHandle = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            guard let self = self else { return }
            self.isAuthenticated = (user != nil)
        }
        // Initialize current state
        isAuthenticated = (Auth.auth().currentUser != nil)
    }

    deinit {
        if let handle = authStateHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    func signUp(email: String, password: String) async {
        await performAuthOperation {
            try await Auth.auth().createUser(withEmail: email, password: password)
        }
    }

    func signIn(email: String, password: String) async {
        await performAuthOperation {
            try await Auth.auth().signIn(withEmail: email, password: password)
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            self.isAuthenticated = false
        } catch {
            self.errorMessage = error.localizedDescription
        }
    }

    private func performAuthOperation(_ op: @escaping () async throws -> AuthDataResult) async {
        guard !isLoading else { return }
        errorMessage = nil
        isLoading = true
        do {
            _ = try await op()
        } catch {
            self.errorMessage = error.localizedDescription
        }
        isLoading = false
    }
}
