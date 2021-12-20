//
//  ContentView.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 17.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI


struct MonsterView: View {
    
    @ObservedObject var networkingManager = HyruleService()
    @State var searchFor: String = ""
    
    var body: some View {
        NavigationView{
            List(searchResults) { monster in
                NavigationLink(destination: MonsterDetailView(monster: monster)){
                    HStack {
                        WebImage(url: URL(string: monster.image))
                            .resizable()
                            .clipShape(Circle())
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        Text(monster.name.capitalized)
                    }
                }
            }.navigationBarTitle("Monsters")
        }
        .onAppear{
            networkingManager.fetchMonsterData()
        }
        .searchable(text: $searchFor, placement: .automatic)
    }
    
    var searchResults: [MonsterResult] {
        var monsterResults = networkingManager.monsterResults
        
        if searchFor != "" {
            monsterResults = monsterResults.filter{
                $0.name.lowercased().contains(searchFor.lowercased())
            }
        }
        
        return monsterResults.sorted(by: { $0.name < $1.name })
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterView()
    }
}
