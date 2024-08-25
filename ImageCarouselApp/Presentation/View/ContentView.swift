//
//  ContentView.swift
//  ImageCarouselApp
//
//  Created by Priyanka Mahadik on 23/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var imageCarouselViewModel = ImageCarouselViewModel()
    @StateObject private var listViewModel = ListViewModel()
    @State private var searchText = ""
    @State private var currentImageIndex = 0
    @State private var showingBottomSheet = false
    @State private var statistics: (itemCount: Int, topCharacters: [(character: String, count: Int)]) = (0, [])

    var body: some View {
        NavigationView {
            VStack {
                ImageCarouselView(images: imageCarouselViewModel.images, currentIndex: $currentImageIndex)
                    .frame(height: 250)
                
                SearchBar(text: $searchText)
                    .onChange(of: searchText) { newValue in
                        listViewModel.filterItems(searchText: newValue)
                    }
                
                List {
                    ForEach(listViewModel.filteredItems, id: \.self) { item in
                        ListItemView(imageName: imageCarouselViewModel.images[currentImageIndex], title: item, subtitle: "Subtitle for \(item)")
                            .listRowSeparator(.hidden)
                    }
                }
                
                Spacer()
                HStack {
                    Spacer()
                    floatingButton
                }
            }
            .navigationTitle("Image Carousel")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingBottomSheet) {
                BottomSheetView(statistics: statistics)
                    .presentationDetents([.medium]) // Set the height of the bottom sheet
            }
        }
    }

    private var floatingButton: some View {
        Button(action: floatingButtonTapped) {
            Text("⋮")
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(width: 60, height: 60)
                .background(Color.blue)
                .clipShape(Circle())
        }
        .padding()
    }

    private func floatingButtonTapped() {
        statistics = listViewModel.calculateStatistics()
        showingBottomSheet.toggle() // Show bottom sheet when button is tapped
    }
}
