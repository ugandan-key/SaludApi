# ⚡ Guía Rápida - SaludApi

## 🚀 Inicio Rápido (5 minutos)

### 1️⃣ Iniciar el Backend
```bash
cd ScriptPDF
python Script.py
```
✅ Servidor corriendo en `http://localhost:5050`

### 2️⃣ Abrir proyecto iOS
```bash
cd ../SaludApi
open SaludApi.xcodeproj
```

### 3️⃣ Ejecutar
- Seleccionar iPhone 15 Pro (Simulator)
- Presionar `Cmd + R`

---

## 📱 Cómo usar la App

### Ver estadísticas epidemiológicas
1. Abre la app
2. Desliza el picker de semanas
3. La gráfica se actualiza automáticamente

### Leer sobre prevención
1. Toca cualquier ícono de recomendación
2. Lee la información detallada
3. Desliza hacia abajo para cerrar

### Acceder a guías médicas
1. Navega a "Catálogo de GPC"
2. Selecciona una guía
3. Zoom con pellizco para ampliar

### Agregar Widget
1. Mantén presionada la pantalla de inicio
2. Toca el botón "+"
3. Busca "SaludApi"
4. Arrastra el widget

---

## 🔧 Comandos Útiles

### Backend
```bash
# Iniciar servidor
python Script.py

# Probar API
curl http://localhost:5050/get_json

# Ver logs
# Los logs aparecen en la terminal donde ejecutaste Script.py
```

### iOS (Terminal)
```bash
# Limpiar build
cd SaludApi
xcodebuild clean

# Listar simuladores
xcrun simctl list devices

# Abrir simulador específico
open -a Simulator
```

---

## 🐛 Problemas Comunes

| Problema | Solución |
|----------|----------|
| No se ven datos en la app | Verifica que Flask esté corriendo: `lsof -i :5050` |
| Error de firma de código | Selecciona tu Apple ID en Xcode > Signing & Capabilities |
| Notificaciones no funcionan | Reinstala la app y acepta permisos |
| PDF no carga | Verifica conexión a internet |

---

## 📝 Actualizar Datos Epidemiológicos

1. Descarga nuevo PDF semanal
2. Guárdalo en `ScriptPDF/pdf/`
3. Nombre: `semXX.pdf` (ej: `sem36.pdf`)
4. Reinicia Flask
5. Refresca la app

---

## 🔑 Atajos de Teclado (Xcode)

| Atajo | Acción |
|-------|--------|
| `Cmd + R` | Ejecutar app |
| `Cmd + .` | Detener ejecución |
| `Cmd + B` | Compilar |
| `Cmd + Shift + K` | Limpiar build |
| `Cmd + 0` | Mostrar/ocultar navegador |

---

## 📂 Archivos Importantes

```
ContentView.swift         # Vista principal con gráficas
NotificationManager.swift # Configurar notificaciones
Script.py                 # API y procesamiento de PDFs
SecondView.swift          # Agregar nuevas GPC
```

---

## 🎯 Tareas Frecuentes

### Agregar nueva enfermedad al catálogo
Edita `ContentView.swift`, línea ~20:
```swift
"Nueva Enfermedad": ConditionInfo(
    title: "Nueva Enfermedad",
    imageName: "heart.fill",
    description: "Descripción...",
    points: [...],
    sources: "Fuente: ..."
)
```

### Agregar nueva GPC
Edita `SecondView.swift`, línea ~12:
```swift
("Nombre de la guía", "https://url-del-pdf.pdf")
```

### Cambiar hora de notificación
Edita `NotificationManager.swift`, línea ~21:
```swift
dateComponents.hour = 10  // Cambiar a 10:00 AM
```

---

## 📊 Endpoints API

### Obtener todos los datos
```bash
curl http://localhost:5050/get_json
```

### Formato de respuesta
```json
[
  {
    "disease": "Nombre de la enfermedad",
    "accumulated_cases": "123",
    "week": "9",
    "year": "2025"
  }
]
```

---

## 💡 Tips

- 🔄 La app cachea datos - cierra y vuelve a abrir para refrescar
- 📱 Prueba en dispositivo real para notificaciones push
- 🎨 Los colores se adaptan automáticamente a modo oscuro
- 📊 Las gráficas son interactivas - toca las barras
- 🔍 Usa zoom en PDFs con dos dedos

---

## 🆘 Soporte Rápido

### Flask no inicia
```bash
# Verificar puerto ocupado
lsof -i :5050
kill -9 <PID>

# Reinstalar dependencias
pip install --upgrade flask pdfplumber
```

### Xcode no compila
```bash
# Limpiar cache
rm -rf ~/Library/Developer/Xcode/DerivedData

# Cerrar Xcode y volver a abrir
```

---

## 📈 Próximos Pasos

1. ✅ App funcionando
2. 📚 Lee [DOCUMENTACION.md](DOCUMENTACION.md) para detalles
3. 🎨 Personaliza colores e iconos
4. 🚀 Agrega más enfermedades
5. 📱 Prueba en dispositivo físico

---

**¿Necesitas ayuda?** Consulta la documentación completa en [DOCUMENTACION.md](DOCUMENTACION.md)
