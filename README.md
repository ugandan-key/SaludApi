# 📱 SaludApi

<div align="center">

![iOS](https://img.shields.io/badge/iOS-15.0+-blue.svg)
![Swift](https://img.shields.io/badge/Swift-5.7+-orange.svg)
![Python](https://img.shields.io/badge/Python-3.8+-green.svg)
![License](https://img.shields.io/badge/License-Educational-yellow.svg)

**Aplicación iOS para información epidemiológica y recomendaciones de salud pública**

[Características](#-características) • [Instalación](#-instalación) • [Uso](#-uso) • [Documentación](#-documentación)

</div>

---

## 📖 Descripción

SaludApi es una aplicación móvil iOS que proporciona acceso rápido a:

- 📊 **Datos epidemiológicos** actualizados semanalmente
- 🛡️ **Recomendaciones de prevención** basadas en CDC/OMS
- 📚 **Guías de práctica clínica** (GPC) oficiales
- 🔔 **Notificaciones diarias** con consejos de salud
- 📱 **Widget** para acceso rápido desde la pantalla de inicio

---

## ✨ Características

### 🔍 Panel Epidemiológico
- Visualización de datos mediante gráficas de barras interactivas
- Información de 11 enfermedades principales
- Filtrado por semana epidemiológica
- Actualización en tiempo real desde API

### 🏥 Enfermedades Cubiertas
- Dengue (con y sin datos de alarma)
- Tuberculosis respiratoria
- Influenza
- COVID-19
- Varicela
- Enfermedades diarreicas agudas
- Infecciones respiratorias agudas
- Enfermedades infecciosas intestinales
- Infección de vías urinarias

### 🛡️ Prevención
- **Lavado de manos**: Técnica correcta paso a paso
- **Uso de cubrebocas**: Tipos y niveles de protección
- **Distanciamiento físico**: Mejores prácticas

### 📚 Recursos Educativos
- PDFs de guías de práctica clínica
- Fuentes oficiales (CDC, OMS, IMSS)
- Acceso directo a documentación médica

---

## 🏗️ Arquitectura

```
┌─────────────────────────────────────────────────────────┐
│                    iOS Application                      │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐ │
│  │ ContentView  │  │ SecondView   │  │ Widget       │ │
│  │ (Gráficas)   │  │ (GPC)        │  │ (Home Screen)│ │
│  └──────────────┘  └──────────────┘  └──────────────┘ │
│  ┌──────────────┐  ┌──────────────┐                    │
│  │PDFViewer     │  │Notifications │                    │
│  └──────────────┘  └──────────────┘                    │
└─────────────────────────────────────────────────────────┘
                            ▲
                            │ HTTP GET
                            │
┌─────────────────────────────────────────────────────────┐
│                 Python Backend (Flask)                  │
│  ┌──────────────────────────────────────────────────┐  │
│  │  GET /get_json                                    │  │
│  │  - Extrae datos de PDFs epidemiológicos          │  │
│  │  - Retorna JSON con casos por semana             │  │
│  └──────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────┘
                            ▲
                            │
                    ┌───────────────┐
                    │  PDFs folder  │
                    │  (sem*.pdf)   │
                    └───────────────┘
```

---

## 🚀 Instalación

### Requisitos

**iOS App:**
- macOS 12.0+
- Xcode 14.0+
- iOS 15.0+ (dispositivo o simulador)

**Backend:**
- Python 3.8+
- pip

### Pasos

#### 1. Clonar el repositorio
```bash
git clone <repository-url>
cd SaludApi
```

#### 2. Configurar Backend
```bash
cd ../ScriptPDF
pip install flask pdfplumber
python Script.py
```

El servidor estará disponible en `http://localhost:5050`

#### 3. Configurar App iOS
```bash
cd ../SaludApi
open SaludApi.xcodeproj
```

En Xcode:
1. Selecciona tu equipo de desarrollo en `Signing & Capabilities`
2. Actualiza la URL del servidor en `ContentView.swift` si es necesario
3. Presiona `Cmd + R` para compilar y ejecutar

---

## 📱 Uso

### Navegación Principal

1. **Vista de Gráficas**
   - Visualiza datos epidemiológicos
   - Filtra por semana
   - Toca una enfermedad para ver detalles

2. **Recomendaciones**
   - Toca un icono para ver información completa
   - Incluye fuentes oficiales

3. **Catálogo de GPC**
   - Navega a la segunda vista
   - Selecciona una guía
   - Lee el PDF en pantalla completa

4. **Widget**
   - Agrega desde pantalla de inicio
   - Acceso rápido a recomendaciones
   - Toca para abrir la app

---

## 🛠️ Tecnologías

### Frontend
- **SwiftUI** - Framework UI declarativo
- **Charts** - Gráficas nativas de Apple
- **PDFKit** - Visualización de documentos
- **WidgetKit** - Widgets de pantalla de inicio
- **UserNotifications** - Notificaciones locales

### Backend
- **Flask** - Servidor web REST
- **pdfplumber** - Extracción de datos de PDFs
- **Python** - Procesamiento de datos

---

## 📂 Estructura del Proyecto

```
SaludApi/
├── SaludApi/
│   ├── SaludApiApp.swift              # Punto de entrada
│   ├── ContentView.swift              # Vista principal con gráficas
│   ├── SecondView.swift               # Catálogo de GPC
│   ├── RecommendationsView.swift      # Recomendaciones de prevención
│   ├── PDFViewer.swift                # Visor de PDFs
│   └── NotificationManager.swift      # Gestor de notificaciones
│
├── SaludApiWidget/                    # Widget de iOS
│   └── SaludApiWidget.swift
│
└── SaludApi.xcodeproj/                # Proyecto Xcode

ScriptPDF/
├── Script.py                          # API Flask
├── output.json                        # Datos procesados
└── pdf/                               # PDFs epidemiológicos
```

---

## 📊 API Endpoints

### `GET /get_json`

Retorna datos epidemiológicos procesados.

**Respuesta:**
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

---

## 🔔 Notificaciones

La app programa notificaciones diarias a las 9:00 AM con recomendaciones aleatorias:
- Lavado de manos
- Uso de cubrebocas
- Distanciamiento físico
- Ventilación de espacios

---

## 📖 Documentación

Para documentación completa y detallada, consulta:

📄 **[DOCUMENTACION.md](DOCUMENTACION.md)**

Incluye:
- Guía completa de cada componente
- Estructuras de datos
- Flujo de información
- Resolución de problemas
- Mejoras futuras

---

## 🐛 Solución de Problemas

### La app no muestra datos
```bash
# Verificar que el servidor Flask esté corriendo
cd ScriptPDF
python Script.py

# Probar endpoint
curl http://localhost:5050/get_json
```

### Notificaciones no aparecen
1. Ir a Configuración > SaludApi > Notificaciones
2. Verificar que estén habilitadas
3. Reinstalar app si es necesario

---

## 🤝 Contribuciones

Este es un proyecto académico. Sugerencias y mejoras son bienvenidas.

---

## 👨‍💻 Autor

**Geovany Monroy Garcia**  
Proyecto de Estancia - 2024/2025

---

## 📜 Licencia

Proyecto educativo - Todos los derechos reservados

---

## 🙏 Agradecimientos

- **CDC** - Información de prevención
- **OMS** - Datos epidemiológicos
- **IMSS** - Guías de práctica clínica
- **Secretaría de Salud** - Boletines epidemiológicos

---

## 📞 Contacto

Para preguntas o sugerencias, por favor contacta al desarrollador.

---

<div align="center">

**Hecho con ❤️ para la educación en salud pública**

</div>
