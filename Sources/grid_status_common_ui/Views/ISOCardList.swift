import SwiftUI

public struct ISOCardList: View {
    let isos: [ISOViewItem]
    let onTapAction: (Int) -> Void
    
    public init(isos: [ISOViewItem], onTapAction: @escaping (Int) -> Void) {
        self.isos = isos
        self.onTapAction = onTapAction
    }
    
    public var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(Array(isos.enumerated()), id: \.element) { index, iso in
                    ISODetailsCard(iso: iso)
                        .onTapGesture {
                            onTapAction(index)
                        }
                }
            }
            .padding(12)
        }
    }
}
