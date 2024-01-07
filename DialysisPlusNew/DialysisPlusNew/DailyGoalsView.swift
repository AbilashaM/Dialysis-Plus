//
//  Dailygoalsview.swift
//  DialysisPlus
//
//  Created by admin on 28/12/23.
//

import SwiftUI

struct DailyGoalsView: View {
    let element1Value: Double = 0.6
    let element2Value: Double = 0.8
    let element3Value: Double = 0.5

    let circleSpacing: CGFloat = 15
    let circleSize: CGFloat = 100
    let customGreen = Color(red: 0/255, green: 208/255, blue: 156/255)
       let customViolet = Color(red: 88/255, green: 86/255, blue: 214/255)
       let customBlue = Color(red: 100/255, green: 210/255, blue: 255/255)
      
     
    

    var body: some View {
        VStack(spacing:20){
            ZStack {
                Circle()
                    .trim(from: CGFloat(1 - element1Value), to: 1)
                    .stroke(customViolet, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .frame(width: circleSize, height: circleSize)
                    .rotationEffect(.degrees(90))
                
                Circle()
                    .trim(from: CGFloat(1 - element2Value), to: 1)
                    .stroke(customBlue, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .frame(width: circleSize - circleSpacing * 2, height: circleSize - circleSpacing * 2)
                    .rotationEffect(.degrees(90))

                
                Circle()
                    .trim(from: CGFloat(1 - element3Value), to: 1)
                    .stroke(customGreen, style: StrokeStyle(lineWidth: 8, lineCap: .round, lineJoin: .round))
                    .frame(width: circleSize - circleSpacing * 4, height: circleSize - circleSpacing * 4)
                    .rotationEffect(.degrees(90))
                
            }
            HStack {
                Image("Potassium")
                        .resizable()
                        .frame(width: 20, height: 20) // Change width and height as needed
                    Text("Potassium")
                    
                    Image("Fluid")
                        .resizable()
                        .frame(width: 20, height: 20) // Change width and height as needed
                    Text("Fluid")
                    
                    Image("Sodium")
                        .resizable()
                        .frame(width: 20, height: 20) // Change width and height as needed
                    Text("Sodium")
               
            }
        }
    }
}

struct DailyGoalsView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoalsView()
    }
}

