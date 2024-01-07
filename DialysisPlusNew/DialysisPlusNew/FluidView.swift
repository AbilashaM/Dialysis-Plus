import SwiftUI

struct FluidView: View {
    @State private var selectedAmountIndex = 0
    let amountOptions = ["100ml", "200ml", "300ml"]
    
    var body: some View {
        VStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth: 400, maxHeight: 0)
            
            VStack {
                Text("Remember to keep track of your fluid!")
                    .font(.title)
                    .padding(.top, 90)
                    .multilineTextAlignment(.center)
                
                FluidTrackerView()
                    .padding()
                
                HStack {
                    Picker(selection: $selectedAmountIndex, label: Text("")) {
                        ForEach(0..<amountOptions.count, id: \.self) { index in
                            Text(amountOptions[index])
                                .font(.system(size: 14)) // Adjust the font size here
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100, height: 35)
                    
                    Button(action: {
                        // Action for Drink button
                    }) {
                        Text("Drink")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color(hex: "072AC8"))
                            .cornerRadius(25)
                    }
                }
                .padding()
                
                HStack {
                    DrinkLogView()
                        .padding(.leading, 10)
                    ReminderView()
                        .padding(.horizontal, 10)
                }
            }
            .cornerRadius(20)
            .padding(.top, -30)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            
            Spacer()
        }
    }
}

struct FluidView_Previews: PreviewProvider {
    static var previews: some View {
        FluidView()
    }
}

