import SwiftUI

struct AdaptiveForegroundColorModifier: ViewModifier {
    let color: GridStatusColor
    
    @Environment(\.colorScheme) private var colorScheme
    
    func body(content: Content) -> some View {
        content.foregroundColor(resolvedColor)
    }
    
    private var resolvedColor: Color {
        color.color(scheme: colorScheme)
    }
}

extension View {
    func adaptiveForegroundColor(
        _ color: GridStatusColor
    ) -> some View {
        modifier(AdaptiveForegroundColorModifier(
            color: color
        ))
    }
}
