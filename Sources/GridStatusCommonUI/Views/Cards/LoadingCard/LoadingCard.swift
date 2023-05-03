import SwiftUI

public struct LoadingCard: View {
    public init() {}
    public var body: some View {
        HStack {
            Spacer()
            ProgressView()
            Spacer()
        }
        .padding()
        .adaptiveBackground(GridStatusColor.cardBackground)
        .cornerRadius(12)
    }
}
