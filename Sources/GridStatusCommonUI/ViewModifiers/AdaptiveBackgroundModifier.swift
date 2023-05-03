import SwiftUI

public struct AdaptiveBackgroundModifier: ViewModifier {
    let color: GridStatusColor
    
    @Environment(\.colorScheme) private var colorScheme
    
    public func body(content: Content) -> some View {
        content.background(resolvedColor)
    }
    
    private var resolvedColor: Color {
        color.color(scheme: colorScheme)
    }
}

extension View {
    public func adaptiveBackground(
        _ color: GridStatusColor
    ) -> some View {
        modifier(AdaptiveBackgroundModifier(
            color: color
        ))
    }
}
