//
//  ItemDetailView.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 10.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemDetailView: View {
    let item: EquipmentResult
    
    
    var body: some View {
        ScrollView{
            VStack(spacing: 1){
                WebImage(url: URL(string: item.image))
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                
                Text(item.equipmentDescription)
                    .frame(width: 350, height: 200, alignment: .leading)
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 20){
                    VStack{
                        Text("Common Locations")
                            .font(.headline)
                        if let unwrappedLocations = item.commonLocations {
                            if unwrappedLocations.count > 0 {
                                Text(unwrappedLocations.joined(separator: ", ").capitalized)
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        } else {
                            Text("Unknown")
                        }
                        Spacer()
                        
                        VStack{
                            HStack{
                                Text("Attack")
                                    .font(.headline)
                                if let unwrappedAttack = item.attack{
                                    Text(String(unwrappedAttack))
                                } else {
                                    Text("Unknown")
                                }
                                Text("Defense")
                                    .font(.headline)
                                if let unwrappedDefense = item.defense{
                                    Text(String(unwrappedDefense))
                                } else {
                                    Text("Unknown")
                                }
                            }
                        }
                        
                    }
                }
            }
        }.navigationBarTitle(item.name.capitalized)
    }
}



struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(item: EquipmentResult(attack: 0, commonLocations: ["Tabanha Frontier", "Gerudo Desert"], defense: 22, equipmentDescription:     "This Lizal shield has been strengthened by adding a different type of metal to the mix. The edge is lined with spikes, so handle with care.", id: 378, image: "https://botw-compendium.herokuapp.com/api/v2/entry/reinforced_lizal_shield/image", name: "reinforced lizal shield"))
    }
}
