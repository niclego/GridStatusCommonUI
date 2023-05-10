import SwiftUI

public struct StackedAreaChartCard: View {
    let config: StackedAreaChartConfig
    let timeZone: TimeZone
    
    public init(config: StackedAreaChartConfig, timeZone: TimeZone) {
        self.config = config
        self.timeZone = timeZone
    }

    public var body: some View {
        VStack() {
            HStack {
                Text(config.title)
                    .font(.subheadline)
                .adaptiveForegroundColor(GridStatusColor.title)
                
                Spacer()
            }

            StackedAreaChart(config: config, timeZone: timeZone)
        }
        .padding()
        .adaptiveBackground(GridStatusColor.cardBackground)
        .cornerRadius(12)
    }
}

struct StackedAreaChartCard_Previews: PreviewProvider {
    static var previews: some View {
        StackedAreaChartCard(config: StackedAreaChartConfig.example, timeZone: TimeZone.current)
    }
}
