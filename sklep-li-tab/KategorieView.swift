//
//  KategorieView.swift
//  sklep-li-tab
//
//  Created by Leszek Iwanowski on 27/02/2021.
//

import SwiftUI

struct KategorieView: View {
    var body: some View {
        NavigationView{
            List{
                Text("Owoce")
                Text("Warzywa")
                Text("Nabiał")
            }
        }
    }
}

struct KategorieView_Previews: PreviewProvider {
    static var previews: some View {
        KategorieView()
    }
}
