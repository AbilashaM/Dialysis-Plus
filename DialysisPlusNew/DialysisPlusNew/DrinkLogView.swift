import SwiftUI

struct DrinkLogView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(hex: "EFEFEF"))
                .frame(width: 170, height: 200)
                .overlay(
                    VStack(spacing: 20) {
                        Text("Drink Log")
                            .font(.headline)
                            .padding(.top,10)
                    ScrollView {
                        
                        VStack(spacing: 20) {
                            ForEach(0..<8) { index in
                                // Example Box displaying drink log data
                                DrinkLogBox(ml: 250, time: "8:00 am")
                                    .frame(width: 160, height: 20)
                                    .padding(.bottom,10)
                            }
                        }.padding(.top,5)
                        }
                        .padding(.bottom,10)
                    }.padding(.bottom,10)
                )
        }
    }
}

struct DrinkLogBox: View {
    var ml: Int
    var time: String
    
    var body: some View {
        HStack {
            Text("\(ml) ml")
                .font(.subheadline)
                .bold()
            
            Spacer()
            
            Text(time)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(10)
        .padding(8)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DrinkLogView()
    }
}

