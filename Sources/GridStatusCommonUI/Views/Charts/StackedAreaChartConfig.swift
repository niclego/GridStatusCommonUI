public struct StackedAreaChartConfig {
    let isoId: String
    let dataType: String
    let showXAxis: Bool
    let showYAxis: Bool
    let showLegend: Bool
    
    public init(
        isoId: String,
        dataType: String,
        showXAxis: Bool = false,
        showYAxis: Bool = false,
        showLegend: Bool = false
    ) {
        self.isoId = isoId
        self.dataType = dataType
        self.showXAxis = showXAxis
        self.showYAxis = showYAxis
        self.showLegend = showLegend
    }
    
    var title: String { dataType + " - \(isoId.uppercased())" }
}
