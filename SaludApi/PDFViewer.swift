struct PDFViewer: View {
    let fileName: String

    var body: some View {
        PDFKitView(fileName: fileName)
            .navigationTitle(fileName)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct PDFKitView: UIViewRepresentable {
    let fileName: String

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true

        if let url = Bundle.main.url(forResource: fileName, withExtension: nil) {
            pdfView.document = PDFDocument(url: url)
        }

        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {}
}