import SwiftUI

struct ISODetailsCardDataLabelText: View {
    @Environment(\.colorScheme) var colorScheme

    let value: String

    var body: some View {
        Text(value)
            .font(.headline)
            .fontWeight(.medium)
            .foregroundColor(GridStatusColor.subtitle.color(scheme: colorScheme))
    }
}
