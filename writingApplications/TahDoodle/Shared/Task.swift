//
//  Task.swift
//  TahDoodle
//
//  Created by Jonathan Paul on 4/6/21.
//

import Foundation

struct Task: Equatable, Identifiable, Codable {
    let id: UUID
    let title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
