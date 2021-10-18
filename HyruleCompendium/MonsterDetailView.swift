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
                
                Spacer()
                
                
                    
            }.navigationBarTitle(monster.name.capitalized)
        
        
    }
}

struct MonsterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterDetailView(monster: Result(category: Category.monsters, commonLocations:["Hyrule Field", "East Necluda"], datumDescription: "This heavyweight species of monster can be found all over Hyrule. They're physically very strong, their legs along strong enough to resist the force of a bomb blast. They're much more dangerous than the Bokoblins. In fact, Moblins have been known to pick up Bokoblins and throw them as makeshift projectile weapons.", drops: ["moblin horn","moblin fang"], id: 5, image: "https://botw-compendium.herokuapp.com/api/v2/entry/moblin/image", name: "Moblin"))
    }
}
