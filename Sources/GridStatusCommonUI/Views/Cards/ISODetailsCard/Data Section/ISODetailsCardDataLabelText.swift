import SwiftUI

struct ISODetailsCardDataLabelText: View {
    let value: String

    var body: some View {
        Text(value)
            .font(.headline)
            .fontWeight(.medium)
            .adaptiveForegroundColor(GridStatusColor.subtitle)
    }
}
