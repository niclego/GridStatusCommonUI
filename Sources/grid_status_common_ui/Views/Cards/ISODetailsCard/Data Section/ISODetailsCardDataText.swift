import SwiftUI

struct ISODetailsCardDataText: View {
    @Environment(\.colorScheme) var colorScheme

    let value: String

    var body: some View {
        Text(value)
            .foregroundColor(GridStatusColor.dataText.color(scheme: colorScheme))
    }
}
