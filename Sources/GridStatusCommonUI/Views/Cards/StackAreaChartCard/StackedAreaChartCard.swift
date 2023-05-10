import SwiftUI

public struct StackedAreaChartCard: View {
    let config: StackedAreaChartConfig
    let datas: [StackedAreaChartItem]
    let timeZone: TimeZone
    
    public init(config: StackedAreaChartConfig, datas: [StackedAreaChartItem], timeZone: TimeZone) {
        self.config = config
        self.datas = datas
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

            StackedAreaChart(
                config: config,
                datas: datas,
                timeZone: timeZone
            )
        }
        .padding()
        .adaptiveBackground(GridStatusColor.cardBackground)
        .cornerRadius(12)
    }
}

struct StackedAreaChartCard_Previews: PreviewProvider {
    static var previews: some View {
        StackedAreaChartCard(
            config: .init(isoId: "caiso", dataType: "Fuel Type"),
            datas: [],
            timeZone: TimeZone.current
        )
    }
}
