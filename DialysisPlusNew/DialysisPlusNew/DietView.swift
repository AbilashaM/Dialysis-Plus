import SwiftUI

struct DietView: View {
    var body: some View {
        VStack {
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(minWidth:400, maxHeight: 0)
            VStack {
                Text("Daily Goals")
                    .font(.title)
                    .padding(.top,90)
                
                DailyGoalsView()
                    
                // Making DailyGoalsView transparent
                
                Button(action: {
                    // Action for the button
                }) {
                    HStack {
                        Text("Keep calm and track your diet")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Image(systemName: "plus")
                            .foregroundColor(.black)
                    }
                    .padding()
                    .background(Color(hex: "EFEFEF"))
                    .cornerRadius(10)
                }
                .padding()
                
                HStack {
                    FluidIntakeView()
                        .padding(.leading,10)
                    SleepTrackerView()
                        .padding(.horizontal,10)
                }
                
            }
           
            .cornerRadius(20)
            .padding(.top, -30)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
            
            Spacer()
        }
    }
}

struct DietView_Previews: PreviewProvider {
    static var previews: some View {
        DietView()
    }
}

