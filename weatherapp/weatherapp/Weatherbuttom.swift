import SwiftUI


struct Weatherbutton: View {
    var text: String
    var textcolor: Color
    var backgroundcolor: Color
    var body: some View {
        Text(text)
            .frame(width: 280, height: 50)
            .background(backgroundcolor)
            .foregroundColor(textcolor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
