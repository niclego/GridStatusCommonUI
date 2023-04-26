import SwiftUI

struct ISODetailsCardHeader: View {
    let displayName: String
    let updatedTime: String

    var body: some View {
        HStack {
            Text(displayName)
                .font(.title3)
                .fontWeight(.bold)
                .adaptiveForegroundColor(GridStatusColor.title)
            
            Spacer()
            Text(updatedTime).font(.caption)
                .adaptiveForegroundColor(GridStatusColor.time)
            
        }
    }
}

struct ISODetailsCardHeader_Previews: PreviewProvider {
    static var previews: some View {
        ISODetailsCardHeader(displayName: "California ISO", updatedTime: "1 minute ago").padding()
    }
}
