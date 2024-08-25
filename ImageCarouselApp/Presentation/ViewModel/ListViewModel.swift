//
//  ListViewModel.swift
//  ImageCarouselApp
//
//  Created by Priyanka Mahadik on 23/08/24.
//
import SwiftUI

class ListViewModel: ObservableObject {
    @Published var items: [String] = []
    @Published var filteredItems: [String] = []
    
    init() {
        loadItems()
    }
    
    func loadItems() {
        // Load local items
        items = DataModel.shared.loadItems()
        filteredItems = items
    }
    
    func filterItems(searchText: String) {
        if searchText.isEmpty {
            filteredItems = items // Reset to original items when search text is empty
        } else {
            filteredItems = items.filter { $0.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func calculateStatistics() -> (itemCount: Int, topCharacters: [(character: String, count: Int)]) {
        let itemCount = filteredItems.count
        
        var charCounts: [Character: Int] = [:]
        
        filteredItems.joined().forEach { charCounts[$0, default: 0] += 1 }
        
        let topCharacters = charCounts
            .sorted(by: { $0.value > $1.value })
            .prefix(3)
            .map { (String($0.key), $0.value) }
        
        return (itemCount, topCharacters)
    }
}
