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
        VStack{
            List(networkingManager.results, id: \.id) { monster in
                HStack {
                    WebImage(url: URL(string: monster.image))
                        .resizable()
                        .clipShape(Circle())
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text(monster.name.capitalized)
                }
                    
                
            }
        }.onAppear{
            networkingManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
