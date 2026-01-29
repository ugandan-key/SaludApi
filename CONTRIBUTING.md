# 🤝 Guía de Contribución - SaludApi

¡Gracias por tu interés en contribuir a SaludApi! Esta guía te ayudará a entender cómo puedes colaborar en el proyecto.

---

## 📋 Tabla de Contenidos

1. [Código de Conducta](#código-de-conducta)
2. [Cómo Contribuir](#cómo-contribuir)
3. [Reportar Bugs](#reportar-bugs)
4. [Sugerir Mejoras](#sugerir-mejoras)
5. [Proceso de Pull Request](#proceso-de-pull-request)
6. [Guía de Estilo](#guía-de-estilo)
7. [Configuración del Entorno](#configuración-del-entorno)

---

## 📜 Código de Conducta

### Nuestro Compromiso

Este proyecto está comprometido con proporcionar una experiencia libre de acoso para todos, independientemente de:
- Edad
- Tamaño corporal
- Discapacidad
- Etnicidad
- Identidad y expresión de género
- Nivel de experiencia
- Nacionalidad
- Apariencia personal
- Raza
- Religión
- Identidad y orientación sexual

### Comportamiento Esperado

✅ **SÍ:**
- Usar lenguaje acogedor e inclusivo
- Respetar diferentes puntos de vista
- Aceptar críticas constructivas
- Enfocarse en lo mejor para la comunidad
- Mostrar empatía hacia otros miembros

❌ **NO:**
- Usar lenguaje o imágenes sexualizadas
- Hacer comentarios insultantes o despectivos
- Acosar públicamente o privadamente
- Publicar información privada de otros
- Conducta inapropiada en contexto profesional

---

## 🚀 Cómo Contribuir

### Áreas de Contribución

1. **📱 Desarrollo iOS**
   - Nuevas funcionalidades
   - Mejoras de UI/UX
   - Optimizaciones de rendimiento

2. **🐍 Backend Python**
   - Mejoras en extracción de PDFs
   - Nuevos endpoints
   - Optimización de procesamiento

3. **📚 Documentación**
   - Mejorar documentación existente
   - Traducir a otros idiomas
   - Agregar ejemplos y tutoriales

4. **🧪 Testing**
   - Escribir tests unitarios
   - Tests de integración
   - Tests de UI

5. **🎨 Diseño**
   - Iconos y assets
   - Mejoras visuales
   - Experiencia de usuario

---

## 🐛 Reportar Bugs

### Antes de Reportar

1. ✅ Verifica que usas la última versión
2. ✅ Busca si el bug ya fue reportado
3. ✅ Reúne información sobre el problema

### Cómo Reportar

**Crea un issue con:**

```markdown
## Descripción del Bug
[Descripción clara del problema]

## Pasos para Reproducir
1. Ir a '...'
2. Hacer clic en '...'
3. Scrollear hasta '...'
4. Ver error

## Comportamiento Esperado
[Lo que debería pasar]

## Comportamiento Actual
[Lo que realmente pasa]

## Capturas de Pantalla
[Si aplica]

## Entorno
- Dispositivo: [iPhone 15 Pro]
- iOS: [17.2]
- Versión de la app: [1.0.0]

## Información Adicional
[Cualquier otro detalle relevante]
```

### Ejemplo

```markdown
## Descripción del Bug
La app se congela al cargar gráficas con más de 10 enfermedades

## Pasos para Reproducir
1. Abrir la app
2. Seleccionar semana 36
3. Esperar carga de datos
4. La app deja de responder

## Comportamiento Esperado
Las gráficas deberían cargar suavemente

## Comportamiento Actual
La app se congela por 5 segundos

## Entorno
- Dispositivo: iPhone 13
- iOS: 16.5
- Versión: 1.0.0
```

---

## 💡 Sugerir Mejoras

### Tipos de Sugerencias

1. **✨ Nueva Funcionalidad**
2. **🎨 Mejora de Diseño**
3. **⚡ Optimización de Rendimiento**
4. **📚 Mejora de Documentación**

### Template de Sugerencia

```markdown
## Tipo de Mejora
[Nueva funcionalidad / Diseño / Rendimiento / Documentación]

## Problema a Resolver
[¿Qué problema resuelve esta mejora?]

## Solución Propuesta
[Descripción detallada de la mejora]

## Alternativas Consideradas
[Otras opciones que consideraste]

## Impacto
- **Usuarios**: [Cómo beneficia a los usuarios]
- **Desarrollo**: [Esfuerzo estimado]
- **Mantenimiento**: [Complejidad añadida]

## Mockups/Ejemplos
[Si aplica, incluye diseños o código de ejemplo]
```

---

## 🔄 Proceso de Pull Request

### 1. Fork y Clone

```bash
# Fork el repositorio en GitHub
# Luego:
git clone https://github.com/TU-USUARIO/SaludApi.git
cd SaludApi
```

### 2. Crear Branch

```bash
# Para nueva funcionalidad
git checkout -b feature/nombre-descriptivo

# Para corrección de bug
git checkout -b fix/descripcion-bug

# Para documentación
git checkout -b docs/mejora-docs
```

### 3. Hacer Cambios

- ✅ Sigue la guía de estilo
- ✅ Escribe código limpio y documentado
- ✅ Agrega tests si aplica
- ✅ Actualiza documentación

### 4. Commit

```bash
git add .
git commit -m "tipo: descripción breve del cambio

Descripción más detallada si es necesario.

- Cambio 1
- Cambio 2

Fixes #123"
```

**Tipos de commit:**
- `feat:` Nueva funcionalidad
- `fix:` Corrección de bug
- `docs:` Cambios en documentación
- `style:` Formato, sin cambios de código
- `refactor:` Refactorización de código
- `test:` Agregar o modificar tests
- `chore:` Mantenimiento general

**Ejemplos:**
```
feat: agregar búsqueda de enfermedades

fix: corregir crash al cargar PDFs grandes

docs: actualizar README con instrucciones de widget

style: formatear código según SwiftLint

refactor: mejorar función getCleanedData()

test: agregar tests para DiseaseData

chore: actualizar dependencias de Python
```

### 5. Push y PR

```bash
git push origin nombre-de-tu-branch
```

Luego en GitHub:
1. Crea un Pull Request
2. Describe tus cambios detalladamente
3. Vincula issues relacionados
4. Espera revisión

### Template de Pull Request

```markdown
## Descripción
[Breve descripción de los cambios]

## Tipo de Cambio
- [ ] Bug fix
- [ ] Nueva funcionalidad
- [ ] Breaking change
- [ ] Documentación

## Checklist
- [ ] Mi código sigue la guía de estilo
- [ ] He realizado auto-revisión
- [ ] He comentado código complejo
- [ ] He actualizado la documentación
- [ ] Mis cambios no generan warnings
- [ ] He agregado tests
- [ ] Todos los tests pasan
- [ ] He actualizado el CHANGELOG

## Capturas/Videos
[Si aplica]

## Issues Relacionados
Closes #123
Related to #456
```

---

## 📐 Guía de Estilo

### Swift

#### Nomenclatura

```swift
// ✅ CORRECTO
class NotificationManager { }
struct DiseaseData { }
let selectedCondition: String
func fetchDiseaseData() { }

// ❌ INCORRECTO
class notificationmanager { }
struct disease_data { }
let selected_condition: String
func FetchDiseaseData() { }
```

#### Estructura de Archivos

```swift
// 1. Imports
import SwiftUI
import Charts

// 2. Tipos principales
struct ContentView: View {
    
    // 3. Propiedades
    @State private var data: [Data] = []
    
    // 4. Body
    var body: some View {
        // ...
    }
    
    // 5. Métodos privados
    private func loadData() {
        // ...
    }
}

// 6. Extensions
extension ContentView {
    // Helper methods
}

// 7. Preview
#Preview {
    ContentView()
}
```

#### Comentarios

```swift
// ✅ Comentarios descriptivos
/// Obtiene datos epidemiológicos de la API
/// - Returns: Array de DiseaseData
func fetchDiseaseData() -> [DiseaseData] {
    // Configurar URL
    let url = URL(string: apiEndpoint)!
    
    // Realizar request
    // ...
}

// ❌ Comentarios obvios
// Crea una variable
let x = 5
```

#### SwiftUI Best Practices

```swift
// ✅ Extraer vistas complejas
var body: some View {
    VStack {
        headerView
        contentView
        footerView
    }
}

private var headerView: some View {
    // ...
}

// ❌ Todo en body
var body: some View {
    VStack {
        // 200 líneas de código
    }
}
```

### Python

#### Estilo PEP 8

```python
# ✅ CORRECTO
def extract_all_data():
    """Extrae datos de todos los PDFs."""
    data = []
    for file in pdf_files:
        processed = process_file(file)
        data.append(processed)
    return data

# ❌ INCORRECTO
def ExtractAllData():
    Data=[]
    for file in pdf_files:
        Data.append(ProcessFile(file))
    return Data
```

#### Docstrings

```python
def extract_week_and_year(page):
    """
    Extrae semana y año del título del PDF.
    
    Args:
        page: Objeto página de pdfplumber
        
    Returns:
        tuple: (week, year) o (None, None) si no se encuentra
        
    Example:
        >>> page = pdf.pages[0]
        >>> extract_week_and_year(page)
        (9, 2025)
    """
    # Implementación
```

### Markdown

```markdown
# ✅ Estructura clara
## Sección Principal
### Subsección
- Punto 1
- Punto 2

# ❌ Sin estructura
Todo en un párrafo largo sin organización...
```

---

## 🛠️ Configuración del Entorno

### iOS Development

1. **Requisitos**
   ```
   - macOS 12.0+
   - Xcode 14.0+
   - Swift 5.7+
   ```

2. **Setup**
   ```bash
   cd SaludApi
   open SaludApi.xcodeproj
   ```

3. **Configurar Signing**
   - Xcode > Targets > SaludApi
   - Signing & Capabilities
   - Seleccionar tu Team

4. **Linter (Opcional)**
   ```bash
   brew install swiftlint
   ```

### Python Backend

1. **Virtual Environment**
   ```bash
   cd ScriptPDF
   python3 -m venv venv
   source venv/bin/activate  # macOS/Linux
   ```

2. **Instalar Dependencias**
   ```bash
   pip install -r requirements.txt
   ```

3. **Linter**
   ```bash
   pip install pylint black
   black Script.py  # Formatear
   pylint Script.py  # Revisar
   ```

---

## ✅ Checklist de Calidad

Antes de enviar un PR, verifica:

### Código
- [ ] Compilación sin errores ni warnings
- [ ] Código formateado según guía de estilo
- [ ] No hay código comentado innecesario
- [ ] Variables y funciones tienen nombres descriptivos
- [ ] Funciones complejas están documentadas

### Testing
- [ ] Tests unitarios pasan
- [ ] Tests nuevos para nueva funcionalidad
- [ ] Probado en dispositivo/simulador
- [ ] No rompe funcionalidad existente

### Documentación
- [ ] README actualizado si es necesario
- [ ] CHANGELOG.md actualizado
- [ ] Comentarios en código complejo
- [ ] Docstrings en funciones públicas

### Performance
- [ ] No causa memory leaks
- [ ] No afecta negativamente el rendimiento
- [ ] Imágenes optimizadas (si aplica)

---

## 🏆 Reconocimientos

Los contribuyentes serán reconocidos en:
- 📄 README.md (sección de créditos)
- 📝 CHANGELOG.md (por versión)
- 🎉 Releases notes

---

## 📞 Contacto

- **Issues**: Para bugs y sugerencias
- **Discussions**: Para preguntas generales
- **Email**: Para temas privados

---

## 📚 Recursos Útiles

### Documentación
- [Swift Documentation](https://swift.org/documentation/)
- [SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui)
- [Flask Documentation](https://flask.palletsprojects.com/)
- [pdfplumber Docs](https://github.com/jsvine/pdfplumber)

### Herramientas
- [SwiftLint](https://github.com/realm/SwiftLint)
- [Black (Python formatter)](https://github.com/psf/black)
- [Git Flow](https://nvie.com/posts/a-successful-git-branching-model/)

---

**¡Gracias por contribuir a SaludApi! 🎉**

Cada contribución, por pequeña que sea, hace la diferencia.
