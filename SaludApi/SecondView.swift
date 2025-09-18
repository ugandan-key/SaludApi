//
//  SecondView.swift
//  SaludApi
//
//  Created by Geovany Monroy Garcia on 20/3/25.
//

import SwiftUI
import PDFKit

struct SecondView: View {
    let pdfFiles = [
            ("Influenza estacionaria", "https://www.gob.mx/cms/uploads/attachment/file/59629/EyR_SS_384_09.compressed.pdf"),
            ("Tos ferina", "https://www.imss.gob.mx/sites/all/statics/guiasclinicas/475GER.pdf"),
            ("Cólera",
             "https://www.imss.gob.mx/sites/all/statics/pdf/profesionales-salud/Guia_colera.pdf"),
            ("Parálisis flácida aguda",
             "https://www.imss.gob.mx/sites/all/statics/guiasclinicas/089GRR.pdf")
        ]

    var body: some View {
        HStack{
            Text("Catálogo de GPC")
                .font(.title2)
                .fontWeight(.bold)
        }
        NavigationStack {
                    List(pdfFiles, id: \.1) { (name, url) in
                        NavigationLink(destination: PDFViewer(urlString: url)) {
                            Text(name)
                                .padding()
                        }
                    }
                    .navigationTitle("Guías")
                }
    }
}


#Preview {
    SecondView()
}
