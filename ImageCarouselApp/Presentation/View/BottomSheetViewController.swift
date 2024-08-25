//
//  BottomSheetViewController.swift
//  ImageCarouselApp
//
//  Created by Priyanka Mahadik on 23/08/24.
//
import SwiftUI

struct BottomSheetView: View {
    var statistics: (itemCount: Int, topCharacters: [(character: String, count: Int)])
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Statistics")
                .font(.headline)
                .padding(.bottom)
            
            Text("Total Items: \(statistics.itemCount)")
                .font(.subheadline)
            
            Text("Top Characters:")
                .font(.subheadline)
                .padding(.top)
            
            ForEach(statistics.topCharacters, id: \.character) { character in
                Text("\(character.character): \(character.count)")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

