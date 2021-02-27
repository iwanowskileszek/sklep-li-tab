//
//  ContentView.swift
//  sklep-li-tab
//
//  Created by Leszek Iwanowski on 27/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection = 0
    
    var body: some View {
        TabView(selection: $tabSelection) {
            KategorieView().tabItem {
                Image(systemName:"list.dash")
                Text("Kategorie")
            }.tag(0)
            KoszykView().tabItem {
                Image(systemName:"arrow.up.bin.fill")
                Text("Koszyk")
            }.tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
