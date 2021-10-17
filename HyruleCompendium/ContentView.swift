//
//  ContentView.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 17.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkingManager = HyruleService()

    var body: some View {
        Button("Tap me") {
            print(networkingManager.monsters.data.count)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
