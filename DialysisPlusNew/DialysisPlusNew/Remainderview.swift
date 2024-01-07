import SwiftUI

struct ReminderView: View {
    @State private var remainderEnabled = false
    @State private var selectedTimeInterval = 0
    @State private var selectedAmountIndex = 0
    
    let timeIntervalOptions = ["Every 30 min", "Every 1 hr", "Every 2 hr"]
    let amountOptions = ["100ml", "200ml", "300ml"]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: "EFEFEF"))
                .frame(width: 170, height: 200)
                .overlay(
                    VStack(spacing: 20) {
                        Text("Reminder")
                            .font(.headline)
                            .padding(.top, 10)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .overlay(
                                HStack {
                                    Text("Remainder")
                                        .foregroundColor(.black)
                                        .font(.caption)
                                    Spacer()
                                    Toggle("", isOn: $remainderEnabled)
                                        .labelsHidden()
                                        .frame(width: 35, height: 15)
                                        .scaleEffect(0.7)
                                }
                                .padding(5)
                            )
                            .frame(height: 30)
                            .padding(.horizontal, 5)
                            
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .overlay(
                                HStack {
                                    Text("Time")
                                        .font(.caption)
                                    
                                    Picker(selection: $selectedTimeInterval, label: Text("")) {
                                        ForEach(0..<timeIntervalOptions.count, id: \.self) { index in
                                            Text(timeIntervalOptions[index])
                                                .font(.caption2)
                                        }
                                    }
                                    .pickerStyle(WheelPickerStyle())
                                    .frame(width: 100)
                                    .scaleEffect(0.7)
                                }
                                .padding(.horizontal, 5)
                                
                            )
                            .frame(height: 30)
                            .padding(.horizontal,5)
                        
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .overlay(
                                HStack {
                                    Text("Amount")
                                        .font(.caption)
                                    
                                    Picker(selection: $selectedAmountIndex, label: Text("")) {
                                        ForEach(0..<amountOptions.count, id: \.self) { index in
                                            Text(amountOptions[index])
                                                .font(.caption2)
                                        }
                                    }
                                    .pickerStyle(WheelPickerStyle())
                                    .frame(width: 100)
                                    .scaleEffect(0.7)
                                }
                                .padding(.horizontal, 5)
                            )
                            .frame(height: 30)
                            .padding(.horizontal, 5)
                    }
                    .padding(.bottom, 10)
                )
        }
    }
}

struct ReminderView_Previews: PreviewProvider {
    static var previews: some View {
        ReminderView()
    }
}

