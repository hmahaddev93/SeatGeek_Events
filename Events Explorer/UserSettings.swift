//
//  UserSettings.swift
//  Events Explorer
//
//  Created by Khatib H. on 7/13/21.
//

import Foundation
import Combine
class UserSettings: ObservableObject {
    @Published var favoriteEvents = [Event]()
    init() {
        loadFavoriteEventsFromLocal()
    }
    public func isFavorite(event: Event) -> Bool{
        return favoriteEvents.map{$0.id}.contains(event.id)
    }
    
    public func favoriteOrUnfavorite(event: Event) {
        if isFavorite(event: event) {
            favoriteEvents = favoriteEvents.filter { $0.id != event.id }
        }
        else {
            favoriteEvents.append(event)
        }
        saveFavoriteEventsToLocal()
    }
    
    private func saveFavoriteEventsToLocal() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(favoriteEvents), forKey:"favorites")
    }
    
    private func loadFavoriteEventsFromLocal() {
        if let data = UserDefaults.standard.value(forKey:"favorites") as? Data {
            let favorites = try? PropertyListDecoder().decode([Event].self, from: data)
            favoriteEvents = favorites ?? []
        }
    }
}
