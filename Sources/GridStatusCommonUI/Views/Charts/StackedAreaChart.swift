import Charts
import SwiftUI

struct StackedAreaChart: View {
    @Environment(\.colorScheme) private var colorScheme

    let config: StackedAreaChartConfig
    let datas: [StackedAreaChartItem]
    let calendar: Calendar
    
    @State private var selectedElement: String = ""
    
    let selected: (String) -> Void
    
    init(
        config: StackedAreaChartConfig,
        datas: [StackedAreaChartItem],
        timeZone: TimeZone,
        selected: @escaping (String) -> Void
    ) {
        var calendar = Calendar.current
        calendar.timeZone = timeZone
        self.calendar = calendar
        self.datas = datas
        self.config = config
        self.selected = selected
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
        .chartOverlay { proxy in
             GeometryReader { geo in
                 Rectangle().fill(.clear).contentShape(Rectangle())
                     .gesture(
                         SpatialTapGesture()
                             .onEnded { value in
                                 let element = findElement(location: value.location, proxy: proxy, geometry: geo)
                                 if selectedElement == element {
                                     // If tapping the same element, clear the selection.
                                     selectedElement = ""
                                 } else {
                                     selectedElement = element
                                 }
                             }
                             .exclusively (
                                 before: DragGesture()
                                     .onChanged { value in
                                         selectedElement = findElement(location: value.location, proxy: proxy, geometry: geo)
                                     }
                             )
                     )
             }
         }
        .chartLegend(config.showLegend ? .visible : .hidden)
//        .chartYAxis {
//            if config.showYAxis {
//                AxisMarks(position: .leading, values: .automatic) { value in
//                    AxisValueLabel() {
//                        if let intValue = value.as(Int.self) {
//                            Text("\(intValue) GW")
//                                .font(.system(size: 10))
//                        }
//                    }
//                }
//            }
//        }
//        .chartXAxis {
//            if config.showXAxis {
//                AxisMarks { value in
//                    AxisValueLabel {
//                        if let timeUtc = value.as(String.self),
//                           let label = label(for: timeUtc)
//                        {
//                            Text(label)
//                                .font(.footnote)
//                                .padding([.leading, .trailing])
//                        }
//                    }
//                }
//            }
//        }
//        .chartForegroundStyleScale(foregroundStyles(isoId: config.isoId))
    }
}

struct StackedArea_Previews: PreviewProvider {
    static var previews: some View {
        StackedAreaChart(
            config: .init(isoId: "caiso", dataType: "Fuel Type"),
            datas: [],
            timeZone: TimeZone.current,
            selected: {_ in}
        )
        .frame(width: 360, height:169)
    }
}

