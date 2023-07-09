import SwiftUI

struct SpeakBuddyButton: View {
    var text: String
    var width: CGFloat = 350.0
    var height: CGFloat = 56.0
    var cornerRadius: CGFloat = 29.0
    var font: Font = SpeakBuddyFonts.headlineFont
    
    var body: some View {
        Button(text, action: {})
            .frame(width: width, height: height)
            .buttonStyle(.plain)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(SpeakBuddyColors.buttonBlue)
            )
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.white, lineWidth: 1.0)
            }
            .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.2), radius: 5, x: 0, y: 2)
            .font(font)
            .foregroundColor(.white)
            .monospaced()
    }
}

struct SpeakBuddyButton_Previews: PreviewProvider {
    static var previews: some View {
        SpeakBuddyButton(text: "プランに登録する")
    }
}
