//
//  PDFViewer.swift
//  SaludApi
//
//  Created by Geovany Monroy Garcia on 20/3/25.
//
import SwiftUI
import PDFKit

struct PDFViewer: View {
    let urlString: String

    var body: some View {
        PDFKitView(urlString: urlString)
            .navigationTitle("PDF viewer")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PDFKitView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true

        if let url = URL(string: urlString) {
            DispatchQueue.global(qos: .background).async {
                if let pdfDocument = PDFDocument(url: url) {
                    DispatchQueue.main.async {
                        pdfView.document = pdfDocument
                    }
                }
            }
        }

        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}
