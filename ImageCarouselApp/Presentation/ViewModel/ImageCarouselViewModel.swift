//
//  ImageCarouselViewModel.swift
//  ImageCarouselApp
//
//  Created by Priyanka Mahadik on 23/08/24.
//

import Foundation
import SwiftUI

class ImageCarouselViewModel: ObservableObject {
    @Published var images: [String] = []
    
    init() {
        loadImages()
    }
    
    private func loadImages() {
        // Get images from model
        images = DataModel.shared.loadImages()
    }
}
