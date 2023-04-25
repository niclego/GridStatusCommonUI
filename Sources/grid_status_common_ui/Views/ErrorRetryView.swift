import SwiftUI

public struct ErrorRetryView: View {
    let retryAction: () -> (Void)
    
    public init(retryAction: @escaping () -> Void) {
        self.retryAction = retryAction
    }

    public var body: some View {
        VStack {
            Text("The was an error while connecting to Gridstatus.io")
            Button("Retry", action: retryAction)
                .buttonStyle(.borderedProminent)
        }
    }
}
