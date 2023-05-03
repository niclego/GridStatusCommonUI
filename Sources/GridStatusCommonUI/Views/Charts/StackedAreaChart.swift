import Charts
import SwiftUI

struct StackedAreaChart: View {
    let isoName: String
    let dataType: String
    let data: [StackedAreaViewItem]
    let legendData: KeyValuePairs<String, Color>

    var body: some View {
        GroupBox ( "\(dataType) - \(isoName)" ) {
            Chart {
                ForEach(data) { data in
                    if let batteries = data.batteries {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", batteries)
                        )
                        .foregroundStyle(by: .value("Load", "Batteries"))
                    }
                    if let biomass = data.biomass {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", biomass)
                        )
                        .foregroundStyle(by: .value("Load", "Biomass"))
                    }
                    if let coal = data.coal {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", coal)
                        )
                        .foregroundStyle(by: .value("Load", "Coal"))
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
                    if let geothermal = data.geothermal {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", geothermal)
                        )
                        .foregroundStyle(by: .value("Load", "Geothermal"))
                    }
                    if let imports = data.imports {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", imports)
                        )
                        .foregroundStyle(by: .value("Load", "Geothermal"))
                    }
                    if let hydro = data.hydro {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", hydro)
                        )
                        .foregroundStyle(by: .value("Load", "Hydro"))
                    }
                    if let largeHydro = data.largeHydro {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", largeHydro)
                        )
                        .foregroundStyle(by: .value("Load", "Large Hydro/"))
                    }
                    if let naturalGas = data.naturalGas {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", naturalGas)
                        )
                        .foregroundStyle(by: .value("Load", "Natural Gas"))
                    }
                    if let nuclear = data.nuclear {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", nuclear)
                        )
                        .foregroundStyle(by: .value("Load", "Nuclear"))
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
                    if let solar = data.solar {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", solar)
                        )
                        .foregroundStyle(by: .value("Load", "Solar"))
                    }
                    if let wind = data.wind {
                        AreaMark(
                            x: .value("Time", data.startUtc),
                            y: .value("Load", wind)
                        )
                        .foregroundStyle(by: .value("Load", "Wind"))
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .leading, values: .automatic) { value in
                    AxisValueLabel() {
                        if let intValue = value.as(Int.self) {
                            Text("\(intValue) GW")
                                .font(.system(size: 10))
                        }
                    }
                }
            }
            .chartXAxis {}
            .chartForegroundStyleScale(legendData)
        }
    }
}

struct StackedArea_Previews: PreviewProvider {
    static var previews: some View {
        StackedAreaChart(
            isoName: "NYISO",
            dataType: "Fuel Mix",
            data: Self.stackedAreaItems(),
            legendData: Self.legendData()
        )
        .frame(width: 360, height:169)
    }
    
    static func stackedAreaItems() -> [StackedAreaViewItem] {
        let calendar = Calendar.current
        let startDate = Date.now
        let formatter = DateFormatter()

        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"

        let items = (1...288).map { i in
            let date = calendar.date(byAdding: .minute, value: 5 * i, to: startDate)!
            let timeStr = formatter.string(from: date)
            return StackedAreaViewItem(
                startUtc: timeStr
            )
        }
        
        return items
    }
    
    static func legendData() -> KeyValuePairs<String, Color> {
        return [
            "Nuclear": Color(red: 195/255, green: 230/255, blue: 154/255),
            "Hydro": Color(red: 156/255, green: 229/255, blue: 180/255),
            "Dual Fuel": Color(red: 240/255, green: 189/255, blue: 144/255),
            "Natural Gas": Color(red: 126/255, green: 157/255, blue: 207/255),
            "Wind": Color(red: 119/255, green: 186/255, blue: 218/255)
        ]
    }
}

