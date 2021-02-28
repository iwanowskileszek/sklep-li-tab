//
//  KoszykView.swift
//  sklep-li-tab
//
//  Created by Leszek Iwanowski on 27/02/2021.
//

import SwiftUI

struct KoszykView: View {
    
    @State var koszyk = [
        "Kalafior"
    ]
     
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Towary w koszyku:")) {
                    ForEach(koszyk, id: \.self) { string in
                        CustomRow(string: string, produkt: Produkt(name: string))
                    }
                    .onDelete { (IndexSet) in
                        delete(at: IndexSet)
                        
                    }
                }
            }
        }
    }
    
    func delete(at indexSet: IndexSet) {
        
    }
    
}

struct KoszykView_Previews: PreviewProvider {
    static var previews: some View {
        KoszykView()
    }
}
