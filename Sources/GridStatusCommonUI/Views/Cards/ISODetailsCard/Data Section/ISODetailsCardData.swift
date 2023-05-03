import SwiftUI

struct ISODetailsCardData: View {
    let displayPrimarySource: String
    let displayLoad: String
    let displayPrice: String

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                ISODetailsCardDataLabelText(value: "Load")
                ISODetailsCardDataText(value: displayLoad)
            }
            Spacer()
            VStack(spacing: 5) {
                ISODetailsCardDataLabelText(value: "Price")
                ISODetailsCardDataText(value: displayPrice)
                
            }
            Spacer()
            VStack(alignment: .trailing, spacing: 5) {
                ISODetailsCardDataLabelText(value: "Main Source")
                ISODetailsCardDataText(value: displayPrimarySource)
                
            }
        }
    }
}

struct ISODetailsCardData_Previews: PreviewProvider {
    static var previews: some View {
        ISODetailsCardData(displayPrimarySource: "--", displayLoad: "--", displayPrice: "--").padding()
    }
}
