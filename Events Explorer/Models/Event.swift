//
//  Event.swift
//  Events Explorer
//
//  Created by Khatib H. on 7/12/21.
//
import Foundation

struct Event: Identifiable, Codable {
    let id: Int
    let title: String
    let datetimeLocal: Date
    let venue: Venue
    let performers: [Performer]?
}

struct Venue: Identifiable, Codable {
    let id: Int
    let displayLocation: String
}

struct Performer: Identifiable, Codable {
    let id: Int
    let name: String
    let image: String?
}


