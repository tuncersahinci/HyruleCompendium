//
//  NetworkingService.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 17.10.2021.
//

import Foundation
import Combine

// MARK: - Monsters
struct Monsters: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable, Identifiable {
    let category: Category
    let commonLocations: [String]?
    let datumDescription: String
    let drops: [String]?
    let id: Int
    let image: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case category
        case commonLocations = "common_locations"
        case datumDescription = "description"
        case drops, id, image, name
    }
}

enum Category: String, Codable {
    case monsters = "monsters"
}

class HyruleService: ObservableObject {
    
    var didChange = PassthroughSubject<HyruleService, Never>()
    
    var monsters = Monsters(data: []) {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let url = URL(string: "https://botw-compendium.herokuapp.com/api/v2/category/monsters") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            let monsters = try! JSONDecoder().decode(Monsters.self, from: data)
            DispatchQueue.main.async {
                self.monsters = monsters
            }
            
        }
        .resume()
    }
}
