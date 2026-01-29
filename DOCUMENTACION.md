# 📱 SaludApi - Documentación del Proyecto

## 📋 Índice
1. [Descripción General](#descripción-general)
2. [Características Principales](#características-principales)
3. [Arquitectura del Proyecto](#arquitectura-del-proyecto)
4. [Componentes del Sistema](#componentes-del-sistema)
5. [API y Backend](#api-y-backend)
6. [Guía de Instalación](#guía-de-instalación)
7. [Guía de Uso](#guía-de-uso)
8. [Estructuras de Datos](#estructuras-de-datos)
9. [Tecnologías Utilizadas](#tecnologías-utilizadas)
10. [Mantenimiento y Futuras Mejoras](#mantenimiento-y-futuras-mejoras)

---

## 📖 Descripción General

**SaludApi** es una aplicación iOS desarrollada en SwiftUI que proporciona información epidemiológica y recomendaciones de salud pública. El proyecto está diseñado para ayudar a los usuarios a mantenerse informados sobre enfermedades comunes, medidas de prevención y estadísticas epidemiológicas actualizadas.

### Objetivo del Proyecto
Ofrecer una plataforma accesible y educativa que combine:
- Información sobre enfermedades infecciosas y su prevención
- Estadísticas epidemiológicas en tiempo real
- Recomendaciones de salud pública
- Acceso a guías de práctica clínica (GPC)

### Público Objetivo
- Personal de salud
- Estudiantes del área médica
- Público general interesado en temas de salud pública

---

## ✨ Características Principales

### 1. 📊 Panel de Información Epidemiológica
- Visualización de datos epidemiológicos mediante gráficas de barras
- Información detallada sobre enfermedades como:
  - Dengue (con y sin datos de alarma)
  - Tuberculosis respiratoria
  - Influenza
  - COVID-19
  - Varicela
  - Enfermedades diarreicas agudas
  - Infecciones respiratorias agudas
  - Enfermedades infecciosas intestinales
  - Infección de vías urinarias

### 2. 🛡️ Recomendaciones de Prevención
Tres categorías principales:
- **Lavado de manos**: Técnica correcta y mejores prácticas
- **Uso de cubrebocas**: Tipos de mascarillas y niveles de protección
- **Mantener distancia**: Distanciamiento físico efectivo

### 3. 📚 Catálogo de Guías de Práctica Clínica (GPC)
Acceso directo a PDFs oficiales de:
- Influenza estacionaria
- Tos ferina
- Cólera
- Parálisis flácida aguda

### 4. 🔔 Sistema de Notificaciones
- Notificaciones diarias programadas a las 9:00 AM
- Recordatorios aleatorios de medidas preventivas
- Permisos gestionados automáticamente

### 5. 📱 Widget de iOS
- Widget para pantalla de inicio
- Acceso rápido a recomendaciones de prevención
- Vista previa de enfermedades principales
- Deep linking hacia la app principal

---

## 🏗️ Arquitectura del Proyecto

### Estructura de Directorios

```
SaludApi/
├── SaludApi/                          # Aplicación principal
│   ├── SaludApiApp.swift              # Punto de entrada de la app
│   ├── ContentView.swift              # Vista principal con gráficas
│   ├── SecondView.swift               # Catálogo de GPC
│   ├── RecommendationsView.swift      # Vista de recomendaciones
│   ├── PDFViewer.swift                # Visor de PDFs
│   ├── NotificationManager.swift      # Gestor de notificaciones
│   └── Assets.xcassets/               # Recursos visuales
│
├── SaludApiWidget/                    # Extensión de widget
│   ├── SaludApiWidget.swift           # Widget principal
│   ├── SaludApiWidgetBundle.swift     # Bundle del widget
│   ├── SaludApiWidgetControl.swift    # Controles del widget
│   └── SaludApiWidgetLiveActivity.swift
│
├── SaludApiTests/                     # Pruebas unitarias
├── SaludApiUITests/                   # Pruebas de interfaz
└── SaludApi.xcodeproj/                # Configuración del proyecto

ScriptPDF/                             # Backend y procesamiento
├── Script.py                          # API Flask y extractor de PDFs
├── output.json                        # Datos procesados
├── week_num.txt                       # Control de semana actual
└── pdf/                               # Repositorio de PDFs epidemiológicos
```

---

## 🔧 Componentes del Sistema

### 1. SaludApiApp.swift
**Propósito**: Punto de entrada de la aplicación iOS

**Funcionalidad**:
```swift
@main
struct SaludApiApp: App {
    init() {
        NotificationManager.shared.requestAuthorization()
        NotificationManager.shared.schedulePreventionNotification()
    }
}
```

**Características**:
- Inicializa el sistema de notificaciones al arranque
- Configura deep linking con esquema `saludapi://`
- Gestiona la autorización de notificaciones

---

### 2. ContentView.swift
**Propósito**: Vista principal con información epidemiológica

**Componentes principales**:

#### a) Base de Datos de Enfermedades
```swift
struct ConditionInfo {
    let title: String
    let imageName: String
    let description: String
    let points: [String: [String]]
    let sources: String
}
```

Contiene información detallada de 11 enfermedades con:
- Definición
- Factores de riesgo
- Medidas de prevención
- Fuentes oficiales (OMS, CDC, IMSS)

#### b) Modelo de Datos Epidemiológicos
```swift
struct DiseaseData: Codable, Identifiable, Equatable {
    let accumulatedCases: String
    let disease: String
    let week: String
    let year: String
}
```

#### c) Visualización de Datos
- Gráficas de barras con Swift Charts
- Filtrado por semana epidemiológica
- Conversión de datos con múltiples enfermedades
- Manejo de casos nulos o con guiones

**Funciones clave**:
- `getCleanedData()`: Procesa los datos crudos de la API
- `fetchDiseaseData()`: Obtiene datos del servidor Flask
- Renderizado de gráficas interactivas

---

### 3. NotificationManager.swift
**Propósito**: Gestión centralizada de notificaciones locales

**Características**:
```swift
class NotificationManager {
    static let shared = NotificationManager()
    
    func requestAuthorization()
    func schedulePreventionNotification()
    static func randomRecommendation() -> String
}
```

**Implementación**:
- Patrón Singleton para acceso global
- Notificaciones diarias recurrentes
- Contenido aleatorio de 4 recomendaciones
- Permisos de alerta, sonido y badge

---

### 4. RecommendationsView.swift
**Propósito**: Vista modular de recomendaciones de prevención

**Diseño**:
- Layout horizontal con 3 tarjetas
- Iconos SF Symbols personalizados
- Interacción táctil para mostrar detalles
- Binding bidireccional con la vista padre

**Componentes visuales**:
- `hands.and.sparkles.fill` - Lavado de manos
- `facemask.fill` - Uso de cubrebocas
- `space` - Mantener distancia

---

### 5. SecondView.swift
**Propósito**: Catálogo navegable de GPC

**Características**:
```swift
let pdfFiles = [
    ("Influenza estacionaria", "URL_PDF"),
    ("Tos ferina", "URL_PDF"),
    ("Cólera", "URL_PDF"),
    ("Parálisis flácida aguda", "URL_PDF")
]
```

**Funcionalidad**:
- NavigationStack con List
- Links dinámicos a PDFs externos
- Integración con PDFViewer

---

### 6. PDFViewer.swift
**Propósito**: Visualizador de documentos PDF

**Implementación técnica**:
```swift
struct PDFKitView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> PDFView
    func updateUIView(_ uiView: PDFView, context: Context)
}
```

**Características**:
- Carga asíncrona en background thread
- Auto-escalado automático
- Soporte para PDFs remotos vía URL
- Integración con PDFKit de Apple

---

### 7. SaludApiWidget.swift
**Propósito**: Widget de iOS para pantalla de inicio

**Componentes**:

#### a) Provider
```swift
struct Provider: AppIntentTimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry
    func snapshot(for configuration: ConfigurationAppIntent, 
                  in context: Context) async -> SimpleEntry
    func timeline(for configuration: ConfigurationAppIntent, 
                  in context: Context) async -> Timeline<SimpleEntry>
}
```

#### b) Vista del Widget
- Diseño compacto con 3 iconos de prevención
- Lista de 3 enfermedades principales
- Deep linking hacia la app
- Actualización cada hora (5 entradas)

---

## 🖥️ API y Backend

### Script.py - Servidor Flask

**Propósito**: API REST para extracción de datos epidemiológicos de PDFs

**Tecnologías**:
- Flask (servidor web)
- pdfplumber (extracción de tablas)
- Expresiones regulares (parsing)

**Endpoints**:

#### `GET /get_json`
Retorna todos los datos epidemiológicos procesados

**Respuesta**:
```json
[
  {
    "disease": "Dengue",
    "accumulated_cases": "1234",
    "week": "9",
    "year": "2025"
  }
]
```

**Proceso de extracción**:

1. **Lectura de PDFs**: Escanea carpeta `/pdf/`
2. **Extracción de metadatos**: Identifica semana y año del título
3. **Procesamiento de tablas**: Extrae columnas específicas
4. **Normalización**: Limpia espacios y caracteres especiales
5. **Serialización**: Convierte a JSON

**Funciones clave**:

```python
def extract_week_and_year(page)
    # Extrae semana y año del título del PDF
    
def extract_all_data()
    # Procesa todos los PDFs en la carpeta
    
def load_week_num()
    # Carga número de semana actual
```

**Configuración**:
- Host: `0.0.0.0` (accesible desde la red)
- Puerto: `5050`
- Debug: `True`

**Headers esperados en PDFs**:
- `"ENFERMEDAD"`
- `"EN LA SEMANA 2025"`

---

## 📥 Guía de Instalación

### Requisitos del Sistema

**Para iOS App**:
- macOS 12.0 o superior
- Xcode 14.0+
- iOS 15.0+ (dispositivo o simulador)
- Swift 5.7+

**Para Backend**:
- Python 3.8+
- pip (gestor de paquetes)

### Instalación del Proyecto iOS

1. **Clonar o descargar el proyecto**
```bash
cd /Users/geomonroy/Documents/Estancia/SaludApi
```

2. **Abrir en Xcode**
```bash
open SaludApi.xcodeproj
```

3. **Configurar equipo de desarrollo**
   - En Xcode: `Signing & Capabilities`
   - Seleccionar tu Apple Developer Team
   - Configurar Bundle Identifier único

4. **Compilar y ejecutar**
   - Seleccionar dispositivo/simulador
   - Presionar `Cmd + R`

### Instalación del Backend

1. **Navegar a directorio del script**
```bash
cd /Users/geomonroy/Documents/Estancia/ScriptPDF
```

2. **Instalar dependencias**
```bash
pip install flask pdfplumber
```

3. **Ejecutar servidor**
```bash
python Script.py
```

4. **Verificar funcionamiento**
```bash
curl http://localhost:5050/get_json
```

### Configuración de Conexión

**En ContentView.swift**, actualizar la URL del servidor si es necesario:
```swift
let url = URL(string: "http://localhost:5050/get_json")!
```

Para dispositivos físicos, usar la IP local:
```swift
let url = URL(string: "http://192.168.1.X:5050/get_json")!
```

---

## 📱 Guía de Uso

### Navegación Principal

1. **Pantalla de Inicio**
   - Visualiza gráfica de enfermedades
   - Selector de semana epidemiológica
   - Botón de actualización de datos

2. **Recomendaciones de Prevención**
   - Toca cualquier icono (lavado de manos, cubrebocas, distancia)
   - Se muestra sheet modal con información detallada
   - Incluye puntos clave y fuentes oficiales

3. **Catálogo de GPC**
   - Navega a la segunda vista (TabView o NavigationLink)
   - Selecciona una guía de la lista
   - Visualiza el PDF en pantalla completa
   - Zoom y scroll para navegar el documento

4. **Widget en Pantalla de Inicio**
   - Mantén presionado en la pantalla de inicio
   - Toca el botón "+"
   - Busca "SaludApi"
   - Selecciona tamaño y agrega

### Notificaciones

**Configuración automática**:
- Se solicitan permisos al primer inicio
- Notificación diaria a las 9:00 AM
- Contenido aleatorio de prevención

**Gestión manual**:
- Configuración > SaludApi > Notificaciones
- Activar/desactivar según preferencia

---

## 📊 Estructuras de Datos

### ConditionInfo
```swift
struct ConditionInfo {
    let title: String              // Nombre de la enfermedad
    let imageName: String          // SF Symbol
    let description: String        // Descripción breve
    let points: [String: [String]] // Puntos clave organizados
    let sources: String            // Referencias bibliográficas
}
```

### DiseaseData
```swift
struct DiseaseData: Codable, Identifiable, Equatable {
    let accumulatedCases: String   // Casos (puede contener múltiples líneas)
    let disease: String            // Enfermedad (puede contener múltiples líneas)
    let week: String               // Semana epidemiológica
    let year: String               // Año
    
    // Función de limpieza
    func getCleanedData() -> [(diseaseName: String, cases: Int)]
}
```

**Formato de datos crudos**:
```
disease: "Dengue\nInfluenza\nCOVID-19"
accumulated_cases: "123\n456\n789"
```

**Datos procesados**:
```swift
[
    ("Dengue", 123),
    ("Influenza", 456),
    ("COVID-19", 789)
]
```

---

## 🛠️ Tecnologías Utilizadas

### Frontend (iOS)

| Tecnología | Versión | Uso |
|-----------|---------|-----|
| Swift | 5.7+ | Lenguaje principal |
| SwiftUI | iOS 15+ | Framework UI declarativo |
| Charts | iOS 16+ | Gráficas de barras |
| PDFKit | iOS 11+ | Visualización de PDFs |
| UserNotifications | iOS 10+ | Notificaciones locales |
| WidgetKit | iOS 14+ | Widgets de pantalla de inicio |

### Backend (Python)

| Librería | Versión | Uso |
|----------|---------|-----|
| Flask | 2.0+ | Servidor web REST |
| pdfplumber | 0.9+ | Extracción de tablas PDF |
| re | stdlib | Expresiones regulares |
| datetime | stdlib | Manejo de fechas |
| os | stdlib | Operaciones de archivos |

### Patrones de Diseño

- **MVVM**: Model-View-ViewModel (implícito en SwiftUI)
- **Singleton**: NotificationManager
- **Repository Pattern**: Separación de lógica de datos
- **Observer Pattern**: @State, @Binding en SwiftUI

---

## 🔄 Flujo de Datos

```
┌─────────────────┐
│   PDFs en       │
│   carpeta /pdf/ │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Script.py      │
│  (pdfplumber)   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Flask API      │
│  /get_json      │
└────────┬────────┘
         │
         ▼ HTTP GET
┌─────────────────┐
│  ContentView    │
│  fetchDiseaseData()│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  getCleanedData()│
│  Procesar datos │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Swift Charts   │
│  Visualización  │
└─────────────────┘
```

---

## 🔐 Seguridad y Privacidad

### Permisos de iOS
- **Notificaciones**: Solicitado en primer inicio
- **Datos de salud**: No accede a HealthKit
- **Ubicación**: No requerido
- **Cámara/Micrófono**: No requerido

### Datos Personales
- La app NO recopila información personal
- NO requiere login o registro
- Datos epidemiológicos son anónimos y públicos

### Comunicación de Red
- HTTP sin cifrado para desarrollo
- **Recomendación**: Implementar HTTPS para producción
- Sin tracking ni analytics de terceros

---

## 📈 Mantenimiento y Futuras Mejoras

### Mantenimiento Regular

**Actualización de PDFs**:
1. Descargar boletines epidemiológicos semanales
2. Colocar en carpeta `/pdf/`
3. Reiniciar servidor Flask
4. Los datos se actualizan automáticamente

**Actualización de GPC**:
1. Modificar array `pdfFiles` en `SecondView.swift`
2. Agregar título y URL del nuevo PDF
3. Recompilar la app

### Mejoras Propuestas

#### Corto Plazo
- [ ] Modo oscuro completo
- [ ] Caché de datos epidemiológicos
- [ ] Animaciones en transiciones
- [ ] Exportar gráficas como imagen
- [ ] Búsqueda de enfermedades

#### Mediano Plazo
- [ ] Backend con base de datos (SQLite/PostgreSQL)
- [ ] HTTPS y autenticación
- [ ] Notificaciones push remotas
- [ ] Versión para iPad optimizada
- [ ] Compartir información en redes sociales

#### Largo Plazo
- [ ] App para Android (Kotlin/Flutter)
- [ ] Panel de administración web
- [ ] Machine Learning para predicciones
- [ ] Mapas de calor epidemiológico
- [ ] Integración con Apple Health
- [ ] Soporte multiidioma

---

## 🐛 Resolución de Problemas

### La app no muestra datos

**Posibles causas**:
1. Servidor Flask no está ejecutándose
2. URL incorrecta en el código
3. Firewall bloqueando el puerto 5050

**Solución**:
```bash
# Verificar que el servidor esté corriendo
lsof -i :5050

# Reiniciar servidor
cd ScriptPDF
python Script.py

# Verificar respuesta
curl http://localhost:5050/get_json
```

### Notificaciones no aparecen

**Solución**:
1. Configuración > SaludApi > Notificaciones
2. Verificar que estén habilitadas
3. Reinstalar la app si es necesario

### PDFs no se cargan

**Posibles causas**:
- URL no accesible
- Sin conexión a Internet

**Solución**:
- Verificar URLs en `SecondView.swift`
- Comprobar conexión de red

### Widget no se actualiza

**Solución**:
1. Eliminar widget de la pantalla de inicio
2. Forzar cierre de la app
3. Agregar widget nuevamente

---

## 👥 Créditos

**Desarrollador**: Geovany Monroy Garcia  
**Institución**: Estancia  
**Fecha de creación**: Septiembre 2024  
**Última actualización**: Marzo 2025  

**Fuentes de información**:
- CDC (Centers for Disease Control and Prevention)
- OMS (Organización Mundial de la Salud)
- IMSS (Instituto Mexicano del Seguro Social)
- Secretaría de Salud de México

---

## 📄 Licencia

Este proyecto es de carácter académico y educativo.

---

## 📞 Soporte

Para reportar errores o sugerencias:
- Crear un issue en el repositorio
- Contactar al desarrollador

---

## 🔗 Enlaces Útiles

- [Documentación de SwiftUI](https://developer.apple.com/documentation/swiftui)
- [Swift Charts](https://developer.apple.com/documentation/charts)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [pdfplumber Documentation](https://github.com/jsvine/pdfplumber)

---

**Versión de la Documentación**: 1.0  
**Fecha**: Enero 2026
