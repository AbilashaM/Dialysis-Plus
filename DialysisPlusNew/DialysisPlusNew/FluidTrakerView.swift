import SwiftUI

struct FluidTrackerView: View {
    @State private var fluidPercentage: Double = 0.65
    private var fluidDrank: Double = 650
    private var totalFluid: Double = 2000
    private let redThreshold: Double = 0.75
    
    var body: some View {
        let isOverLimit = fluidPercentage > redThreshold
        
        let graphColor: Color = {
            if isOverLimit {
                notifyUser()
                return Color.red
            } else {
                return Color(hex: "FFC600")
            }
        }()
        
        return Circle()
            .trim(from: 0, to: CGFloat(fluidPercentage))
            .stroke(graphColor, style: StrokeStyle(lineWidth: 15, lineCap: .round))
            .frame(width: 170, height: 170)
            .rotationEffect(.degrees(-90))
            .overlay(
                Image("Fluidbg") // Replace "YourImage" with your image name
                    .resizable()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .overlay(
                        VStack {
                            Text("\(Int(fluidDrank))ml")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text("Out of \(Int(totalFluid))ml")
                                .foregroundColor(.black)
                        }.padding(5)
                    )
            )
    }
    
    private func notifyUser() {
        // Display notification or alert here
        print("You are almost at your limit!! Limit your fluid intake from now.")
    }
}

struct FluidTrackerView_Previews: PreviewProvider {
    static var previews: some View {
        FluidTrackerView()
    }
}

