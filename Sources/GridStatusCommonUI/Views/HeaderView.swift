import SwiftUI

public struct HeaderView: View {
    public init() {}

    public var body: some View {
        VStack(alignment: .leading) {
            Text("Energy Monitor").font(.title)
                .adaptiveForegroundColor(GridStatusColor.dataText)
                .fontWeight(.bold)
            Text("powered by Gridstatus.io").font(.subheadline)
                .adaptiveForegroundColor(GridStatusColor.subtitle)
        }
    }
}
