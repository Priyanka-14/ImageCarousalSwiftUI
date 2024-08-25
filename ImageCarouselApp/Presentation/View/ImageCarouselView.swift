//
//  ImageCarouselView.swift
//  ImageCarouselApp
//
//  Created by Priyanka Mahadik on 23/08/24.
//

import SwiftUI

struct ImageCarouselView: View {
    let images: [String]
    @Binding var currentIndex: Int
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(0..<images.count, id: \.self) { index in
                Image(images[index])
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(15)
                    .clipped()
                    .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            startTimer()
        }
    }
    
    private func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { timer in
            currentIndex = (currentIndex + 1) % images.count
        }
    }
}
