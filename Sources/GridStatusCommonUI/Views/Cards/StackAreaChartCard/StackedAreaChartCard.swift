import SwiftUI

public struct StackedAreaChartCard: View {
    let config: StackedAreaChartConfig
    
    public init(config: StackedAreaChartConfig) {
        self.config = config
    }

    public var body: some View {
        VStack() {
            HStack {
                Text("\(config.dataType) - \(config.isoName)")
                    .font(.title3)
                .adaptiveForegroundColor(GridStatusColor.title)
                
                Spacer()
            }

            StackedAreaChart(config: config)
        }
        .padding()
        .adaptiveBackground(GridStatusColor.cardBackground)
        .cornerRadius(12)
    }
}

struct StackedAreaChartCard_Previews: PreviewProvider {
    static var previews: some View {
        StackedAreaChartCard(config: StackedAreaChartConfig.example)
    }
}
