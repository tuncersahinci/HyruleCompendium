//
//  NetworkingService.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 17.10.2021.
//

import Foundation

struct Monsters: Codable {
    let data: [MonsterResult]
}


struct MonsterResult: Codable, Identifiable {
    let commonLocations: [String]?
    let monsterDescription: String
    let drops: [String]?
    let id: Int
    let image: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case commonLocations = "common_locations"
        case monsterDescription = "description"
        case drops, id, image, name
    }
}

struct Items: Codable {
    let data: [EquipmentResult]
}

struct EquipmentResult: Codable, Identifiable {
    let attack: Int?
    let commonLocations: [String]?
    let defense: Int?
    let equipmentDescription: String
    let id: Int
    let image: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case attack
        case commonLocations = "common_locations"
        case defense
        case equipmentDescription = "description"
        case id, image, name
    }
}


class HyruleService: ObservableObject {
  
    @Published var monsterResults = [MonsterResult]()
    @Published var equipmentResults = [EquipmentResult]()
    
    func fetchMonsterData() {
        let api = "https://botw-compendium.herokuapp.com/api/v2/category/monsters"
        
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(Monsters.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.monsterResults = result.data.sorted(by: { $0.name < $1.name })
                    }
                } else {
                    print("No data")
                }
            }
            
            catch(let error) {
                debugPrint(error)
            }
        }.resume()
    }
    
    func fetchEquipmentData() {
        let api = "https://botw-compendium.herokuapp.com/api/v2/category/equipment"
        
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(Items.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.equipmentResults = result.data.sorted(by: { $0.name < $1.name })
                    }
                } else {
                    print("No data")
                }
            }
            
            catch(let error) {
                debugPrint(error)
            }
        }.resume()
    }
}
