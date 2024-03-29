import Charts
import SwiftUI

struct StackedAreaChart: View {
    @Environment(\.colorScheme) private var colorScheme

    let config: StackedAreaChartConfig
    let datas: [StackedAreaChartItem]
    let calendar: Calendar
    
    init(
        config: StackedAreaChartConfig,
        datas: [StackedAreaChartItem],
        timeZone: TimeZone
    ) {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        self.calendar = calendar
        self.datas = datas
        self.config = config
    }

    var body: some View {
        Chart {
            ForEach(datas) { data in
                if let nuclear = data.nuclear {
                    AreaMark(
                        x: .value("Time", data.startUtc),
                        y: .value("Load", nuclear)
                    )
                    .foregroundStyle(by: .value("Load", "Nuclear"))
                }
                if let hydro = data.hydro {
                    AreaMark(
                        x: .value("Time", data.startUtc),
                        y: .value("Load", hydro)
                    )
                    .foregroundStyle(by: .value("Load", "Hydro"))
                }
                if let gas = data.gas {
                    AreaMark(
                        x: .value("Time", data.startUtc),
                        y: .value("Load", gas)
                    )
                    .foregroundStyle(by: .value("Load", "Gas"))
                }
                if let duelFuel = data.duelFuel {
                    AreaMark(
                        x: .value("Time", data.startUtc),
                        y: .value("Load", duelFuel)
                    )
                    .foregroundStyle(by: .value("Load", "Dual Fuel"))
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
                if let coalAndLignite = data.coalAndLignite {
                    AreaMark(
                        x: .value("Time", data.startUtc),
                        y: .value("Load", coalAndLignite)
                    )
                    .foregroundStyle(by: .value("Load", "Coal And Lignite"))
                }
                if let coal = data.coal {
                    AreaMark(
                        x: .value("Time", data.startUtc),
                        y: .value("Load", coal)
                    )
                    .foregroundStyle(by: .value("Load", "Coal"))
                }
                if let oil = data.oil {
                    AreaMark(
                        x: .value("Time", data.startUtc),
                        y: .value("Load", oil)
                    )
                    .foregroundStyle(by: .value("Load", "Oil"))
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
                if let btmSolar = data.btmSolar {
                    AreaMark(
                        x: .value("Time", data.startUtc),
                        y: .value("Load", btmSolar)
                    )
                    .foregroundStyle(by: .value("Load", "BTM Solar"))
                }
                if let imports = data.imports {
                    AreaMark(
                        x: .value("Time", data.startUtc),
                        y: .value("Load", imports)
                    )
                    .foregroundStyle(by: .value("Load", "Imports"))
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
                AxisMarks { value in
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

    private func foregroundStyles(isoId: String) -> KeyValuePairs<String, Color> {
        switch isoId {
        case "caiso":
            return [
                "Nuclear": GridStatusColor.color(for: "Nuclear").color(scheme: colorScheme),
                "Geothermal": GridStatusColor.color(for: "Geothermal").color(scheme: colorScheme),
                "Biomass": GridStatusColor.color(for: "Biomass").color(scheme: colorScheme),
                "Large Hydro": GridStatusColor.color(for: "Large Hydro").color(scheme: colorScheme),
                "Natural Gas": GridStatusColor.color(for: "Natural Gas").color(scheme: colorScheme),
                "Coal": GridStatusColor.color(for: "Coal").color(scheme: colorScheme),
                "Wind": GridStatusColor.color(for: "Wind").color(scheme: colorScheme),
                "Batteries": GridStatusColor.color(for: "Batteries").color(scheme: colorScheme),
                "Solar": GridStatusColor.color(for: "Solar").color(scheme: colorScheme),
                "Imports": GridStatusColor.color(for: "Imports").color(scheme: colorScheme)
            ]
        case "ercot":
            return [
                "Nuclear": GridStatusColor.color(for: "Nuclear").color(scheme: colorScheme),
                "Hydro": GridStatusColor.color(for: "Hydro").color(scheme: colorScheme),
                "Natural Gas": GridStatusColor.color(for: "Natural Gas").color(scheme: colorScheme),
                "Coal And Lignite": GridStatusColor.color(for: "Coal And Lignite").color(scheme: colorScheme),
                "Wind": GridStatusColor.color(for: "Wind").color(scheme: colorScheme),
                "Solar": GridStatusColor.color(for: "Solar").color(scheme: colorScheme)
            ]
        case "pjm":
            return [
                "Nuclear": GridStatusColor.color(for: "Nuclear").color(scheme: colorScheme),
                "Hydro": GridStatusColor.color(for: "Hydro").color(scheme: colorScheme),
                "Gas": GridStatusColor.color(for: "Gas").color(scheme: colorScheme),
                "Coal": GridStatusColor.color(for: "Coal").color(scheme: colorScheme),
                "Oil": GridStatusColor.color(for: "Oil").color(scheme: colorScheme),
                "Wind": GridStatusColor.color(for: "Wind").color(scheme: colorScheme),
                "Solar": GridStatusColor.color(for: "Solar").color(scheme: colorScheme)
            ]
        case "nyiso":
            return [
                "Nuclear": GridStatusColor.color(for: "Nuclear").color(scheme: colorScheme),
                "Hydro": GridStatusColor.color(for: "Hydro").color(scheme: colorScheme),
                "Dual Fuel": GridStatusColor.color(for: "Dual Fuel").color(scheme: colorScheme),
                "Natural Gas": GridStatusColor.color(for: "Natural Gas").color(scheme: colorScheme),
                "Wind": GridStatusColor.color(for: "Wind").color(scheme: colorScheme)
            ]
        case "isone":
            return [
                "Nuclear": GridStatusColor.color(for: "Nuclear").color(scheme: colorScheme),
                "Hydro": GridStatusColor.color(for: "Hydro").color(scheme: colorScheme),
                "Natural Gas": GridStatusColor.color(for: "Natural Gas").color(scheme: colorScheme),
                "Coal": GridStatusColor.color(for: "Coal").color(scheme: colorScheme),
                "Oil": GridStatusColor.color(for: "Oil").color(scheme: colorScheme),
                "Wind": GridStatusColor.color(for: "Wind").color(scheme: colorScheme),
                "Solar": GridStatusColor.color(for: "Solar").color(scheme: colorScheme),
                "BTM Solar": GridStatusColor.color(for: "BTM Solar").color(scheme: colorScheme)
            ]
        case "miso":
            return [
                "Nuclear": GridStatusColor.color(for: "Nuclear").color(scheme: colorScheme),
                "Hydro": GridStatusColor.color(for: "Hydro").color(scheme: colorScheme),
                "Natural Gas": GridStatusColor.color(for: "Natural Gas").color(scheme: colorScheme),
                "Coal": GridStatusColor.color(for: "Coal").color(scheme: colorScheme),
                "Wind": GridStatusColor.color(for: "Wind").color(scheme: colorScheme),
                "Solar": GridStatusColor.color(for: "Solar").color(scheme: colorScheme)
            ]
        case "spp":
            return [
                "Nuclear": GridStatusColor.color(for: "Nuclear").color(scheme: colorScheme),
                "Hydro": GridStatusColor.color(for: "Hydro").color(scheme: colorScheme),
                "Natural Gas": GridStatusColor.color(for: "Natural Gas").color(scheme: colorScheme),
                "Coal": GridStatusColor.color(for: "Coal").color(scheme: colorScheme),
                "Wind": GridStatusColor.color(for: "Wind").color(scheme: colorScheme),
                "Solar": GridStatusColor.color(for: "Solar").color(scheme: colorScheme)
            ]
        default:
            return KeyValuePairs<String, Color>()
        }
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h a" // "a" prints "pm" or "am"
        return formatter
    }()

    private let isoDateFormatter: ISO8601DateFormatter = {
        return ISO8601DateFormatter()
    }()

    private func label(for timeUtc: String) -> String? {
        guard let date = isoDateFormatter.date(from: timeUtc) else { return nil }

        let comps = calendar.dateComponents([.hour, .minute], from: date)

        guard
            ( [6, 12, 18].contains(comps.hour) && comps.minute == 0 )
        else { return nil }

        let dateFormatter = dateFormatter
        dateFormatter.timeZone = calendar.timeZone
        let hourString = dateFormatter.string(from: date)
        return hourString
    }
}

struct StackedArea_Previews: PreviewProvider {
    static var previews: some View {
        StackedAreaChart(
            config: .init(isoId: "caiso", dataType: "Fuel Type"),
            datas: [],
            timeZone: TimeZone.current
        )
        .frame(width: 360, height:169)
    }
}

