import SwiftUI

public struct GridStatusHeaderView: View {
    public init() {}

    public var body: some View {
        Text("Gridstatus.io").font(.title)
            .adaptiveForegroundColor(GridStatusColor.dataText)
            .fontWeight(.bold)
    }
}
