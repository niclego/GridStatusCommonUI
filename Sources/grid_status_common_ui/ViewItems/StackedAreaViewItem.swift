struct StackedAreaViewItem: Identifiable {
    let startUTC: String
    let nuclearLoadGw: Double
    let hydroLoadGw: Double
    let dualFuelLoadGw: Double
    let naturalGasLoadGw: Double
    let windLoadGw: Double
    
    var id: String { startUTC }
}
