import SwiftUI
import Charts

struct PromoAnimatedBarGraphView: View {
    struct Bar: Identifiable {
        var id = UUID()
        let label: String
        var height: Double
        let targetHeight: Double
    }
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    private let barCornerRadius = 3.0
    private let yAxisLabelVerticalSpacing = 10.0
    
    private var yAxisFont: Font {
        if horizontalSizeClass == .regular && verticalSizeClass == .regular {
            return SpeakBuddyFonts.bodyFontTall
        } else {
            return SpeakBuddyFonts.bodyFont
        }
    }

    @State var data: [Bar]
    var yAxisRange: ClosedRange<Double>
    
    var body: some View {
        ZStack {
            Chart(data) {
                BarMark(
                    x: .value("Label", $0.label),
                    y: .value("Height", $0.height)
                )
                .foregroundStyle(SpeakBuddyColors.blueLinearGradient)
                .cornerRadius(barCornerRadius)
            }
            .chartYScale(domain: yAxisRange)
            .chartYAxis(.hidden)
            .chartXAxis() {
                AxisMarks(position: .bottom) { _ in
                    AxisValueLabel(verticalSpacing: yAxisLabelVerticalSpacing)
                        .font(yAxisFont)
                        .foregroundStyle(SpeakBuddyColors.monoBlack)
                }
            }
            .onAppear {
                for index in data.indices {
                    withAnimation(.easeOut(duration: 0.8)
                        .delay(Double(index) / 6.0), {
                        data[index].height = data[index].targetHeight
                    })
                }
            }
        }
    }
}

struct PromoAnimatedBarGraphView_Previews: PreviewProvider {
    static var previews: some View {
        PromoAnimatedBarGraphView(data: [
            PromoAnimatedBarGraphView.Bar(label: "現在", height: 0.0, targetHeight: 66.0),
            PromoAnimatedBarGraphView.Bar(label: "3ヶ月", height: 0.0, targetHeight: 100.0),
            PromoAnimatedBarGraphView.Bar(label: "1年", height: 0.0, targetHeight: 220.0),
            PromoAnimatedBarGraphView.Bar(label: "2年", height: 0.0, targetHeight: 300.0)
        ], yAxisRange: 0.0...300.0)
    }
}
