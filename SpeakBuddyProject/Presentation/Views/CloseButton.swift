import SwiftUI

struct CloseButton: View {
    private let closeButtonSize = 38.0
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: "xmark")
        }
        .frame(width: closeButtonSize, height: closeButtonSize)
            .buttonStyle(.plain)
            .background(.white)
            .clipShape(Circle())
            .shadow(color: Color(red: 0.0, green: 0.0, blue: 0.0, opacity: 0.2), radius: 5.0, x: 0.0, y: 2.0)
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
