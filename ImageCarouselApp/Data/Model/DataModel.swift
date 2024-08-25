//
//  DataModel.swift
//  ImageCarouselApp
//
//  Created by Priyanka Mahadik on 24/08/24.
//

import UIKit

class DataModel {
    static let shared = DataModel()
    
    private init() { }

    func loadImages() -> [String] {
        //Add your implementation to Load local or remote images
        return ["image1" ,"image2" ,"image3" ,"image4" ,"image5", "image6"]
    }
    
    func loadItems() -> [String] {
        //Add your implementation to get list items locally or download from server
        return ["India", "Malaysia", "Swizerland", "Indonesia", "England", "Singapur"]
    }
}
