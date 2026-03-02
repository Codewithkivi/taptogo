import SwiftUI

struct Theme {
    // Replace these with Color assets if available (e.g., Color("BrandPrimary"))
    static let primary = Color.accentColor
    static let secondary = Color.blue
    static let background = Color(.systemBackground)

    static let headerGradient = LinearGradient(
        colors: [primary.opacity(0.95), secondary.opacity(0.9)],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )

    static func pillBackground(enabled: Bool = true) -> some ShapeStyle {
        enabled ? AnyShapeStyle(primary) : AnyShapeStyle(.gray.opacity(0.4))
    }
}
