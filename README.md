# Sistema de Gestión y Reserva de Asientos (Bus 44 Capacidad)

### 📄 Descripción del Proyecto
Este proyecto resuelve la digitalización y automatización del proceso de reserva de asientos para el transporte terrestre de pasajeros. Permite a los usuarios visualizar la disponibilidad en tiempo real mediante una interfaz gráfica interactiva adaptada a la distribución de un bus de 44 asientos, seleccionar sus ubicaciones y registrar la reserva de forma segura.

### 🏗️ Arquitectura y Stack Tecnológico
El sistema está construido bajo una arquitectura moderna orientada a eventos y servicios en la nube, dividida en las siguientes capas:

*   **Frontend (Cliente):** Flutter (Dart) - Desarrollo multiplataforma encargado de la interfaz interactiva del mapa de asientos y la experiencia de usuario en tiempo real.
*   **Backend & Cloud Services:** Firebase Authentication - Manejo seguro del control de acceso de usuarios y sesiones.
*   **Base de Datos (Persistencia):** Firebase Cloud Firestore - Base de datos NoSQL orientada a documentos para la sincronización inmediata del estado de los 44 asientos (Disponible, Ocupado, Seleccionado).

### 🚀 Características Clave
*   **Mapa de Asientos Interactivo:** Visualización gráfica y ordenada de la distribución del bus (44 asientos), mostrando visualmente el estado de cada uno.
*   **Sincronización en Tiempo Real:** Uso de WebSockets/Streams de Firestore para evitar colisiones (evita que dos usuarios reserven el mismo asiento simultáneamente).
*   **Gestión de Estados:** Lógica de negocio para controlar el flujo del asiento desde que se selecciona hasta que se confirma la reserva.   