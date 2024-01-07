import SwiftUI

struct FluidIntakeView: View {
    @State private var fluidPercentage: Double = 0.67
    private var totalFluid: Double = 2
    private var calculatedPercentage: Double {
        return fluidPercentage * 100
    }
    
    let gradient = LinearGradient(
        gradient: Gradient(colors: [
            Color(red: 95/255, green: 27/255, blue: 240/255).opacity(0.66),
            Color(red: 74/255, green: 66/255, blue: 240/255).opacity(0.75),
            Color(red: 16/255, green: 172/255, blue: 239/255).opacity(1.0)
        ]),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color(hex: "072AC8"))
                .frame(width: 170, height: 300)
                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
            
            VStack {
                HStack {
                    Image(bottleImageName(for: calculatedPercentage))
                        .resizable()
                        .frame(width: 40, height: 80)
                        .foregroundColor(.white)
                    
                    Image("Plus")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(.white)
                        .padding(.leading, 40)
                }
                .padding()
                
                ZStack {
                    Circle()
                        .trim(from: 0, to: CGFloat(fluidPercentage))
                        .stroke(Color.white, style: StrokeStyle(lineWidth: 13, lineCap: .round))
                        .frame(width: 130, height: 130)
                        .rotationEffect(.degrees(-90))
                        .overlay(
                            VStack {
                                HStack {
                                    Text(String(format: "%.2fl", fluidPercentage * 2))
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text("/")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(String(format: "%.2fl", totalFluid))
                                        .font(.headline)
                                        .foregroundColor(.white)
                                }
                                Text(String(format: "%.1f%%", calculatedPercentage))
                                    .font(.title)
                                    .bold()
                                    .foregroundColor(.white)
                            }
                        )
                }
                .padding()
            }
        }
    }
}
private func bottleImageName(for percentage: Double) -> String {
    switch percentage {
    case 0:
        return "Bottle1"
    case 25.0...50.0:
        return "Bottle2"
    case 50.0...75.0:
        return "Bottle3"
    case 75.0..<100.0:
        return "Bottle4"
    default:
        return "Bottle5"
    }
}
struct FluidIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        FluidIntakeView()
    }
}

