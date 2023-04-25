import SwiftUI

struct ISODetailsCardHeader: View {
    @Environment(\.colorScheme) var colorScheme

    let displayName: String
    let updatedTime: String

    var body: some View {
        HStack {
            Text(displayName)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(GridStatusColor.title.color(scheme: colorScheme))
            
            Spacer()
            Text(updatedTime).font(.caption)
                .foregroundColor(GridStatusColor.time.color(scheme: colorScheme))
            
        }
    }
}

struct ISODetailsCardHeader_Previews: PreviewProvider {
    static var previews: some View {
        ISODetailsCardHeader(displayName: "California ISO", updatedTime: "1 minute ago").padding()
    }
}
