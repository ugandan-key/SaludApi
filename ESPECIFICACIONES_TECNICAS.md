# 🔬 Especificaciones Técnicas - SaludApi

## 📐 Arquitectura Detallada

### Diagrama de Componentes

```
┌───────────────────────────────────────────────────────────────────┐
│                         SaludApi iOS App                          │
├───────────────────────────────────────────────────────────────────┤
│                                                                   │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │                      Presentation Layer                      │ │
│  ├─────────────────────────────────────────────────────────────┤ │
│  │  ┌──────────────┐  ┌──────────────┐  ┌─────────────────┐  │ │
│  │  │ ContentView  │  │ SecondView   │  │ Recommendations │  │ │
│  │  │              │  │              │  │ View            │  │ │
│  │  │ - Gráficas   │  │ - Lista GPC  │  │ - Prevención    │  │ │
│  │  │ - Filtros    │  │ - Navigation │  │ - Sheet Modal   │  │ │
│  │  └──────────────┘  └──────────────┘  └─────────────────┘  │ │
│  │                                                             │ │
│  │  ┌──────────────┐  ┌──────────────────────────────────┐   │ │
│  │  │  PDFViewer   │  │     SaludApiWidget               │   │ │
│  │  │              │  │  - Timeline Provider             │   │ │
│  │  │ - PDFKit     │  │  - Entry View                    │   │ │
│  │  │ - Async Load │  │  - Deep Linking                  │   │ │
│  │  └──────────────┘  └──────────────────────────────────┘   │ │
│  └─────────────────────────────────────────────────────────────┘ │
│                                                                   │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │                       Business Layer                         │ │
│  ├─────────────────────────────────────────────────────────────┤ │
│  │  ┌───────────────────────────────────────────────────────┐ │ │
│  │  │            NotificationManager (Singleton)            │ │ │
│  │  │  - requestAuthorization()                            │ │ │
│  │  │  - schedulePreventionNotification()                  │ │ │
│  │  │  - randomRecommendation()                            │ │ │
│  │  └───────────────────────────────────────────────────────┘ │ │
│  └─────────────────────────────────────────────────────────────┘ │
│                                                                   │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │                         Data Layer                           │ │
│  ├─────────────────────────────────────────────────────────────┤ │
│  │  ┌──────────────────┐    ┌───────────────────────────────┐ │ │
│  │  │  conditionData   │    │     DiseaseData (Codable)     │ │ │
│  │  │  [String:        │    │  - disease: String            │ │ │
│  │  │   ConditionInfo] │    │  - accumulated_cases: String  │ │ │
│  │  │                  │    │  - week: String               │ │ │
│  │  │  - 11 enferme-   │    │  - year: String               │ │ │
│  │  │    dades          │    │  - getCleanedData()           │ │ │
│  │  └──────────────────┘    └───────────────────────────────┘ │ │
│  └─────────────────────────────────────────────────────────────┘ │
│                                                                   │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │                      Network Layer                           │ │
│  ├─────────────────────────────────────────────────────────────┤ │
│  │  ┌───────────────────────────────────────────────────────┐ │ │
│  │  │         URLSession (fetchDiseaseData)                 │ │ │
│  │  │  - GET http://localhost:5050/get_json                │ │ │
│  │  │  - JSONDecoder                                        │ │ │
│  │  │  - Error Handling                                     │ │ │
│  │  └───────────────────────────────────────────────────────┘ │ │
│  └─────────────────────────────────────────────────────────────┘ │
│                                                                   │
└───────────────────────────────────────────────────────────────────┘
                                │
                                │ HTTP GET Request
                                ▼
┌───────────────────────────────────────────────────────────────────┐
│                      Python Backend Service                       │
├───────────────────────────────────────────────────────────────────┤
│                                                                   │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │                      Flask Application                       │ │
│  ├─────────────────────────────────────────────────────────────┤ │
│  │  app = Flask(__name__)                                      │ │
│  │  host: 0.0.0.0                                              │ │
│  │  port: 5050                                                 │ │
│  │                                                              │ │
│  │  Routes:                                                     │ │
│  │  └─ GET /get_json -> extract_all_data()                    │ │
│  └─────────────────────────────────────────────────────────────┘ │
│                                                                   │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │                   Data Processing Module                     │ │
│  ├─────────────────────────────────────────────────────────────┤ │
│  │  ┌────────────────────────────────────────────────────────┐ │ │
│  │  │  extract_week_and_year(page)                           │ │ │
│  │  │  - Regex: r"Semana\s+(\d+),\s*(\d{4})"                │ │ │
│  │  │  - Returns: (week, year)                              │ │ │
│  │  └────────────────────────────────────────────────────────┘ │ │
│  │                                                              │ │
│  │  ┌────────────────────────────────────────────────────────┐ │ │
│  │  │  extract_all_data()                                    │ │ │
│  │  │  - Scan pdf/ folder                                    │ │ │
│  │  │  - For each PDF:                                       │ │ │
│  │  │    1. Open with pdfplumber                            │ │ │
│  │  │    2. Extract tables                                   │ │ │
│  │  │    3. Parse headers                                    │ │ │
│  │  │    4. Filter columns                                   │ │ │
│  │  │    5. Normalize data                                   │ │ │
│  │  │  - Return: List[Dict]                                 │ │ │
│  │  └────────────────────────────────────────────────────────┘ │ │
│  └─────────────────────────────────────────────────────────────┘ │
│                                                                   │
│  ┌─────────────────────────────────────────────────────────────┐ │
│  │                      Storage Layer                           │ │
│  ├─────────────────────────────────────────────────────────────┤ │
│  │  📁 pdf/                                                     │ │
│  │  ├─ sem36.pdf                                               │ │
│  │  ├─ sem37.pdf                                               │ │
│  │  └─ ...                                                      │ │
│  │                                                              │ │
│  │  📄 week_num.txt    (current week tracker)                  │ │
│  │  📄 output.json     (processed data cache)                  │ │
│  └─────────────────────────────────────────────────────────────┘ │
│                                                                   │
└───────────────────────────────────────────────────────────────────┘
```

---

## 🔄 Flujo de Datos Detallado

### 1. Carga Inicial de la App

```
Usuario abre app
      │
      ▼
┌─────────────────┐
│  SaludApiApp    │
│  - init()       │
└─────────────────┘
      │
      ├─► NotificationManager.shared.requestAuthorization()
      │         │
      │         └─► UNUserNotificationCenter.requestAuthorization()
      │                   │
      │                   └─► Usuario acepta/rechaza permisos
      │
      └─► NotificationManager.shared.schedulePreventionNotification()
                │
                └─► UNCalendarNotificationTrigger
                          │
                          └─► Notificación diaria a las 9:00 AM programada
```

### 2. Obtención de Datos Epidemiológicos

```
ContentView aparece
      │
      ▼
.onAppear {
    fetchDiseaseData()
}
      │
      ▼
┌──────────────────────────┐
│  fetchDiseaseData()      │
│  1. URL configuration    │
│  2. URLSession.shared    │
└──────────────────────────┘
      │
      ▼ HTTP GET
┌──────────────────────────┐
│  Flask Server            │
│  GET /get_json           │
└──────────────────────────┘
      │
      ▼
┌──────────────────────────┐
│  extract_all_data()      │
│  - Scan pdf/ folder      │
│  - Parse each PDF        │
│  - Extract tables        │
└──────────────────────────┘
      │
      ▼
JSON Response
      │
      ▼
JSONDecoder
      │
      ▼
@State var diseaseDataArray: [DiseaseData]
      │
      ▼
ForEach(diseaseDataArray) { data in
    let cleanedData = data.getCleanedData()
    Chart { ... }
}
      │
      ▼
Gráfica renderizada en pantalla
```

### 3. Procesamiento de Datos en getCleanedData()

```swift
Input (DiseaseData):
┌──────────────────────────────────────┐
│ disease: "Dengue\nInfluenza\nCOVID"  │
│ accumulated_cases: "123\n456\n789"   │
│ week: "9"                            │
│ year: "2025"                         │
└──────────────────────────────────────┘
      │
      ▼
Split by "\n"
      │
      ├─► diseaseNames = ["Dengue", "Influenza", "COVID"]
      └─► casesArray = ["123", "456", "789"]
      │
      ▼
Iterate & Clean
      │
      ├─► Replace spaces: "123 " -> "123"
      ├─► Convert "-" to 0
      └─► Convert to Int
      │
      ▼
Output:
┌──────────────────────────────────────┐
│ [("Dengue", 123),                    │
│  ("Influenza", 456),                 │
│  ("COVID", 789)]                     │
└──────────────────────────────────────┘
```

---

## 📊 Modelos de Datos

### ConditionInfo

```swift
struct ConditionInfo {
    let title: String              // "Dengue sin datos de alarma"
    let imageName: String          // "list.bullet.clipboard"
    let description: String        // Descripción corta
    let points: [String: [String]] // Estructura jerárquica
    let sources: String            // URLs de referencias
}
```

**Ejemplo de uso:**
```swift
let dengueInfo = conditionData["Dengue sin datos de alarma (confirmados)"]
print(dengueInfo?.title)           // "Dengue sin datos de alarma (confirmados)"
print(dengueInfo?.imageName)       // "list.bullet.clipboard"
print(dengueInfo?.points["Primer punto"])  // Array de strings
```

### DiseaseData

```swift
struct DiseaseData: Codable, Identifiable, Equatable {
    // Propiedades
    let accumulatedCases: String   // Multi-line: "123\n456\n789"
    let disease: String            // Multi-line: "Dengue\nInfluenza\nCOVID"
    let week: String               // "9"
    let year: String               // "2025"
    
    // Computed property para ID
    var id: String { week }
    
    // Mapping de claves JSON
    enum CodingKeys: String, CodingKey {
        case accumulatedCases = "accumulated_cases"
        case disease, week, year
    }
    
    // Procesamiento de datos
    func getCleanedData() -> [(diseaseName: String, cases: Int)]
}
```

**Ejemplo JSON:**
```json
{
  "accumulated_cases": "123\n456",
  "disease": "Dengue\nInfluenza",
  "week": "9",
  "year": "2025"
}
```

---

## 🧩 Componentes SwiftUI

### ContentView

**Responsabilidades:**
- Fetching de datos
- Renderizado de gráficas
- Manejo de estados
- Navegación a detalles

**State Variables:**
```swift
@State private var diseaseDataArray: [DiseaseData] = []
@State private var selectedCondition: String? = nil
@State private var showingSheet = false
@State private var selectedWeek: String = ""
```

**Componentes visuales:**
1. VStack principal
2. Picker de semanas
3. ScrollView con Charts
4. Sheet modal para detalles
5. RecommendationsView

### RecommendationsView

**Parámetros:**
```swift
@Binding var selectedCondition: String?
@Binding var showingSheet: Bool
```

**Layout:**
```
┌─────────────────────────────────────────────┐
│  Recomendaciones                            │
├─────────────────────────────────────────────┤
│  ┌───────┐   ┌───────┐   ┌───────┐         │
│  │ 🧼    │   │ 😷    │   │ 👥    │         │
│  │Lavado │   │Cubre- │   │Distan-│         │
│  │manos  │   │bocas  │   │cia    │         │
│  └───────┘   └───────┘   └───────┘         │
└─────────────────────────────────────────────┘
```

### PDFViewer

**Parámetros:**
```swift
let urlString: String
```

**Implementación UIViewRepresentable:**
```swift
struct PDFKitView: UIViewRepresentable {
    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()
        pdfView.autoScales = true
        
        DispatchQueue.global(qos: .background).async {
            if let pdfDocument = PDFDocument(url: url) {
                DispatchQueue.main.async {
                    pdfView.document = pdfDocument
                }
            }
        }
        
        return pdfView
    }
}
```

---

## 🔔 Sistema de Notificaciones

### NotificationManager (Singleton)

```swift
class NotificationManager {
    static let shared = NotificationManager()
    private init() {}
    
    // Solicitar permisos
    func requestAuthorization() {
        UNUserNotificationCenter.current()
            .requestAuthorization(options: [.alert, .sound, .badge]) {
                granted, error in
                // Handle response
            }
    }
    
    // Programar notificación diaria
    func schedulePreventionNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Medida de prevención"
        content.body = NotificationManager.randomRecommendation()
        content.sound = .default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 9  // 9:00 AM
        
        let trigger = UNCalendarNotificationTrigger(
            dateMatching: dateComponents,
            repeats: true
        )
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger
        )
        
        UNUserNotificationCenter.current().add(request)
    }
}
```

**Recomendaciones disponibles:**
1. "Recuerda lavarte las manos frecuentemente."
2. "Usa cubrebocas en lugares concurridos."
3. "Mantén una distancia segura de otras personas."
4. "Ventila los espacios cerrados con frecuencia."

---

## 📱 Widget de iOS

### Provider (Timeline)

```swift
struct Provider: AppIntentTimelineProvider {
    func timeline(for configuration: ConfigurationAppIntent,
                  in context: Context) async -> Timeline<SimpleEntry> {
        var entries: [SimpleEntry] = []
        let currentDate = Date()
        
        // 5 entradas, una por hora
        for hourOffset in 0..<5 {
            let entryDate = Calendar.current.date(
                byAdding: .hour,
                value: hourOffset,
                to: currentDate
            )!
            let entry = SimpleEntry(date: entryDate, configuration: configuration)
            entries.append(entry)
        }
        
        return Timeline(entries: entries, policy: .atEnd)
    }
}
```

### Entry View

**Layout del widget:**
```
┌────────────────────────────────────────┐
│  🧼          😷          👥      I.V.U. │
│ Lavado     Uso de    Mantener   G.E.P.I│
│ de manos   Cubrebocas distancia COVID-19│
└────────────────────────────────────────┘
```

**Deep Linking:**
```swift
Link(destination: URL(string: "saludapi://open")!) {
    // Widget content
}
```

---

## 🐍 Backend Python

### Flask Application

```python
app = Flask(__name__)

@app.route('/get_json', methods=['GET'])
def get_json():
    extracted_data = extract_all_data()
    return jsonify(extracted_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5050, debug=True)
```

### Función extract_all_data()

```python
def extract_all_data():
    data = []
    pdf_folder = "pdf"
    pdf_files = [f for f in os.listdir(pdf_folder) 
                 if f.endswith(".pdf")]
    
    for pdf_file in pdf_files:
        pdf_path = os.path.join(pdf_folder, pdf_file)
        
        with pdfplumber.open(pdf_path) as pdf:
            for page_num in range(len(pdf.pages)):
                page = pdf.pages[page_num]
                
                # Extraer semana y año
                week, year = extract_week_and_year(page)
                
                # Extraer tablas
                tables = page.extract_tables()
                if not tables:
                    continue
                
                selected_table = tables[table_index_to_extract]
                headers = selected_table[0]
                
                # Normalizar headers
                normalized_headers = [
                    " ".join(h.split()) if h else "" 
                    for h in headers
                ]
                
                # Filtrar columnas deseadas
                selected_indices = [
                    i for i, h in enumerate(normalized_headers) 
                    if h in desired_headers
                ]
                
                # Procesar filas
                for row in selected_table[1:]:
                    filtered_row = {
                        "disease" if normalized_headers[i] == "ENFERMEDAD" 
                        else "accumulated_cases": row[i]
                        for i in selected_indices
                    }
                    filtered_row["week"] = str(week)
                    filtered_row["year"] = str(year)
                    data.append(filtered_row)
    
    return data
```

### Expresión Regular para Extracción

```python
def extract_week_and_year(page):
    """
    Busca en el texto del PDF:
    "Vigilancia Epidemiológica Semana 9, 2025"
    
    Regex: r"Semana\s+(\d+),\s*(\d{4})"
    Grupos: 
      - \d+ : Número de semana
      - \d{4} : Año (4 dígitos)
    """
    text = page.extract_text()
    if text:
        match = re.search(r"Semana\s+(\d+),\s*(\d{4})", text)
        if match:
            return int(match.group(1)), int(match.group(2))
    return None, None
```

---

## 🔒 Seguridad

### Permisos de iOS

| Permiso | Uso | Momento de solicitud |
|---------|-----|---------------------|
| Notificaciones | Alertas diarias | Al iniciar app |
| Internet | Fetch de datos API | Automático |

### Mejores Prácticas Implementadas

✅ No almacena datos personales  
✅ No accede a HealthKit  
✅ No usa ubicación  
✅ Sin tracking de terceros  
✅ Datos epidemiológicos anónimos  

### Recomendaciones para Producción

❌ Actualmente: HTTP sin cifrado  
✅ Implementar: HTTPS con SSL/TLS  
✅ Añadir: Autenticación API (tokens)  
✅ Considerar: Rate limiting en Flask  

---

## ⚡ Optimizaciones

### Performance

1. **Carga asíncrona de PDFs**
   ```swift
   DispatchQueue.global(qos: .background).async {
       // Load PDF
       DispatchQueue.main.async {
           // Update UI
       }
   }
   ```

2. **Caché de datos (futuro)**
   - UserDefaults para última respuesta
   - Timestamp para invalidación

3. **Lazy loading de vistas**
   - NavigationStack carga vistas bajo demanda

### Memoria

- PDFs se cargan solo cuando se visualizan
- Widget usa Timeline con 5 entradas máximo
- Imágenes en Assets.xcassets (optimizadas automáticamente)

---

## 🧪 Testing

### Estructura de Tests

```
SaludApiTests/
├─ SaludApiTests.swift           # Unit tests
│  ├─ testDiseaseDataDecoding()
│  ├─ testGetCleanedData()
│  └─ testNotificationScheduling()

SaludApiUITests/
├─ SaludApiUITests.swift         # UI tests
│  ├─ testMainViewLoads()
│  ├─ testRecommendationSheet()
│  └─ testPDFNavigation()
```

### Ejemplo de Test Unitario

```swift
func testGetCleanedData() {
    let sampleData = DiseaseData(
        accumulatedCases: "123\n456",
        disease: "Dengue\nInfluenza",
        week: "9",
        year: "2025"
    )
    
    let cleaned = sampleData.getCleanedData()
    
    XCTAssertEqual(cleaned.count, 2)
    XCTAssertEqual(cleaned[0].diseaseName, "Dengue")
    XCTAssertEqual(cleaned[0].cases, 123)
}
```

---

## 📦 Dependencias

### iOS

| Framework | Versión | Propósito |
|-----------|---------|-----------|
| SwiftUI | iOS 15+ | UI declarativo |
| Charts | iOS 16+ | Gráficas nativas |
| PDFKit | iOS 11+ | Visualización PDF |
| UserNotifications | iOS 10+ | Notificaciones |
| WidgetKit | iOS 14+ | Widgets |
| Foundation | - | Utilidades base |

### Python

```requirements.txt
Flask==2.3.0
pdfplumber==0.9.0
```

---

## 🚀 Deployment

### TestFlight (Distribución Beta)

1. Archivar en Xcode: `Product > Archive`
2. Subir a App Store Connect
3. Invitar beta testers
4. Distribuir build

### App Store (Producción)

**Requisitos:**
- [ ] Apple Developer Program ($99/año)
- [ ] App Store screenshots
- [ ] Descripción y keywords
- [ ] Privacy policy
- [ ] Soporte HTTPS
- [ ] Review Guidelines compliance

---

## 📈 Métricas y Logging

### Logging Actual

```swift
// En fetchDiseaseData()
print("Error fetching data: \(error)")

// En getCleanedData()
print("Cases Array: \(casesArray)")
print("Disease Names: \(diseaseNames)")
```

### Mejoras Propuestas

```swift
import os.log

let logger = Logger(subsystem: "com.salud.api", category: "network")

// Usage
logger.info("Fetching disease data for week \(week)")
logger.error("Failed to decode JSON: \(error.localizedDescription)")
```

---

## 🔧 Configuración del Proyecto

### Build Settings Importantes

```
PRODUCT_NAME = SaludApi
PRODUCT_BUNDLE_IDENTIFIER = com.yourteam.SaludApi
MARKETING_VERSION = 1.0
CURRENT_PROJECT_VERSION = 1
IPHONEOS_DEPLOYMENT_TARGET = 15.0
SWIFT_VERSION = 5.7
```

### Info.plist

```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>  <!-- Para desarrollo con HTTP -->
</dict>

<key>CFBundleURLTypes</key>
<array>
    <dict>
        <key>CFBundleURLSchemes</key>
        <array>
            <string>saludapi</string>
        </array>
    </dict>
</array>
```

---

## 📝 Notas Técnicas

### Manejo de Estados en SwiftUI

```swift
// Fuente de verdad
@State private var diseaseDataArray: [DiseaseData] = []

// Vinculación bidireccional
@Binding var selectedCondition: String?

// Observación de cambios
@StateObject var manager = NotificationManager.shared
```

### Concurrencia

```swift
// Main thread para UI
DispatchQueue.main.async {
    self.diseaseDataArray = decodedData
}

// Background thread para operaciones pesadas
DispatchQueue.global(qos: .background).async {
    // PDF loading
}
```

---

**Documento técnico versión 1.0**  
Última actualización: Enero 2026
