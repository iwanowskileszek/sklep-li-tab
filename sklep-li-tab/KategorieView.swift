//
//  KategorieView.swift
//  sklep-li-tab
//
//  Created by Leszek Iwanowski on 27/02/2021.
//

import SwiftUI

struct KategorieView: View {
    

    var stringArray = [
        "Owoce",
        "Warzywa"
    ]

    @State var data: [Kategoria] = [
    Kategoria(name: "Owoce", element: [
        Produkt(name: "Jabłka"),Produkt(name: "Pomarańcze"), Produkt(name: "Banany") ]),
    Kategoria(name: "Warzywa", element: [
        Produkt(name: "Marchew"), Produkt(name: "Pietruszka"), Produkt(name: "Sałata"), Produkt(name: "Kalafior") ])
    ]
    
    
    
    
    var body: some View {
        VStack{
            List(stringArray, id: \.self){ string in CustomRow(string: string, produkt: Produkt(name: string, iloscWKoszyku: 4))}
            //List(data, element: \.element) { kategoria in CustomRow(string: kategoria.name)}
            
        }
    }
}

struct KategorieView_Previews: PreviewProvider {
    static var previews: some View {
        KategorieView()
    }
}

struct Kategoria: Identifiable {
    var id = UUID()
    var name = ""
    var element: [Produkt]?
}

 struct Produkt: Identifiable {
    var id = UUID()
    var name = ""
    var iloscWKoszyku = 0
}

struct Koszyk: Identifiable {
    var id = UUID()
    var element: [Produkt]?
}

struct CustomRow: View {
    var string: String
    var produkt: Produkt
        
    var body: some View {
        HStack {
            Text(string)
            Text(String(produkt.iloscWKoszyku))
            
        }
    }
}
