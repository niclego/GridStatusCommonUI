import SwiftUI

public struct ISOCardList: View {
    let isos: [ISOViewItem]
    let onTapAction: (ISOViewItem) -> Void
    
    public init(isos: [ISOViewItem], onTapAction: @escaping (ISOViewItem) -> Void) {
        self.isos = isos
        self.onTapAction = onTapAction
    }
    
    public var body: some View {
        ScrollView {
            VStack {
                ForEach(isos) { iso in
                    ISODetailsCard(iso: iso)
                        .onTapGesture {
                            onTapAction(iso)
                        }
                }
            }
            .padding(12)
        }
    }
}
