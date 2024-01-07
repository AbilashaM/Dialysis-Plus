import SwiftUI

struct SearchCenterView: View {
    @State private var searchText = ""
    var body: some View {
        VStack {
          
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(minWidth: 400, maxHeight: 0)

                
            VStack(alignment:.leading){
                    HStack{ SearchBar()
                        FilterIcon()
                    }.padding(.horizontal,20)
                    .padding(.top,30)
                    Text("Centers Near You")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding()

                    CenterNearYouView(hospitalName: "ClearMedi Hospitals",
                                                 address: "Adayar",
                                                 starRating: 4) // Example star rating value
                    .padding(.horizontal,30)
                
                    Text("Top Centers")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .padding()
                    TopCenterView(hospitalName: "ClearMedi Hospitals",
                                              address: "Adayar",
                                              starRating: 4) // Example star rating value
                    .padding(.horizontal,30)
                    
                    Button(action: {
                        // Action for Drink button
                    }) {
                        Text("View Your Appoinment")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color(hex: "072AC8"))
                            .cornerRadius(25)
                    }.padding(40)
                    .padding(.leading,50)

                                    
                }.padding(.top,80)
                .cornerRadius(20)
                .padding(.top, -30)
                .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
          
            Spacer()
        }
    }
}


struct SearchBar: View {
    @State private var searchText: String = ""

    var body: some View {
        HStack {
            TextField("Search...", text: $searchText)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)

            // You might add a search button here or perform search action
        }
        .padding(.vertical, 10)
        
    }
}



struct SearchCenterView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCenterView()
    }
}
struct CenterNearYouView: View {
    let hospitalName: String
    let address: String
    let starRating: Int // Assuming star rating is provided as an integer value

    var body: some View {
        HStack {
            Image("hospitalImage")
                .resizable()
                .frame(width: 70, height: 70)
                .cornerRadius(8)
                .padding(-5)
            Spacer()

            VStack(alignment: .leading) {
                Text(hospitalName)
                    .font(.headline)
                    .fontWeight(.bold)

                Text(address)
                    .font(.subheadline)
                    .foregroundColor(.black)

                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= starRating ? "star.fill" : "star")
                            .foregroundColor(index <= starRating ? .yellow : .gray)
                    }
                }
            }
            .padding(.leading, 10)
        }
        .frame(width: 300, height: 50)
        .padding(20)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}
struct TopCenterView: View {
    let hospitalName: String
    let address: String
    let starRating: Int // Assuming star rating is provided as an integer value

    var body: some View {
        VStack {
            Image("hospitalImage")
                .resizable()
                .frame(width: 120, height: 80) // Adjusted image size
                .padding(0)

            VStack(alignment: .leading, spacing: 4) {
                Text(hospitalName)
                    .font(.subheadline) // Adjusted font size
                    .bold()
                    .multilineTextAlignment(.center) // Align text to center
                    .lineLimit(2) // Allow up to 2 lines for hospital name
                    .fixedSize(horizontal: false, vertical: true) // Allow text to wrap
                    .padding(.horizontal, 5) // Adjusted padding

                Text(address)
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .padding(.horizontal, 8)

                HStack {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: index <= starRating ? "star.fill" : "star")
                            .foregroundColor(index <= starRating ? .yellow : .gray)
                            .imageScale(.small)
                            .padding(-2)
                        // Adjusted image size
                    }
                }.padding(.horizontal,10)
            }.padding(.bottom, 6) // Adjusted bottom padding
        }
        .frame(width: 120, height: 150) // Adjusted frame size
        .padding(.bottom, 12) // Adjusted bottom padding
        .background(Color.white)
        .cornerRadius(8) // Adjusted corner radius
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4) // Adjusted shadow
    }
}
