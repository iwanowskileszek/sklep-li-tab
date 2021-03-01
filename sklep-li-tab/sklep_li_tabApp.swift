//
//  sklep_li_tabApp.swift
//  sklep-li-tab
//
//  Created by Leszek Iwanowski on 27/02/2021.
//

import SwiftUI

@main
struct sklep_li_tabApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

func addToKoszyk(produkt: Produkt){
    Koszyk.append(produkt)
}

var Kategorie: [Kategoria] = [ Kategoria(name: "Owoce"), Kategoria(name: "Warzywa") ]
var owoce: [Produkt] = [ Produkt(name: "Jabłka"),Produkt(name: "Pomarańcze"), Produkt(name: "Banany")]
var warzywa: [Produkt] = [ Produkt(name: "Marchew"), Produkt(name: "Pietruszka"), Produkt(name: "Sałata"), Produkt(name: "Kalafior")]
var Koszyk: [Produkt] = []
    
struct Kategoria: Identifiable {
    var id = UUID()
    var name = ""
}

 struct Produkt: Identifiable {
    var id = UUID()
    var name = ""
    var iloscWKoszyku = 0
}

