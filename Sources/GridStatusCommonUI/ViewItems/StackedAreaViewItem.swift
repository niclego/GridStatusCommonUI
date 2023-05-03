struct StackedAreaViewItem: Identifiable {
    let startUtc: String

    var batteries: Double? = nil
    var biomass: Double? = nil
    var coal: Double? = nil
    var coalAndLignite: Double? = nil
    var duelFuel: Double? = nil
    var geothermal: Double? = nil
    var imports: Double? = nil
    var hydro: Double? = nil
    var largeHydro: Double? = nil
    var naturalGas: Double? = nil
    var nuclear: Double? = nil
    var oil: Double? = nil
    var other: Double? = nil
    var solar: Double? = nil
    var wind: Double? = nil

    var id: String { startUtc }
}

extension StackedAreaViewItem {
    init(startUtc: String) {
        self.startUtc = startUtc
        self.nuclear = 2.9
        self.hydro = 4.1
        self.duelFuel = 1.6
        self.naturalGas = 3.0
        self.wind = 1.9
    }
}
