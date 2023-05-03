import Charts
import SwiftUI

struct StackedAreaChart: View {
    @Environment(\.colorScheme) private var colorScheme

    let config: StackedAreaChartConfig
    
    var body: some View {
        GroupBox {
            Chart {
                ForEach(config.data) { data in
                    if let nuclear = data.nuclear {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", nuclear)
                        )
                        .foregroundStyle(by: .value("Load", "Nuclear"))
                    }
                    if let geothermal = data.geothermal {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", geothermal)
                        )
                        .foregroundStyle(by: .value("Load", "Geothermal"))
                    }
                    if let biomass = data.biomass {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", biomass)
                        )
                        .foregroundStyle(by: .value("Load", "Biomass"))
                    }
                    if let largeHydro = data.largeHydro {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", largeHydro)
                        )
                        .foregroundStyle(by: .value("Load", "Large Hydro"))
                    }
                    if let naturalGas = data.naturalGas {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", naturalGas)
                        )
                        .foregroundStyle(by: .value("Load", "Natural Gas"))
                    }
                    if let coal = data.coal {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", coal)
                        )
                        .foregroundStyle(by: .value("Load", "Coal"))
                    }
                    if let wind = data.wind {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", wind)
                        )
                        .foregroundStyle(by: .value("Load", "Wind"))
                    }
                    if let batteries = data.batteries {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", batteries)
                        )
                        .foregroundStyle(by: .value("Load", "Batteries"))
                    }
                    if let solar = data.solar {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", solar)
                        )
                        .foregroundStyle(by: .value("Load", "Solar"))
                    }
                    if let imports = data.imports {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", imports)
                        )
                        .foregroundStyle(by: .value("Load", "Imports"))
                    }
                    if let coalAndLignite = data.coalAndLignite {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", coalAndLignite)
                        )
                        .foregroundStyle(by: .value("Load", "Coal and Lignite"))
                    }
                    if let duelFuel = data.duelFuel {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", duelFuel)
                        )
                        .foregroundStyle(by: .value("Load", "Dual Fuel"))
                    }
                    if let hydro = data.hydro {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", hydro)
                        )
                        .foregroundStyle(by: .value("Load", "Hydro"))
                    }
                    if let oil = data.oil {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", oil)
                        )
                        .foregroundStyle(by: .value("Load", "Oil"))
                    }
                    if let other = data.other {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", other)
                        )
                        .foregroundStyle(by: .value("Load", "Other"))
                    }
                }
            }
//            .chartYScale(domain: -15...30)
            .chartLegend(config.showLegend ? .visible : .hidden)
            .chartYAxis {
                if config.showYAxis {
                    AxisMarks(position: .leading, values: .automatic) { value in
                        AxisValueLabel() {
                            if let intValue = value.as(Int.self) {
                                Text("\(intValue) GW")
                                    .font(.system(size: 10))
                            }
                        }
                    }
                }
            }
            .chartXAxis {
                if config.showXAxis {
                    AxisMarks(preset: .automatic) { value in
                        AxisValueLabel {
                            if let timeUtc = value.as(String.self),
                               let label = label(for: timeUtc)
                            {
                                Text(label)
                                    .font(.footnote)
                                    .padding([.leading, .trailing])
                            }
                        }
                    }
                }
            }
            .chartForegroundStyleScale(foregroundStyles(isoId: config.isoId))
        }
        .groupBoxStyle(ClearGroupBoxStyle())
    }
    
    private func foregroundStyles(isoId: String) -> KeyValuePairs<String, Color> {
        switch isoId {
        case "caiso":
            return [
                "Nuclear": GridStatusColor.nuclear.color(scheme: colorScheme),
                "Geothermal": GridStatusColor.geothermal.color(scheme: colorScheme),
                "Biomass": GridStatusColor.biomass.color(scheme: colorScheme),
                "Large Hydro": GridStatusColor.largeHydro.color(scheme: colorScheme),
                "Natural Gas": GridStatusColor.naturalGas.color(scheme: colorScheme),
                "Coal": GridStatusColor.coal.color(scheme: colorScheme),
                "Wind": GridStatusColor.wind.color(scheme: colorScheme),
                "Batteries": GridStatusColor.batteries.color(scheme: colorScheme),
                "Solar": GridStatusColor.solar.color(scheme: colorScheme),
                "Imports": GridStatusColor.imports.color(scheme: colorScheme),
            ]
        default:
            return KeyValuePairs<String, Color>()
        }
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h a" // "a" prints "pm" or "am"
        return formatter
    }()
    
    private let isoDateFormatter: ISO8601DateFormatter = {
        return ISO8601DateFormatter()
    }()
    
    private func label(for timeUtc: String) -> String? {
        guard let date = isoDateFormatter.date(from: timeUtc) else { return nil }
        let comps = Calendar.current.dateComponents([.hour, .minute], from: date)
        
        guard
            ( comps.hour == 0 && comps.minute == 0 ) ||
                ( [6, 12, 18].contains(comps.hour) && comps.minute == 0 ) ||
                ( comps.hour == 23 && comps.minute == 55 )
        else { return nil }
        
        if ( comps.hour == 23 && comps.minute == 55 ) {
            return "12 AM"
        }
        
        let hourString = dateFormatter.string(from: date) // "12 AM"
        
        return hourString
    }
}

struct ClearGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .background(.clear)
    }
}


struct StackedArea_Previews: PreviewProvider {
    static var previews: some View {
        StackedAreaChart(
            config: StackedAreaChartConfig.example
        )
        .frame(width: 360, height:169)
    }
}

