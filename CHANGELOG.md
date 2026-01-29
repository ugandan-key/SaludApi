# 📝 Changelog - SaludApi

Todos los cambios notables del proyecto serán documentados en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/es-ES/1.0.0/),
y este proyecto adhiere a [Semantic Versioning](https://semver.org/lang/es/).

---

## [1.0.0] - 2025-03-20

### ✨ Agregado
- **Vista principal con gráficas** de datos epidemiológicos
- **Catálogo de 11 enfermedades** con información detallada:
  - Dengue (con y sin datos de alarma)
  - Tuberculosis respiratoria
  - Influenza
  - COVID-19
  - Varicela
  - Enfermedades diarreicas agudas
  - Infecciones respiratorias agudas
  - Enfermedades infecciosas intestinales
  - Infección de vías urinarias
- **Recomendaciones de prevención** (lavado de manos, cubrebocas, distancia)
- **Visor de PDFs** para guías de práctica clínica
- **Sistema de notificaciones** diarias a las 9:00 AM
- **Widget de iOS** para acceso rápido
- **Backend Flask** para procesamiento de PDFs epidemiológicos

### 🔧 Técnico
- Implementación de SwiftUI para toda la UI
- Uso de Swift Charts para visualización de datos
- PDFKit para renderizado de documentos
- WidgetKit para extensión de widget
- UserNotifications para alertas locales
- Flask + pdfplumber para extracción de datos

---

## [0.5.0] - 2024-10-20

### ✨ Agregado
- Widget inicial para pantalla de inicio
- Deep linking con esquema `saludapi://`
- Timeline provider para actualizaciones del widget

### 🔧 Mejoras
- Optimización de carga de gráficas
- Mejora en el parsing de datos multi-línea

---

## [0.4.0] - 2024-10-04

### ✨ Agregado
- Sistema de notificaciones locales
- NotificationManager como singleton
- Programación de recordatorios diarios
- Recomendaciones aleatorias en notificaciones

### 🔒 Seguridad
- Solicitud de permisos de notificaciones al inicio

---

## [0.3.0] - 2024-09-26

### ✨ Agregado
- ContentView con gráficas de barras
- Integración con Swift Charts
- Modelo de datos DiseaseData
- Función getCleanedData() para procesar datos multi-línea
- Fetch de datos desde API Flask

### 🔧 Mejoras
- Filtrado por semana epidemiológica
- Manejo de casos nulos en datos

---

## [0.2.0] - 2024-09-15

### ✨ Agregado
- SecondView con catálogo de GPC
- PDFViewer con PDFKit
- Navegación entre vistas
- Lista de 4 guías de práctica clínica:
  - Influenza estacionaria
  - Tos ferina
  - Cólera
  - Parálisis flácida aguda

### 🔧 Mejoras
- Carga asíncrona de PDFs en background thread
- Auto-escalado de documentos PDF

---

## [0.1.0] - 2024-09-10

### ✨ Inicial
- Estructura base del proyecto
- SaludApiApp como punto de entrada
- RecommendationsView con 3 categorías de prevención
- Base de datos de condiciones médicas (conditionData)
- Backend Python con Flask
- Script de extracción de PDFs con pdfplumber

---

## 🔮 Próximas Versiones (Roadmap)

### [1.1.0] - Planificado
- [ ] Modo oscuro completo
- [ ] Caché de datos epidemiológicos
- [ ] Animaciones en transiciones
- [ ] Exportar gráficas como imagen
- [ ] Búsqueda de enfermedades

### [1.2.0] - Planificado
- [ ] Base de datos local (SQLite)
- [ ] Soporte offline
- [ ] Historial de semanas anteriores
- [ ] Comparación entre semanas

### [2.0.0] - Futuro
- [ ] Backend con PostgreSQL
- [ ] HTTPS y autenticación
- [ ] Notificaciones push remotas
- [ ] Versión para iPad optimizada
- [ ] Compartir en redes sociales
- [ ] Soporte multiidioma

---

## 🐛 Bugs Conocidos

### Versión Actual (1.0.0)

#### Alto
- Ninguno

#### Medio
- [ ] La app no cachea datos cuando no hay conexión
- [ ] PDFs muy grandes pueden tardar en cargar

#### Bajo
- [ ] En modo oscuro, algunos textos tienen bajo contraste
- [ ] El widget no siempre se actualiza inmediatamente

---

## 🔄 Migraciones y Cambios Breaking

### De 0.x a 1.0.0

**Cambios en API:**
- Endpoint `/get_json` ahora incluye campos `week` y `year`
- Estructura de `DiseaseData` ahora es Codable

**Requerimientos:**
- Actualizar servidor Flask a versión más reciente
- Actualizar PDFs en carpeta `/pdf/` al nuevo formato

---

## 📊 Estadísticas de Desarrollo

### Versión 1.0.0
- **Líneas de código Swift**: ~2,500
- **Líneas de código Python**: ~150
- **Vistas SwiftUI**: 5
- **Archivos principales**: 7
- **Tests unitarios**: Pendiente
- **Enfermedades documentadas**: 11
- **GPC disponibles**: 4

---

## 🎯 Objetivos de Calidad

### Versión 1.0.0
- ✅ Compilación sin warnings
- ✅ Soporte iOS 15+
- ✅ Interfaz responsive
- ❌ Cobertura de tests (objetivo: 80%)
- ❌ Documentación de código (objetivo: 100%)

### Versión 2.0.0
- [ ] HTTPS obligatorio
- [ ] Certificación de seguridad
- [ ] Accesibilidad AAA
- [ ] Soporte VoiceOver completo

---

## 📝 Notas de Versión

### Formato de Versiones

```
MAJOR.MINOR.PATCH

MAJOR: Cambios incompatibles con versiones anteriores
MINOR: Nueva funcionalidad compatible hacia atrás
PATCH: Correcciones de bugs compatibles
```

### Ejemplo
- `1.0.0` → Primera versión estable
- `1.1.0` → Nueva funcionalidad (caché)
- `1.1.1` → Corrección de bug en caché
- `2.0.0` → Cambio arquitectónico importante

---

## 🏷️ Tags y Releases

### Disponibles
- `v1.0.0` - Primera versión estable (2025-03-20)

### Próximos
- `v1.1.0` - Modo oscuro y caché (Q2 2025)
- `v1.2.0` - Soporte offline (Q3 2025)
- `v2.0.0` - Backend completo (Q4 2025)

---

## 👥 Contribuciones

### Versión 1.0.0
- **Geovany Monroy Garcia** - Desarrollo completo
- **CDC/OMS/IMSS** - Contenido médico

---

## 📜 Licencia

Este proyecto es de carácter académico y educativo.

---

**Última actualización del Changelog**: Enero 28, 2026
