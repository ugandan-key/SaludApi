//
//  ContentView.swift
//  SaludAPI Channel
//
//  Created by Geovany Monroy Garcia on 26/9/24.
//

import SwiftUI
import Charts
import Foundation

struct ConditionInfo {
    let title: String
    let imageName: String
    let description: String
    let points: [String: [String]]
    let sources: String// Points and subpoints
}



let conditionData: [String: ConditionInfo] = [
    "Lavado de manos": ConditionInfo(
        title: "Lavado de manos",
        imageName: "hands.and.sparkles.fill",
        description: "Información relevante acerca de la técnica correcta de lavado de manos",
        points: [
            "Primer punto": ["Muchas enfermedades y afecciones se propagan al no lavarse las manos con jabón y agua limpia y corriente."],
            "Segundo punto": ["Si no hay jabón y agua disponibles, utiliza un desinfectante de manos con al menos un 60% de alcohol para limpiar tus manos."],
            "Tercer punto": ["• Lavarse las manos es sencillo y es una de las formas más efectivas de prevenir la propagación de gérmenes. Sigue estos cinco pasos cada vez: ", "1. Moja tus manos con agua limpia y corriente (fría o tibia), cierra el grifo y aplica jabón.", "2. Enjabona tus manos frotándolas entre sí con el jabón. Asegúrate de enjabonar el dorso de las manos, entre los dedos y debajo de las uñas.", "3. Frota tus manos durante al menos 20 segundos. ¿Necesitas un temporizador? Canta la canción “Feliz cumpleaños” de principio a fin dos veces.", "4.    Enjuaga bien tus manos bajo agua limpia y corriente.", "5.    Seca tus manos con una toalla limpia o un secador de aire."]
        ],
        sources: "Fuente: CDC - Centers for Disease Control and Prevention  https://www.cdc.gov/healthy/conditions/hand-hygiene.html"
    ),
    "Uso de cubrebocas": ConditionInfo(
        title: "Uso de cubrebocas",
        imageName: "facemask.fill",
        description: "Información relevante acerca del uso de cubrebocas.",
        points: [
            "Primer punto": ["Usar una mascarilla puede reducir el riesgo de transmisión de virus respiratorios. Si la usa una persona infectada, la mascarilla disminuye la propagación del virus a otros. También protege al portador al evitar que inhale partículas infecciosas de su entorno."],
            "Segundo punto": ["En general, las mascarillas pueden actuar como un filtro para reducir la cantidad de gérmenes que inhalas o exhalas. Su efectividad varía según el virus y, por ejemplo, según el tamaño del virus."],
            "Tercer punto": ["• Tipos de mascarillas y niveles de protección:", "1. Mascarillas de tela: Ofrecen niveles de protección más bajos.", "2. Mascarillas quirúrgicas/desechables: Ofrecen mayor protección que las de tela.", "3. Respiradores internacionales (como KN95): Ofrecen más protección que las quirúrgicas.", "4. Respiradores aprobados por NIOSH (como N95): Son los más protectores."]
        ],
        sources: "Fuente: CDC - Centers for Disease Control and Prevention https://www.cdc.gov/respiratory-viruses/prevention/masks.html"
    ),
    "Mantener distancia": ConditionInfo(
        title: "Mantener distancia",
        imageName: "space",
        description: "Información relevante acerca del establecimiento de distancia con las demás personas",
        points: [
        "Primer punto": ["Cuanto más cerca estés de alguien que tiene una enfermedad respiratoria, mayor será la probabilidad de contagiarte. Mantener distancia física entre tú y los demás puede reducir el riesgo de propagar un virus respiratorio. No existe un número exacto que defina una distancia “segura”, ya que la propagación de los virus depende de muchos factores."],
        "Segundo punto": ["En general, las gotas y partículas infecciosas tienden a acumularse más cerca de la persona que las emite. Por lo tanto, cuanto más cerca estés de alguien con un virus respiratorio, mayor será el riesgo de contagio."],
        "Tercer punto": ["• Pasos que puedes tomar: ", "•    Evita estar cerca de personas que muestren síntomas de enfermedades respiratorias.", "•    Evita áreas concurridas donde sea difícil mantener distancia física.", "•    Proporciona a los empleados permisos por enfermedad pagados y políticas de teletrabajo flexibles para que puedan quedarse en casa si están enfermos."]
    ], sources: "Fuente: CDC - Centers for Disease Control and Prevention https://www.cdc.gov/respiratory-viruses/prevention/physical-distancing.html"
    ),
    "Dengue sin datos de alarma (confirmados)": ConditionInfo(
        title: "Dengue sin datos de alarma (confirmados)",
        imageName: "list.bullet.clipboard",
        description: "Información relevante acerca del Dengue sin datos de alarma",
        points: [
        "Primer punto": ["El dengue es una enfermedad febril infecciosa, de etiología viral sistémica (virus Denv-1, Denv-2, Denv-3 y Denv-4)", "Trasmitida por mosquitos hembras del género Aedes sp, de presentación clínica variable, evolución poco predecible, auto limitada y temporalmente incapacitante."],
        "Segundo punto": ["El principal factor de riesgo para el dengue es habitar o visitar una región geográfica con presencia del vector y circulación de uno o más de los serotipos del virus dengue (zona endémica). En estas regiones, un factor de riesgo adicional es la presencia de problemas de suministro de agua potable en forma permanente."],
        "Tercer punto": ["Pasos que puedes tomar: ", "•    Ropa que cubra el cuerpo lo máximo posible", "•    Mosquiteros si se duerme durante el día, a ser posible rociados de repelente", "•    Mosquiteros en las ventanas", "•    Repelentes de mosquitos (que contengan DEET, icaridina o IR3535)", "•     Serpentines fumigantes y vaporizadores."]
    ], sources: "Fuente: OMS - Organización Mundial de la Salud https://www.who.int/es/news-room/fact-sheets/detail/dengue-and-severe-dengue"
        ),
    "Dengue con datos de alarma": ConditionInfo(
        title: "Dengue con datos de alarma",
        imageName: "list.bullet.clipboard",
        description: "Información relevante acerca del Dengue con datos de alarma",
        points: [
        "Primer punto": ["El dengue es una enfermedad febril infecciosa, de etiología viral sistémica (virus Denv-1, Denv-2, Denv-3 y Denv-4)", "Trasmitida por mosquitos hembras del género Aedes sp, de presentación clínica variable, evolución poco predecible, auto limitada y temporalmente incapacitante."],
        "Segundo punto": ["El principal factor de riesgo para el dengue es habitar o visitar una región geográfica con presencia del vector y circulación de uno o más de los serotipos del virus dengue (zona endémica). En estas regiones, un factor de riesgo adicional es la presencia de problemas de suministro de agua potable en forma permanente."],
        "Tercer punto": ["Pasos que puedes tomar: ", "•    Ropa que cubra el cuerpo lo máximo posible", "•    Mosquiteros si se duerme durante el día, a ser posible rociados de repelente", "•    Mosquiteros en las ventanas", "•    Repelentes de mosquitos (que contengan DEET, icaridina o IR3535)", "•     Serpentines fumigantes y vaporizadores."]
    ], sources: "Fuente: OMS - Organización Mundial de la Salud https://www.who.int/es/news-room/fact-sheets/detail/dengue-and-severe-dengue"
        ),
    "Tuberculosis respiratoria": ConditionInfo(
        title: "Tuberculosis respiratoria",
        imageName: "list.bullet.clipboard",
        description: "Información relevante acerca de la tuberculosis respiratoria",
        points: [
        "Primer punto": ["Es una enfermedad infecciosa causada por una bacteria llamada Mycobacterium Tuberculosis. Se puede prevenir y curar, si se trata de manera oportuna.", "Se contagia por tener contacto con las gotitas de saliva de una persona con tuberculosis. Las formas graves de tuberculosis se pueden prevenir con la vacuna Bacillus Calmette-Guerin (BCG)."],
        "Segundo punto": ["Si conoces a alguien con tos de más de un mes, puede tener tuberculosis. Es necesario que acuda a consulta para realizarse estudios y recibir tratamiento si padece esta enfermedad."],
        "Tercer punto": ["En las personas sanas, la infección no suele causar síntomas, porque el sistema inmunitario de la persona actúa para bloquear la bacteria.", "En las personas con tuberculosis, la infección puede causar síntomas, como tos, dolor de cabeza, dificultad para respirar y fiebre."]
    ], sources: "Fuente: IMSS - Instituto Mexicano del Seguro Social https://www.imss.gob.mx/salud-en-linea/tuberculosis-pulmonar"
        )
]

// Obtención de la información de la API
struct DiseaseData: Codable, Identifiable, Equatable {
    var id: String { week }
    let accumulatedCases: String
    let disease: String
    let week: String
    let year: String
    
    enum CodingKeys: String, CodingKey {
        case accumulatedCases = "accumulated_cases"
        case disease
        case week
        case year
    }
    
    func getCleanedData() -> [(diseaseName: String, cases: Int)] {
        // Split accumulated cases and disease names by newline
        let casesArray = accumulatedCases.split(separator: "\n").map { String($0) }
        let diseaseNames = disease.split(separator: "\n").map { String($0) }

        // Debug prints to check if there are multiple diseases and cases
        print("Cases Array: \(casesArray)")
        print("Disease Names: \(diseaseNames)")

        var result: [(String, Int)] = []

        // Iterate through both arrays
        for (index, diseaseName) in diseaseNames.enumerated() {
            // Ensure there are enough case data
            if index < casesArray.count {
                let caseString = casesArray[index].replacingOccurrences(of: " ", with: "")
                
                // Handle case data, convert "-" to 0
                let caseCount: Int
                if caseString == "-" {
                    caseCount = 0
                } else if let number = Int(caseString) {
                    caseCount = number
                } else {
                    caseCount = 0
                    print("Invalid case value: \(caseString)") // Debug log for non-numeric values
                }
                
                result.append((diseaseName, caseCount))
            } else {
                result.append((diseaseName, 0)) // If there are no cases for this disease, assign 0
            }
        }

        print("Cleaned Disease Data: \(result)")
        return result
    }
}

//struct DiseaseCase: Identifiable {
//    var id: String {diseaseName}
//    let diseaseName: String
//    let cases: Int
//}

struct DiseaseEntry: Identifiable {
    let id = UUID()
    let diseaseName: String
    let cases: Int
}

class DataFetcher: ObservableObject {
    @Published var diseaseData: [DiseaseData] = []
//    @Published var sortedData: [DiseaseEntry] = []
    @Published var sortedData: [(diseaseName: String, cases: Int)] = []
    @Published var errorMessage: String? = nil
    
    func fetchData() {
        guard let url = URL(string: "http://127.0.0.1:5050/get_json") else {
            errorMessage = "Invalid URL."
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
                    return
                }
                
                guard let data = data else {
                    self.errorMessage = "No data received."
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let fetchedData = try decoder.decode([DiseaseData].self, from: data)
                    self.diseaseData = fetchedData
                    self.processData()
                } catch {
                    self.errorMessage = "Decoding error: \(error.localizedDescription)"
                }
            }
        }
        
        task.resume()
    }
    
//    private func processData() {
//        self.sortedData = diseaseData
//            .compactMap { data -> DiseaseEntry? in
//                let cleanedData = data.getCleanedData()
//                print("Cleaned Disease Data: \(cleanedData)")
//                return DiseaseEntry(diseaseName: cleanedData.diseaseName, cases: cleanedData.cases)
//            }
//            .sorted { $0.cases > $1.cases }
//
//    }
    
    private func processData() {
        // Fetch the cleaned data, which now returns multiple diseases and cases
        let cleanedData = diseaseData.flatMap { data -> [(String, Int)] in
            let cleaned = data.getCleanedData()
            return cleaned // Returns an array of tuples (diseaseName, cases)
        }

        // Now, sortedData will be an array of disease names and cases sorted by cases
        self.sortedData = cleanedData
            .sorted { $0.1 > $1.1 } // Sort by cases in descending order
    }
}


//Vista de la aplicación

struct ContentView: View {
    @State private var showingSheet: Bool = false
    @State private var selectedCondition: String? = nil
    @StateObject private var dataFetcher = DataFetcher()
    @State private var selectedWeek: String = ""
    @State private var selectedTab: Int = 0
    @State private var selectedDiseaseForLine: String = ""

    // Get all available weeks from the API data
    var availableWeeks: [String] {
        Array(Set(dataFetcher.diseaseData.map { $0.week })).sorted(by: >)
    }

    // Get sorted data for the selected week
    var sortedDataForSelectedWeek: [(diseaseName: String, cases: Int)] {
        dataFetcher.diseaseData
            .filter { $0.week == selectedWeek }
            .flatMap { $0.getCleanedData() }
            .sorted { $0.cases > $1.cases }
    }

    // Get year for selected week
    var selectedYear: String {
        dataFetcher.diseaseData.first(where: { $0.week == selectedWeek })?.year ?? ""
    }

    // Todas las enfermedades disponibles
    var allDiseases: [String] {
        Array(Set(dataFetcher.diseaseData.flatMap { $0.getCleanedData().map { $0.diseaseName } })).sorted()
    }

    // Evolución semanal de la enfermedad seleccionada
    var lineChartData: [(week: String, cases: Int)] {
        dataFetcher.diseaseData
            .map { ($0.week, $0.getCleanedData().first(where: { $0.diseaseName == selectedDiseaseForLine })?.cases ?? 0) }
            .sorted { Int($0.week) ?? 0 < Int($1.week) ?? 0 }
    }

    // Calcula el rango de fechas para una semana y año
    func weekDateRange(week: String, year: String) -> String {
        guard let weekInt = Int(week), let yearInt = Int(year) else { return "" }
        var calendar = Calendar(identifier: .iso8601)
        calendar.firstWeekday = 2 // Lunes
        var components = DateComponents()
        components.weekOfYear = weekInt
        components.yearForWeekOfYear = yearInt
        components.weekday = 2 // Lunes

        if let startDate = calendar.date(from: components) {
            let endDate = calendar.date(byAdding: .day, value: 6, to: startDate)!
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "es_MX")
            formatter.dateFormat = "d 'de' MMMM"
            let startString = formatter.string(from: startDate)
            let endString = formatter.string(from: endDate)
            return "\(startString) al \(endString) de \(year)"
        }
        return ""
    }

    // Colores para las semanas (puedes agregar más si tienes más semanas)
    let weekColors: [Color] = [.red, .blue, .green, .orange, .purple, .pink, .teal, .yellow, .indigo]

    // Obtén el color para la semana seleccionada
    var selectedWeekColor: Color {
        let index = availableWeeks.firstIndex(of: selectedWeek) ?? 0
        return weekColors[index % weekColors.count]
    }

    var body: some View {
        ZStack {
            if let error = dataFetcher.errorMessage {
                VStack(spacing: 20) {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundColor(.orange)
                    Text("No se pudo cargar la información de la API.")
                        .font(.title2)
                        .multilineTextAlignment(.center)
                    Text(error)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                    RecommendationsView(selectedCondition: $selectedCondition, showingSheet: $showingSheet)
                }
                .padding()
            } else if dataFetcher.diseaseData.isEmpty {
                VStack(spacing: 20) {
                    ProgressView()
                    Text("Cargando información...")
                        .font(.title2)
                    RecommendationsView(selectedCondition: $selectedCondition, showingSheet: $showingSheet)
                }
                .padding()
            } else {
                VStack(spacing: 20) {
                    // --- Parte superior con fecha completa ---
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Semana \(selectedWeek)")
                                .font(.title)
                                .fontWeight(.bold)
                            if !selectedYear.isEmpty {
                                Text(weekDateRange(week: selectedWeek, year: selectedYear))
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    // --- Fin parte superior ---

                    // Tabs para cambiar entre gráficas
                    Picker("Vista", selection: $selectedTab) {
                        Text("Por semana").tag(0)
                        Text("Evolución").tag(1)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)

                    if selectedTab == 0 {
                        // Picker para seleccionar semana
                        Picker("Semana", selection: $selectedWeek) {
                            ForEach(availableWeeks, id: \.self) { week in
                                Text("Semana \(week)").tag(week)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)

                        // Gráfica de barras con color dinámico
                        Chart(sortedDataForSelectedWeek.prefix(5), id: \.diseaseName) { entry in
                            BarMark(
                                x: .value("Enfermedad", entry.diseaseName),
                                y: .value("Casos", entry.cases)
                            )
                            .foregroundStyle(selectedWeekColor)
                        }
                        .frame(height: 150)
                        .padding(.horizontal, 30)

                        // Lista de enfermedades
                        VStack(alignment: .leading) {
                            HStack {
                                Text("Enfermedades").foregroundColor(.gray).fontWeight(.bold)
                                Spacer()
                            }
                            Divider()
                            ForEach(sortedDataForSelectedWeek.prefix(3), id: \.diseaseName) { entry in
                                HStack {
                                    Text("\(entry.diseaseName)")
                                        .foregroundColor(.primary)
                                        .onTapGesture {
                                            selectedCondition = entry.diseaseName
                                            showingSheet.toggle()
                                        }
                                    Spacer()
                                    Image(systemName: entry.cases > 40000 ? "arrow.up" : (entry.cases < 20000 ? "arrow.down" : "equal.square"))
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 15, height: 15)
                                        .foregroundColor(entry.cases > 40000 ? .purple : (entry.cases < 20000 ? .green : .red))
                                }
                            }
                        }
                        .padding()
                    } else {
                        // Picker para seleccionar enfermedad
                        Picker("Enfermedad", selection: $selectedDiseaseForLine) {
                            ForEach(allDiseases, id: \.self) { disease in
                                Text(disease).tag(disease)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .padding(.horizontal)

                        // Gráfica de líneas de evolución semanal
                        Chart(lineChartData, id: \.week) { entry in
                            LineMark(
                                x: .value("Semana", entry.week),
                                y: .value("Casos", entry.cases)
                            )
                            .foregroundStyle(.blue)
                            PointMark(
                                x: .value("Semana", entry.week),
                                y: .value("Casos", entry.cases)
                            )
                        }
                        .frame(height: 180)
                        .padding(.horizontal, 30)
                    }

                    RecommendationsView(selectedCondition: $selectedCondition, showingSheet: $showingSheet)
                }
                .padding()
            }
        }
        .onAppear {
            dataFetcher.fetchData()
        }
        .onChange(of: dataFetcher.diseaseData) { newData in
            if let latestWeek = availableWeeks.first {
                selectedWeek = latestWeek
            }
            if let firstDisease = allDiseases.first {
                selectedDiseaseForLine = firstDisease
            }
        }
        .sheet(isPresented: $showingSheet) {
            if let condition = selectedCondition {
                BottomSheetView(condition: condition)
            }
        }
    }
}

struct BottomSheetView: View {
    var condition: String

    var body: some View {
        if let info = conditionData[condition] {
            VStack(spacing: 20) {
                Text(info.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Image(systemName: info.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 55)
                    .foregroundColor(.red)
                
                Text(info.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading) {
                    ForEach(info.points.keys.sorted(), id: \.self) { key in
                        Text(key)
                            .multilineTextAlignment(.leading)
                            .fontWeight(.bold)
                        
                        Group {
                            ForEach(info.points[key] ?? [], id: \.self) { subpoint in
                                Text(subpoint)
                            }
                        }
                        .padding(.leading, 20)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text(info.sources).fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding()
        } else {
            Text("No information available for \(condition).")
                .padding()
        }
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
}


#Preview {
    ContentView()
}
