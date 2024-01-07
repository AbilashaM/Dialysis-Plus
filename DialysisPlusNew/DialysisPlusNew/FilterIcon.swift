import SwiftUI

struct FilterIcon: View {
    @State private var isFilterSheetPresented = false

    var body: some View {
        Button(action: {
            isFilterSheetPresented.toggle()
        }) {
            Image(systemName: "slider.horizontal.3")
                .foregroundColor(.blue)
                .font(.title)
        }
        .padding(8)
        .sheet(isPresented: $isFilterSheetPresented) {
            FilterSheetView()
        }
    }
}

struct FilterSheetView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedPriceRange: String = ""
    @State private var selectedDistance: String = ""
    @State private var isPrizeSelected: Bool = false
    @State private var isRatingsSelected: Bool = false
    @State private var isDistanceSortSelected: Bool = false
    @State private var is15003000Selected: Bool = false
    @State private var is30005000Selected: Bool = false
    @State private var isAnyPriceSelected: Bool = false
    @State private var isLessThan5kmSelected: Bool = false
    @State private var is5to10kmSelected: Bool = false
    @State private var is10to15kmSelected: Bool = false
    @State private var isAnyDistanceSelected: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue)
                        .font(.title)
                }
                Spacer()
                Text("Filter Your Center")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
            }
            .padding()

            Divider()

            Text("Sort By")
                .font(.headline)
                .padding()

            ToggleOptionView(optionText: "Prize", isSelected: $isPrizeSelected)
            ToggleOptionView(optionText: "Ratings", isSelected: $isRatingsSelected)
            ToggleOptionView(optionText: "Distance", isSelected: $isDistanceSortSelected)
            Divider()

            Text("Price Range")
                .font(.headline)
                .padding()

            ToggleOptionView(optionText: "1500-3000", isSelected: $is15003000Selected)
            ToggleOptionView(optionText: "3000-5000", isSelected: $is30005000Selected)
            ToggleOptionView(optionText: "Any", isSelected: $isAnyPriceSelected)

            Divider()

            Text("Distance")
                .font(.headline)
                .padding()

            ToggleOptionView(optionText: "<5 Km", isSelected: $isLessThan5kmSelected)
            ToggleOptionView(optionText: "5-10 Km", isSelected: $is5to10kmSelected)
            ToggleOptionView(optionText: "10-15 Km", isSelected: $is10to15kmSelected)
            ToggleOptionView(optionText: "Any", isSelected: $isAnyDistanceSelected)

            Spacer()
        }
    }
}

struct ToggleOptionView: View {
    var optionText: String
    @Binding var isSelected: Bool

    var body: some View {
        Button(action: {
            isSelected.toggle()
        }) {
            HStack {
                Text(optionText)
                    .foregroundColor(isSelected ? .blue : .primary) // Change text color if selected
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal)
        }
    }
}
struct FilterIconView_Previews: PreviewProvider {
    static var previews: some View {
        FilterIcon()
    }
}

