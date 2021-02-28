//
//  KoszykView.swift
//  sklep-li-tab
//
//  Created by Leszek Iwanowski on 27/02/2021.
//

import SwiftUI

struct KoszykView: View {


    @State public var koszyk: [Produkt] = [
        Produkt(name: "Kalafior", iloscWKoszyku: 5)
    ]

    
    
    
    var body: some View {
        VStack {
            List(koszyk){ produkt in
                KoszykRow(produkt: produkt)
                    
            }
        }
    }

//    func addProdukt(produkt: Produkt) {
//        koszyk.append(produkt)
//    }
    
    func addProdukt(produkt: Produkt) {
        KoszykView().koszyk.append(produkt)
    }
}



struct KoszykView_Previews: PreviewProvider {
    static var previews: some View {
        KoszykView()
    }
}

struct KoszykRow: View {
     var produkt: Produkt

    var body: some View {
        HStack {
            Text(produkt.name)
            Text(String(produkt.iloscWKoszyku))
            
        }
    }
}
