//
//  ContentView.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 17.10.2021.
//

import SwiftUI
import SDWebImageSwiftUI


struct ContentView: View {
    
    @ObservedObject var networkingManager = HyruleService()
    
    var body: some View {
        NavigationView{
            List(networkingManager.results) { monster in
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
            networkingManager.fetchData()
            }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
