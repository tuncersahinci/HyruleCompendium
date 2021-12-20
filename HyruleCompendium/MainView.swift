//
//  MainView.swift
//  HyruleCompendium
//
//  Created by Tuncer Şahinci on 2.11.2021.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MonsterView()
                .tabItem{
                    Label("Monsters", systemImage: "zl.rectangle.roundedtop")
                }
            ItemView()
                 .tabItem{
                     Label("Equipment", systemImage: "zr.rectangle.roundedtop")
                 }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
