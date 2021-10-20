//
//  MonsterDetailView.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 18.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI



struct MonsterDetailView: View {
    
    let monster: Result
    
    
    var body: some View {
        
        VStack{
            WebImage(url: URL(string: monster.image))
                .clipShape(RoundedRectangle(cornerRadius: 25.0))
            
            
            Text(monster.datumDescription)
                .frame(width: 350, height: 200, alignment: .leading)
                .font(.system(size: 16))
            
            VStack(spacing: 20){
                VStack{
                    Text("Common Locations")
                        .font(.headline)
                    if let unwrappedLocations = monster.commonLocations {
                        if unwrappedLocations.count > 0 {
                            ForEach(0..<unwrappedLocations.count, id: \.self) { index in
                                Text(unwrappedLocations[index].capitalized)
                            }
                        } else {
                            Text("Unknown")
                        }
                    }
                }
                
                VStack{
                    Text("Drops")
                        .font(.headline)
                    if let unwrappedDrops = monster.drops {
                        if unwrappedDrops.count > 0 {
                            ForEach(0..<unwrappedDrops.count, id: \.self) { index in
                                Text(unwrappedDrops[index].capitalized)
                            }
                        } else {
                            Text("Unknown")
                        }
                        
                    }
                }
            }
            
        }.navigationBarTitle(monster.name.capitalized)
        
    }
}

struct MonsterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterDetailView(monster: Result(category: Category.monsters, commonLocations:["Hyrule Field", "East Necluda"], datumDescription: "This heavyweight species of monster can be found all over Hyrule. They're physically very strong, their legs along strong enough to resist the force of a bomb blast. They're much more dangerous than the Bokoblins. In fact, Moblins have been known to pick up Bokoblins and throw them as makeshift projectile weapons.", drops: ["moblin horn","moblin fang"], id: 5, image: "https://botw-compendium.herokuapp.com/api/v2/entry/moblin/image", name: "Moblin"))
    }
}
