//
//  NetworkingService.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 17.10.2021.
//

import Foundation

struct Monsters: Codable {
    let data: [Result]
}


struct Result: Codable, Identifiable {
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
  
    @Published var results = [Result]()
    
    func fetchData() {
        let api = "https://botw-compendium.herokuapp.com/api/v2/category/monsters"
        
        guard let url = URL(string: api) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do {
                if let data = data {
                    let result = try JSONDecoder().decode(Monsters.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.results = result.data.sorted(by: { $0.name < $1.name })
                    }
                } else {
                    print("No data")
                }
            }
            
            catch(let error) {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
