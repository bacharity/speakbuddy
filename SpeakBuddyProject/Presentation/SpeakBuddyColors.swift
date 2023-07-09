import Foundation
import SwiftUI

struct SpeakBuddyColors {
    static let buttonBlue = Color(red: 59.0 / 255.0, green: 167.0 / 255.0, blue: 1.0)
    static let textLightBlue = Color(red: 0.0, green: 117.0 / 255.0, blue: 1.0)
    static let textDarkBlue = Color(red: 111.0 / 255.0, green: 212.0 / 255.0, blue: 1.0)
    static let barLightBlue = Color(red: 88.0 / 255.0, green: 192.0 / 255.0, blue: 1.0)
    static let barDarkBlue = Color(red: 31.0 / 255.0, green: 143.0 / 255.0, blue: 1.0)
    static let monoBlack = Color(red: 50.0 / 255.0, green: 53.0 / 255.0, blue: 55.0 / 255.0)
    static let pageBackground = Color(red: 213.0 / 255.0, green: 210.0 / 255.0, blue: 1.0)
    static let blueLinearGradient = LinearGradient(colors: [SpeakBuddyColors.barDarkBlue, SpeakBuddyColors.barLightBlue], startPoint: .bottom, endPoint: .top)
    static let pageBackgroundLinearGradient = LinearGradient(colors: [.white, SpeakBuddyColors.pageBackground], startPoint: .bottom, endPoint: .top)
}
