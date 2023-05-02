import Charts
import SwiftUI

struct StackedArea: View {
    let datas: [StackedAreaViewItem]

    var body: some View {
        GroupBox ( "Fuel Mix - NYISO" ) {
            Chart {
                ForEach(datas) {
                    AreaMark(
                        x: .value("Time", $0.startUTC),
                        y: .value("Load", $0.nuclearLoadGw),
                        stacking: .center
                    )
                    .foregroundStyle(by: .value("Load", "Nuclear"))
                    
                    AreaMark(
                        x: .value("Time", $0.startUTC),
                        y: .value("Load", $0.hydroLoadGw),
                        stacking: .center
                    )
                    .foregroundStyle(by: .value("Load", "Hydro"))
                    
                    AreaMark(
                        x: .value("Time", $0.startUTC),
                        y: .value("Load", $0.dualFuelLoadGw),
                        stacking: .center
                    )
                    .foregroundStyle(by: .value("Load", "Dual Fuel"))
                    
                    AreaMark(
                        x: .value("Time", $0.startUTC),
                        y: .value("Load", $0.naturalGasLoadGw),
                        stacking: .center
                    )
                    .foregroundStyle(by: .value("Load", "Natural Gas"))
                    
                    AreaMark(
                        x: .value("Time", $0.startUTC),
                        y: .value("Load", $0.windLoadGw),
                        stacking: .center
                    )
                    .foregroundStyle(by: .value("Load", "Wind"))
                }
            }
            .chartForegroundStyleScale([
                "Nuclear": Color(red: 195/255, green: 230/255, blue: 154/255),
                "Hydro": Color(red: 156/255, green: 229/255, blue: 180/255),
                "Dual Fuel": Color(red: 240/255, green: 189/255, blue: 144/255),
                "Natural Gas": Color(red: 126/255, green: 157/255, blue: 207/255),
                "Wind": Color(red: 119/255, green: 186/255, blue: 218/255)
            ])
            .frame(height:200)
        }
    }
}
