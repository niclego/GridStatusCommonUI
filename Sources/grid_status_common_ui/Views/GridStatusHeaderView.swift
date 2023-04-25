import SwiftUI

public struct GridStatusHeaderView: View {
    @Environment(\.colorScheme) var colorScheme
    
    public init() {}

    public var body: some View {
        Text("Gridstatus.io").font(.title)
            .foregroundColor(GridStatusColor.dataText.color(scheme: colorScheme))
            .fontWeight(.bold)
    }
}
