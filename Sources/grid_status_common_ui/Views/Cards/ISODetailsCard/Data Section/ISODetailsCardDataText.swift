import SwiftUI

struct ISODetailsCardDataText: View {
    let value: String

    var body: some View {
        Text(value)
            .adaptiveForegroundColor(GridStatusColor.dataText)
    }
}
