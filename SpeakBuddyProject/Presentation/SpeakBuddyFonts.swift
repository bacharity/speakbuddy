import Foundation
import SwiftUI

struct SpeakBuddyFonts {
    private static let customFont = "Hiragino Sans"
    
    static let bodyFont = Font.custom(customFont, size: 12.0).bold().monospaced()
    static let bodyFontTall = Font.custom(customFont, size: 18.0).bold().monospaced()
    static let headlineFont = Font.custom(customFont, size: 20.0).weight(.semibold)
    static let headlineFontTall = Font.custom(customFont, size: 30.0).weight(.semibold)
    static let headlineFont2 = Font.custom(customFont, size: 30.0)
        .weight(.black)
    static let headlineFont2Tall = Font.custom(customFont, size: 45.0)
        .weight(.black)
    static let headlineFont3 = Font.system(size: 36.0, weight: .bold)
    static let headlineFont3Tall = Font.system(size: 49.0, weight: .bold)
}
