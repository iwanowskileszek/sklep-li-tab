//
//  KategorieView.swift
//  sklep-li-tab
//
//  Created by Leszek Iwanowski on 27/02/2021.
//

import SwiftUI

struct KategorieView: View {
    
    @State var koszyk: [Produkt] = [
        Produkt(name: "Kalafior", iloscWKoszyku: 5)
    ]
    
    var stringArray = [
        "Owoce",
        "Warzywa"
    ]

    @State var data: [Kategoria] = [
        Kategoria(name: "Owoce"),
        Kategoria(name: "Warzywa")
    ]
    
    var body: some View {
        NavigationView {
            VStack{
                List(data) { kategoria in
                    KategoriaRow(kategoria: kategoria)
                    NavigationLink(destination:
                        ProduktyView(string: kategoria.name)) {
                    }
                }
                // List(stringArray, id: \.self){ string in CustomRow(string: string, produkt: Produkt(name: string, iloscWKoszyku: 4))}
                //List(data, element: \.element) { kategoria in CustomRow(string: kategoria.name)}
            }
        }
    }
}

struct KategorieView_Previews: PreviewProvider {
    static var previews: some View {
        KategorieView()
    }
}



struct CustomRow: View {
    var string: String
    
    var body: some View {
        HStack {
            Text(string)
        }
    }
}


struct KategoriaRow: View {
    var kategoria: Kategoria

    var body: some View {
        HStack {
            Text(kategoria.name)
        }
    }
}
struct ProduktRow: View {
    var produkt: Produkt
    
    var body: some View {
        HStack {
            VStack {
                Text(String(produkt.name))
            }
        }
    }
}

struct ProduktyView: View {
   
    var string: String
    var body: some View {
        VStack {
            if string == "Owoce"{
                List(owoce) {
                    produkt in ProduktRow(produkt: produkt)
                    NavigationLink(destination:
                        ProduktView(produkt: produkt)) {
                        
                        }
                    }
            } else {
                List(warzywa) {
                    produkt in ProduktRow(produkt: produkt)
                    NavigationLink(destination:
                        //ProduktView(string: produkt.name)) {
                        ProduktView(produkt: produkt)) {
                            
                        }
                }
            }
        }
        .navigationTitle(string)
    }
}

struct ProduktView: View {
    @State private var wybranaIlosc = "0"
    let ilosc = ["0","1","2","3","4","5","6","7","8","9"]
    var produkt: Produkt
    
    var body: some View {
        Text(" ")
        HStack{
            Text(produkt.name)
            Picker("Ilość", selection: $wybranaIlosc) {
                ForEach(ilosc, id: \.self) {
                    Text($0)
                }
            }
        }
        Text("wybrałeś: \(wybranaIlosc)")
        let produkt2: Produkt = Produkt(name: produkt.name, iloscWKoszyku: Int(wybranaIlosc)!)

        NavigationLink(destination: KoszykView())
        {
            Text("Dodaj do koszyka")
        }.simultaneousGesture(TapGesture().onEnded {
            var znaleziono = false
            for produkt in Koszyk {
                var i = 0
                if produkt2.name == produkt.name {
                    Koszyk[i].iloscWKoszyku = Koszyk[i].iloscWKoszyku + produkt2.iloscWKoszyku
                    znaleziono = true
                }
                i += 1
            }
            if znaleziono == false {
                Koszyk.append(produkt2)
            }
        })
    }
}
