import SwiftUI

public enum GridStatusColor {
    // UI Elements
    case cardBackground
    case dataText
    case dashboardBackground
    case subtitle
    case time
    case title
    
    // Fuel Types
    case batteries
    case biomass
    case coal
    case coalAndLignite
    case duelFuel
    case geothermal
    case imports
    case hydro
    case largeHydro
    case naturalGas
    case nuclear
    case oil
    case other
    case solar
    case wind
    
    public func color(scheme: ColorScheme) -> Color {
        switch scheme {
        case .light:
            return ltColor()
        case .dark:
            return dtColor()
        @unknown default:
            return ltColor()
        }
    }
    
    private func dtColor() -> Color {
        switch self {
            
            // UI Elements
        case .dashboardBackground:
            return Color(red: 0, green: 0, blue: 0)
        case .dataText:
            return Color.secondary
        case .cardBackground:
            return Color(red: 33/255, green: 33/255, blue: 34/255)
        case .subtitle:
            return Color.primary
        case .time:
            return Color.secondary
        case .title:
            return Color.primary
            
            // Fuel Types
        case .batteries:
            return Color(red: 166/255, green: 218/255, blue: 189/255).opacity(0.5)
        case .biomass:
            return Color(red: 173/255, green: 121/255, blue: 165/255).opacity(0.5)
        case .coal:
            return Color(red: 240/255, green: 189/255, blue: 144/255).opacity(0.5)
        case .coalAndLignite:
            return Color(red: 240/255, green: 189/255, blue: 144/255).opacity(0.5)
        case .duelFuel:
            return Color(red: 240/255, green: 189/255, blue: 144/255).opacity(0.5)
        case .geothermal:
            return Color(red: 152/255, green: 132/255, blue: 185/255).opacity(0.5)
        case .imports:
            return Color(red: 194/255, green: 134/255, blue: 147/255).opacity(0.5)
        case .hydro:
            return Color(red: 156/255, green: 229/255, blue: 180/255).opacity(0.5)
        case .largeHydro:
            return Color(red: 156/255, green: 229/255, blue: 180/255).opacity(0.5)
        case .naturalGas:
            return Color(red: 126/255, green: 157/255, blue: 207/255).opacity(0.5)
        case .nuclear:
            return Color(red: 195/255, green: 230/255, blue: 154/255).opacity(0.5)
        case .oil:
            return Color(red: 187/255, green: 131/255, blue: 118/255).opacity(0.5)
        case .other:
            return Color(red: 1, green: 2, blue: 3)
        case .solar:
            return Color(red: 232/255, green: 221/255, blue: 132/255).opacity(0.5)
        case .wind:
            return Color(red: 119/255, green: 186/255, blue: 218/255).opacity(0.5)
        }
    }
    
    private func ltColor() -> Color {
        switch self {
            
            // UI Elements
        case .cardBackground:
            return Color(red: 255/255, green: 255/255, blue: 255/255)
        case .dataText:
            return Color(red: 62/255, green: 75/255, blue: 93/255)
        case .dashboardBackground:
            return Color(red: 239/255, green: 243/255, blue: 248/255)
        case .subtitle:
            return Color(red: 89/255, green: 105/255, blue: 127/255)
        case .time:
            return Color(red: 96/255, green: 103/255, blue: 116/255)
        case .title:
            return Color(red: 48/255, green: 57/255, blue: 71/255)
            
            // Fuel Types
        case .batteries:
            return Color(red: 166/255, green: 218/255, blue: 189/255)
        case .biomass:
            return Color(red: 173/255, green: 121/255, blue: 165/255)
        case .coal:
            return Color(red: 240/255, green: 189/255, blue: 144/255)
        case .coalAndLignite:
            return Color(red: 240/255, green: 189/255, blue: 144/255)
        case .duelFuel:
            return Color(red: 240/255, green: 189/255, blue: 144/255)
        case .geothermal:
            return Color(red: 152/255, green: 132/255, blue: 185/255)
        case .imports:
            return Color(red: 194/255, green: 134/255, blue: 147/255)
        case .hydro:
            return Color(red: 156/255, green: 229/255, blue: 180/255)
        case .largeHydro:
            return Color(red: 156/255, green: 229/255, blue: 180/255)
        case .naturalGas:
            return Color(red: 126/255, green: 157/255, blue: 207/255)
        case .nuclear:
            return Color(red: 195/255, green: 230/255, blue: 154/255)
        case .oil:
            return Color(red: 187/255, green: 131/255, blue: 118/255)
        case .other:
            return Color(red: 1, green: 2, blue: 3)
        case .solar:
            return Color(red: 232/255, green: 221/255, blue: 132/255)
        case .wind:
            return Color(red: 119/255, green: 186/255, blue: 218/255)
        }
    }
}

extension GridStatusColor {
    static func color(for fuelSourceTitle: String) -> GridStatusColor {
        switch fuelSourceTitle {
        case "Nuclear":
            return .nuclear
        case "Hydro":
            return .hydro
        case "Dual Fuel":
            return .duelFuel
        case "Natural Gas":
            return .naturalGas
        case "Wind":
            return .wind
        default:
            return .other
        }
    }
}
