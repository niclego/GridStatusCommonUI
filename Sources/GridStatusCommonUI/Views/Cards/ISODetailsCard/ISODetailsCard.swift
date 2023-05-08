import SwiftUI

public struct ISODetailsCard: View {
    let iso: ISOViewItem
    
    public init(iso: ISOViewItem) {
        self.iso = iso
    }

    public var body: some View {
        VStack(spacing: 12) {
            ISODetailsCardHeader(
                displayName: iso.displayName,
                updatedTime: iso.mostUpdatedTime
            )
            .padding([.leading, .top, .trailing])

            ISODetailsCardData(
                displayPrimarySource: iso.displayPrimarySource,
                displayLoad: iso.displayLoad,
                displayPrice: iso.displayPrice
            )
            .padding([.leading, .bottom, .trailing])

        }
        .adaptiveBackground(GridStatusColor.cardBackground)
        .cornerRadius(12)
    }
}

struct ISODetailsCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            ISODetailsCard(iso: ISOViewItem.example).padding()
        }
    }
}
