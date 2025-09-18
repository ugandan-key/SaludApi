import SwiftUI

struct RecommendationsView: View {
    @Binding var selectedCondition: String?
    @Binding var showingSheet: Bool

    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("Recomendaciones").foregroundColor(.gray).fontWeight(.bold).padding(.bottom, 10)
                Spacer()
            }
            Divider()
            HStack(spacing: 40) {
                VStack {
                    Image(systemName: "hands.and.sparkles.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 55)
                        .foregroundColor(.blue)
                    Text("Lavado de manos")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .onTapGesture {
                            selectedCondition = "Lavado de manos"
                            showingSheet.toggle()
                        }
                }
                VStack {
                    Image(systemName: "facemask.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 55)
                        .foregroundColor(.blue)
                    Text("Uso de cubrebocas")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .onTapGesture {
                            selectedCondition = "Uso de cubrebocas"
                            showingSheet.toggle()
                        }
                }
                VStack {
                    Image(systemName: "space")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 65, height: 55)
                        .foregroundColor(.blue)
                    Text("Mantener distancia")
                        .foregroundColor(.gray)
                        .fontWeight(.bold)
                        .onTapGesture {
                            selectedCondition = "Mantener distancia"
                            showingSheet.toggle()
                        }
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(.bottom, 40)
    }
}