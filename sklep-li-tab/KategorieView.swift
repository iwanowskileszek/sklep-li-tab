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

struct Kategoria: Identifiable {
    var id = UUID()
    var name = ""
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

struct AddRow: View {
    var string: String
    var produkt: Produkt
    
    @State private var wybranaIlosc = "0"
    let ilosc = ["0","1","2","3","4","5","6","7","8","9"]
    
    var body: some View {
        HStack {
            Text(string)
            VStack {
                Text(String(produkt.iloscWKoszyku))
                Picker("Ilość", selection: $wybranaIlosc) {
                    ForEach(ilosc, id: \.self) {
                        Text($0)
                    }
                }
                Text("wybrałeś: \(wybranaIlosc)")
            }
        }
    }
}


struct ProduktyView: View {
   
    var string: String
    @State var owoce: [Produkt] = [ Produkt(name: "Jabłka"),Produkt(name: "Pomarańcze"), Produkt(name: "Banany")]
    @State var warzywa: [Produkt] = [ Produkt(name: "Marchew"), Produkt(name: "Pietruszka"), Produkt(name: "Sałata"), Produkt(name: "Kalafior")]

      var body: some View {
        VStack {
            if string == "owoce"{
                List(owoce) { produkt in ProduktRow(produkt: produkt)}
            } else {
                List(warzywa) { produkt in ProduktRow(produkt: produkt)}
            }
        }
        .navigationTitle(string)
    }
}

struct ProduktView: View {
    
    var string: String
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle(string)
    }
}
