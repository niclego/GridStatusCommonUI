//
//  File.swift
//  
//
//  Created by Nicolas Le Gorrec on 5/11/23.
//

import SwiftUI
import Charts

extension StackedAreaChart {
    var data = SalesData.last30Days

    /// Data for the daily and monthly sales charts.
    enum SalesData {
        /// Sales by day for the last 30 days.
        static let last30Days = [
            (day: date(year: 2022, month: 5, day: 8), sales: 168),
            (day: date(year: 2022, month: 5, day: 9), sales: 117),
            (day: date(year: 2022, month: 5, day: 10), sales: 106),
            (day: date(year: 2022, month: 5, day: 11), sales: 119),
            (day: date(year: 2022, month: 5, day: 12), sales: 109),
            (day: date(year: 2022, month: 5, day: 13), sales: 104),
            (day: date(year: 2022, month: 5, day: 14), sales: 196),
            (day: date(year: 2022, month: 5, day: 15), sales: 172),
            (day: date(year: 2022, month: 5, day: 16), sales: 122),
            (day: date(year: 2022, month: 5, day: 17), sales: 115),
            (day: date(year: 2022, month: 5, day: 18), sales: 138),
            (day: date(year: 2022, month: 5, day: 19), sales: 110),
            (day: date(year: 2022, month: 5, day: 20), sales: 106),
            (day: date(year: 2022, month: 5, day: 21), sales: 187),
            (day: date(year: 2022, month: 5, day: 22), sales: 187),
            (day: date(year: 2022, month: 5, day: 23), sales: 119),
            (day: date(year: 2022, month: 5, day: 24), sales: 160),
            (day: date(year: 2022, month: 5, day: 25), sales: 144),
            (day: date(year: 2022, month: 5, day: 26), sales: 152),
            (day: date(year: 2022, month: 5, day: 27), sales: 148),
            (day: date(year: 2022, month: 5, day: 28), sales: 240),
            (day: date(year: 2022, month: 5, day: 29), sales: 242),
            (day: date(year: 2022, month: 5, day: 30), sales: 173),
            (day: date(year: 2022, month: 5, day: 31), sales: 143),
            (day: date(year: 2022, month: 6, day: 1), sales: 137),
            (day: date(year: 2022, month: 6, day: 2), sales: 123),
            (day: date(year: 2022, month: 6, day: 3), sales: 146),
            (day: date(year: 2022, month: 6, day: 4), sales: 214),
            (day: date(year: 2022, month: 6, day: 5), sales: 250),
            (day: date(year: 2022, month: 6, day: 6), sales: 146)
        ].map { Sale(day: $0.day, sales: $0.sales) }

        /// Total sales for the last 30 days.
        static var last30DaysTotal: Int {
            last30Days.map { $0.sales }.reduce(0, +)
        }

        static var last30DaysAverage: Double {
            Double(last30DaysTotal / last30Days.count)
        }

        /// Sales by month for the last 12 months.
        static let last12Months = [
            (month: date(year: 2021, month: 7), sales: 3952, dailyAverage: 127, dailyMin: 95, dailyMax: 194),
            (month: date(year: 2021, month: 8), sales: 4044, dailyAverage: 130, dailyMin: 96, dailyMax: 189),
            (month: date(year: 2021, month: 9), sales: 3930, dailyAverage: 131, dailyMin: 101, dailyMax: 184),
            (month: date(year: 2021, month: 10), sales: 4217, dailyAverage: 136, dailyMin: 96, dailyMax: 193),
            (month: date(year: 2021, month: 11), sales: 4006, dailyAverage: 134, dailyMin: 104, dailyMax: 202),
            (month: date(year: 2021, month: 12), sales: 3994, dailyAverage: 129, dailyMin: 96, dailyMax: 190),
            (month: date(year: 2022, month: 1), sales: 4202, dailyAverage: 136, dailyMin: 96, dailyMax: 203),
            (month: date(year: 2022, month: 2), sales: 3749, dailyAverage: 134, dailyMin: 98, dailyMax: 200),
            (month: date(year: 2022, month: 3), sales: 4329, dailyAverage: 140, dailyMin: 104, dailyMax: 218),
            (month: date(year: 2022, month: 4), sales: 4084, dailyAverage: 136, dailyMin: 93, dailyMax: 221),
            (month: date(year: 2022, month: 5), sales: 4559, dailyAverage: 147, dailyMin: 104, dailyMax: 242),
            (month: date(year: 2022, month: 6), sales: 1023, dailyAverage: 170, dailyMin: 120, dailyMax: 250)
        ]

        /// Total sales for the last 12 months.
        static var last12MonthsTotal: Int {
            last12Months.map { $0.sales }.reduce(0, +)
        }

        static var last12MonthsDailyAverage: Int {
            last12Months.map { $0.dailyAverage }.reduce(0, +) / last12Months.count
        }
    }

    struct Sale {
        let day: Date
        var sales: Int
    }

    func findElement(location: CGPoint, proxy: ChartProxy, geometry: GeometryProxy) -> String {
        let relativeXPosition = location.x - geometry[proxy.plotAreaFrame].origin.x
        if let string = proxy.value(atX: relativeXPosition) as String? {
            print(string)
        }
        return ""
    }
}

extension StackedAreaChart {
    func foregroundStyles(isoId: String) -> KeyValuePairs<String, Color> {
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
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "h a" // "a" prints "pm" or "am"
        return formatter
    }()
    let isoDateFormatter: ISO8601DateFormatter = {
        return ISO8601DateFormatter()
    }()
    func label(for timeUtc: String) -> String? {
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
