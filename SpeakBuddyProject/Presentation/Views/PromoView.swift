import SwiftUI

struct PromoView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    // All sizes + ratios derived from Figma.
    // https://www.figma.com/file/elqHLVekGAq6jvlXb1tE2b/UI%E3%83%86%E3%82%B9%E3%83%88?type=design&node-id=1-2&mode=design&t=diLRE82tf7aOtMkH-0
    
    private let graphAspectRatio = 0.8
    
    private let fontMinimumScaleFactor = 0.75
    private let textVerticalSpacing = 10.0
    private let detailsFontHeightToScreenRatio = 0.09
    private let titleFontHeightToScreenRatio = 0.12
    
    private let prottyOffsetPoint = CGPoint(x: -40.0, y: -40.0)
    private let prottyImageName = "protty"
    private let prottyAspectRatio = 1.17
    
    private var graphWidthToScreenWidthRatio: Double {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            return 0.52
        } else {
           return 0.7
        }
    }
    
    private var prottyWidthToScreenWidthRatio: Double {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            return 0.33
        } else {
           return 0.48
        }
    }
    
    private var headlineFont: Font {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            return SpeakBuddyFonts.headlineFontTall
        } else {
            return SpeakBuddyFonts.headlineFont
        }
    }
    
    private var headlineFont2: Font {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            return SpeakBuddyFonts.headlineFont2Tall
        } else {
            return SpeakBuddyFonts.headlineFont2
        }
    }
    
    private var headlineFont3: Font {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            return SpeakBuddyFonts.headlineFont3Tall
        } else {
            return SpeakBuddyFonts.headlineFont3
        }
    }
    
    private var buttonSize: CGSize {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            return CGSize(width: 525.0, height: 84.0)
        } else {
            return CGSize(width: 350.0, height: 56.0)
        }
    }
    
    private var buttonCornerRadius: Double {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            return 43.0
        } else {
            return 29.0
        }
    }
    
    private let data: [PromoAnimatedBarGraphView.Bar] = [
        PromoAnimatedBarGraphView.Bar(label: "現在", height: 0.0, targetHeight: 66.0),
        PromoAnimatedBarGraphView.Bar(label: "3ヶ月", height: 0.0, targetHeight: 100.0),
        PromoAnimatedBarGraphView.Bar(label: "1年", height: 0.0, targetHeight: 220.0),
        PromoAnimatedBarGraphView.Bar(label: "2年", height: 0.0, targetHeight: 300.0)
    ]
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                HStack {
                    Spacer()
                    CloseButton()
                        .padding(.trailing)
                }
                Spacer()
                VStack {
                    Text("Hello")
                        .font(headlineFont3)
                    Text("SpeakBUDDY")
                        .font(headlineFont3)
                }
                .frame(width: proxy.size.width, height: titleFontHeightToScreenRatio * proxy.size.height)
                .padding(.bottom)
                .padding(.bottom)
                Spacer()
                ZStack(alignment: .topLeading) {
                    PromoAnimatedBarGraphView(data: data, yAxisRange: 0.0...300.0)
                        .frame(width: proxy.size.width * graphWidthToScreenWidthRatio, height: (proxy.size.width * graphWidthToScreenWidthRatio) / graphAspectRatio)
                    Image(prottyImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: proxy.size.width * prottyWidthToScreenWidthRatio, height: (proxy.size.width * prottyWidthToScreenWidthRatio) / prottyAspectRatio)
                        .offset(x: prottyOffsetPoint.x, y: prottyOffsetPoint.y)
                }
                Spacer()
                VStack(spacing: textVerticalSpacing) {
                    Text("スピークバディで")
                        .font(headlineFont)
                        .monospaced()
                        .minimumScaleFactor(fontMinimumScaleFactor)
                    Text("レベルアップ")
                        .font(headlineFont2)
                        .foregroundStyle(SpeakBuddyColors.blueLinearGradient)
                        .minimumScaleFactor(fontMinimumScaleFactor)
                }
                .frame(maxHeight: detailsFontHeightToScreenRatio * proxy.size.height)
                Spacer()
                SpeakBuddyButton(text: "プランに登録する", width: buttonSize.width, height: buttonSize.height, cornerRadius: buttonCornerRadius, font: headlineFont)
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(SpeakBuddyColors.pageBackgroundLinearGradient)
        }
    }
}

struct PromoView_Previews: PreviewProvider {
    static var previews: some View {
        PromoView()
    }
}
