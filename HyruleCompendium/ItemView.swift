//
//  ItemView.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 2.11.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ItemView: View {
    @ObservedObject var networkingManager = HyruleService()
    @State var searchFor: String = ""
    
    var body: some View {
        NavigationView{
            List(searchResults) { equipment in
                NavigationLink(destination: ItemDetailView(item: equipment)){
                    HStack {
                        WebImage(url: URL(string: equipment.image))
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Text(equipment.name.capitalized)
                    }
                }
                    
                
            }.navigationBarTitle("Equipment")
        }
        .onAppear{
            networkingManager.fetchEquipmentData()
        }
        .searchable(text: $searchFor, placement: .automatic)
    }
    
    var searchResults: [EquipmentResult] {
        var equipmentResults = networkingManager.equipmentResults
        
        if searchFor != "" {
            equipmentResults = equipmentResults.filter{
                $0.name.lowercased().contains(searchFor.lowercased())
            }
        }
        
        return equipmentResults.sorted(by: { $0.name < $1.name })
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView()
    }
}
