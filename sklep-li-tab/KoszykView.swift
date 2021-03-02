//
//  KoszykView.swift
//  sklep-li-tab
//
//  Created by Leszek Iwanowski on 27/02/2021.
//

import SwiftUI

struct KoszykView: View {

    var body: some View {
        VStack {
            Text("Koszyk: \n").bold().font(.largeTitle)
            List(Koszyk){ produkt in
                KoszykRow(produkt: produkt)
                    
            }
        }
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
