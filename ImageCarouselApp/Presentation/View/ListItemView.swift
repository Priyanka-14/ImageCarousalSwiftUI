//
//  ListItemView.swift
//  ImageCarouselApp
//
//  Created by Priyanka Mahadik on 23/08/24.
//

import SwiftUI

struct ListItemView: View {
    var imageName: String
    var title: String
    var subtitle: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded corners for the image

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding()
        .background(Color.green.opacity(0.1))
        .cornerRadius(15)
        .frame(height: 60)
        .shadow(radius: 1)
    }
}
