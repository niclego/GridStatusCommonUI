import Foundation

public struct ISOViewItem: Identifiable, Equatable {
    public typealias UpdatedTimes = (lmpTimeUtc: String, loadTimeUtc: String, primaryPowerSourceTimeUtc: String)

    public let id: String
    public let displayName: String
    public let displayPrimarySource: String
    public let displayLoad: String
    public let displayPrice: String
    public let mostUpdatedTime: String
    
    init(
        name: String,
        primarySource: String,
        load: Double,
        price: Double,
        updatedTimes: UpdatedTimes
    ) {
        self.id = name
        self.displayName = Self.displayName(for: name)
        self.displayPrimarySource = Self.displayPrimarySource(for: primarySource)
        self.displayLoad = Self.displayLoad(for: load)
        self.displayPrice = Self.displayPrice(for: price)
        self.mostUpdatedTime = Self.mostUpdatedTime(for: updatedTimes)
    }
}

extension ISOViewItem {
    fileprivate init() {
        self.id = UUID().uuidString
        self.displayName = "California ISO"
        self.displayPrimarySource = "Natural Gas"
        self.displayLoad = "86700 MW"
        self.displayPrice = "$44 /MWh"
        self.mostUpdatedTime = "1 minute ago"
    }

    public static let example: ISOViewItem = .init()
    
    private static func mostUpdatedTime(for latestTimes: UpdatedTimes) -> String {
        let formatter = ISO8601DateFormatter()
        let (lmpTime, loadTime, powerSourceTime ) = latestTimes
        guard
            let lmpDate = formatter.date(from: lmpTime),
            let loadDate = formatter.date(from: loadTime),
            let pSourceDate = formatter.date(from: powerSourceTime)
        else { return "--" }
        
        let max = max(lmpDate, loadDate, pSourceDate)
        
        let diffComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: max, to: Date.now)
        
        var unit: String?
        var value: Int?
        if let year = diffComponents.year, year > 0 {
            value = year
            unit = year == 1 ? "year" : "years"
        } else if let month = diffComponents.month, month > 0 {
            value = month
            unit = month == 1 ? "month" : "months"
        } else if let day = diffComponents.day, day > 0 {
            value = day
            unit = day == 1 ? "day" : "days"
        } else if let hours = diffComponents.hour, hours > 0 {
            value = hours
            unit = hours == 1 ? "hour" : "hours"
        } else if let minutes = diffComponents.minute, minutes > 0 {
            value = minutes
            unit = minutes == 1 ? "minute" : "minutes"
        }
        
        if let value = value,
           let unit = unit {
            return "\(value) \(unit) ago"
        } else {
            return "just now"
        }
    }
    
    private static func displayPrice(for latestLmp: Double) -> String {
        return "$\(Int(round(latestLmp))) /MWh"
    }
    
    private static func displayLoad(for latestLoad: Double) -> String {
        return "\(Int(round(latestLoad))) MW"
    }
    
    private static func displayPrimarySource(for latestPrimaryPowerSource: String) -> String {
        let sourceStr = latestPrimaryPowerSource.replacingOccurrences(of: "_", with: " ")
        return sourceStr.capitalized
    }
    
    private static func displayName(for iso: String) -> String {
        switch iso {
        case "caiso":
            return "California ISO"
        case "pjm":
            return "PJM"
        case "isone":
            return "ISO New England"
        case "spp":
            return "Southwest Power Pool"
        case "nyiso":
            return "New York ISO"
        case "miso":
            return "Midcontinent ISO"
        case "ercot":
            return "ERCOT"
        default:
            return ""
        }
    }
}
