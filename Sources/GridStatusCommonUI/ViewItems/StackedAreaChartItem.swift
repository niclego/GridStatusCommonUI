import Foundation
import SwiftUI

public struct StackedAreaChartItem: Identifiable {
    let startUtc: String
    
    let batteries: Double?
    let biomass: Double?
    let coal: Double?
    let coalAndLignite: Double?
    let duelFuel: Double?
    let geothermal: Double?
    let imports: Double?
    let hydro: Double?
    let largeHydro: Double?
    let naturalGas: Double?
    let nuclear: Double?
    let oil: Double?
    let other: Double?
    let solar: Double?
    let wind: Double?
    
    public var id: String { startUtc }
    
    public init(startUtc: String, batteries: Double? = nil, biomass: Double? = nil, coal: Double? = nil, coalAndLignite: Double? = nil, duelFuel: Double? = nil, geothermal: Double? = nil, imports: Double? = nil, hydro: Double? = nil, largeHydro: Double? = nil, naturalGas: Double? = nil, nuclear: Double? = nil, oil: Double? = nil, other: Double? = nil, solar: Double? = nil, wind: Double? = nil) {
        self.startUtc = startUtc
        self.batteries = Self.loadInGW(load: batteries)
        self.biomass = Self.loadInGW(load: biomass)
        self.coal = Self.loadInGW(load: coal)
        self.coalAndLignite = Self.loadInGW(load: coalAndLignite)
        self.duelFuel = Self.loadInGW(load: duelFuel)
        self.geothermal = Self.loadInGW(load: geothermal)
        self.imports = Self.loadInGW(load: imports)
        self.hydro = Self.loadInGW(load: hydro)
        self.largeHydro = Self.loadInGW(load: largeHydro)
        self.naturalGas = Self.loadInGW(load: naturalGas)
        self.nuclear = Self.loadInGW(load: nuclear)
        self.oil = Self.loadInGW(load: oil)
        self.other = Self.loadInGW(load: other)
        self.solar = Self.loadInGW(load: solar)
        self.wind = Self.loadInGW(load: wind)
    }
}

extension StackedAreaChartItem {
    fileprivate init(startUtc: String) {
        self.startUtc = startUtc
        self.batteries = nil
        self.biomass = nil
        self.coal = nil
        self.coalAndLignite = nil
        self.duelFuel = 1
        self.geothermal = nil
        self.imports = nil
        self.hydro = 1
        self.largeHydro = nil
        self.naturalGas = 1
        self.nuclear = 1
        self.oil = nil
        self.other = nil
        self.solar = nil
        self.wind = 1
    }
    
    static let examples: [StackedAreaChartItem] = {
        let calendar = Calendar.current
        let startDate = calendar.startOfDay(for: Date.now)
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let items = (0...287).map { i in
            let date = calendar.date(byAdding: .minute, value: 5 * i, to: startDate)!
            let timeStr = formatter.string(from: date)
            return StackedAreaChartItem(
                startUtc: timeStr
            )
        }
        
        return items
    }()
}

extension StackedAreaChartItem {
    private static func loadInGW(load: Double?) -> Double {
        guard let load = load else { return 0 }
        return load / 1000
    }
}

public struct StackedAreaChartConfig {
    let data: [StackedAreaChartItem]
    let isoId: String
    let dataType: String
    
    public init(data: [StackedAreaChartItem], isoId: String, dataType: String) {
        self.data = data
        self.isoId = isoId
        self.dataType = dataType
    }
    
    var title: String { dataType + "- \(isoId.uppercased())" }
    
    public static let example: StackedAreaChartConfig = .init(
        data: StackedAreaChartItem.examples,
        isoId: "caiso",
        dataType: "Fuel Mix"
    )
}
