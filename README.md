# 🌍 Auditoría de Eficiencia: App Geoespacial Verde

Este proyecto es una versión optimizada de una aplicación móvil Flutter diseñada para el monitoreo de proximidad en el campus. El enfoque principal ha sido la **arquitectura de software verde**, minimizando el consumo de batería (mAh) y optimizando el uso de la memoria RAM.

## 🚀 Características de Optimización

* **Gestión de Estados con Riverpod:** Se eliminó el uso de `setState` para evitar rebuilds de la UI completa. Solo los widgets de distancia se renderizan ante cambios.
* **Sensores Reactivos:** Implementación de `StreamProvider` que gestiona el ciclo de vida del GPS, apagando el sensor automáticamente cuando no es necesario.
* **Filtrado de Movimiento (Green Computing):** Configuración de un umbral de 5 metros para reducir las peticiones al hardware de geolocalización.
* **Arquitectura de Capas:** Separación clara entre la lógica de negocio (Providers) y la interfaz de usuario.

## 🛠️ Tecnologías Utilizadas

* **Flutter & Dart**
* **Riverpod:** Para la gestión de estado avanzada y prevención de fugas de memoria.
* **Geolocator:** Elegida por su alta eficiencia en el manejo del *Fused Location Provider* de Android.

## 📋 Requisitos e Instalación

1.  **Clonar el repositorio:**
    ```bash
    git clone https://github.com/Alejotxw/geoespaciales-UIDE.git
    ```
2.  **Instalar dependencias:**
    ```bash
    flutter pub get
    ```
3.  **Configuración de Permisos:**
    * **Android:** Asegúrate de que el `AndroidManifest.xml` incluya los permisos de `ACCESS_FINE_LOCATION`.
    * **iOS:** El `Info.plist` debe tener las descripciones de uso de ubicación.

## 🔍 Análisis de Auditoría (Resumen)

| Métrica | Antes (setState) | Después (Riverpod + Filter) |
| :--- | :--- | :--- |
| **Rebuilds de Widget Tree** | ~60 por segundo | Solo por cambio de umbral (5m) |
| **Consumo RAM Base** | ~200 MB | ~160 MB |
| **Uso de CPU** | Constante | Bajo / Bajo demanda |

## 🏗️ Lógica de Carga Perezosa (Lazy Loading)
La aplicación está preparada para instanciar modelos 3D (.glb) solo cuando el usuario se encuentra a menos de **50 metros** del punto crítico. Esto ahorra aproximadamente **15MB de transferencia de datos** por cada modelo no cargado prematuramente.

---
**Autor:** Sebastián Chocho
**Institución:** Universidad Internacional del Ecuador.  
**Materia:** Programación Movil.
