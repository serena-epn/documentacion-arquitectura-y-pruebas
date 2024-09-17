workspace {

    model {
        // Definición del sistema de monitoreo
        monitoringSystem = softwareSystem "Componente de Monitoreo (React Native)" {
            description "Sistema móvil desarrollado en React Native para monitoreo de dispositivos."

            // Definición de contenedores dentro del sistema de monitoreo
            deviceStatusScreen = container "DeviceStatusScreen" {
                description "Pantalla que muestra el estado del dispositivo."
            }

            mapScreen = container "MapScreen" {
                description "Pantalla que muestra el mapa y la ubicación del dispositivo."
            }

            zonesScreen = container "ZonesScreen" {
                description "Pantalla que muestra las zonas definidas."
            }

            notificationHandler = container "NotificationHandler" {
                description "Manejador de notificaciones push."
            }

            socketIOClient = container "Socket.IO Client" {
                description "Cliente Socket.IO para comunicación en tiempo real."
            }
        }

        // Definición del sistema backend
        backendSystem = softwareSystem "Backend (NestJS)" {
            description "Backend desarrollado en NestJS que maneja la lógica de negocio y servicios."

            // Definición de contenedores dentro del sistema backend
            apiEndpoint = container "API Endpoint" {
                description "Punto final de la API que recibe datos y solicitudes."
            }

            webSocketServer = container "WebSocket Server" {
                description "Servidor WebSocket que maneja la comunicación en tiempo real."
            }

            notificationService = container "Notification Service" {
                description "Servicio que envía notificaciones push."
            }

            database = container "Database" {
                description "Base de datos que almacena la información."
            }

            authenticationService = container "Authentication Service" {
                description "Servicio de autenticación que verifica y valida los tokens."
            }
        }

        // Definición del sistema de Firebase
        firebaseSystem = softwareSystem "Firebase Cloud Messaging" {
            description "Servicio de mensajería en la nube para notificaciones push."

            // Definición de contenedores dentro del sistema Firebase
            fcmService = container "FCM Service" {
                description "Servicio de mensajería para notificaciones push."
            }
        }

        // Definición de relaciones dentro de los sistemas
        deviceStatusScreen -> apiEndpoint : "Envía datos de ubicación"
        mapScreen -> apiEndpoint : "Envía datos de ubicación"
        zonesScreen -> apiEndpoint : "Envía datos de zonas"
        notificationHandler -> fcmService : "Recibe notificaciones push"
        socketIOClient -> webSocketServer : "Envía datos en tiempo real"
        apiEndpoint -> database : "Recupera datos"
        apiEndpoint -> authenticationService : "Verifica autenticación"
        webSocketServer -> deviceStatusScreen : "Envía actualizaciones en tiempo real"
        webSocketServer -> mapScreen : "Envía actualizaciones en tiempo real"
        webSocketServer -> zonesScreen : "Envía actualizaciones en tiempo real"
        notificationService -> fcmService : "Envía notificaciones push"
        fcmService -> notificationHandler : "Notificaciones push"
    }

    views {
        systemContext monitoringSystem {
            include *
            autolayout lr
            description "Vista del sistema que muestra la interacción entre el sistema de monitoreo, el backend y el servicio de mensajería en la nube."
        }

        container monitoringSystem {
            include *
            autolayout lr
            description "Vista de contenedores del sistema de monitoreo, mostrando la interacción entre las pantallas y el cliente Socket.IO."
        }

        systemContext backendSystem {
            include *
            autolayout lr
            description "Vista del sistema backend que muestra la interacción entre los contenedores backend."
        }

        container backendSystem {
            include *
            autolayout lr
            description "Vista de contenedores del sistema backend, mostrando la interacción entre los servicios del backend."
        }

        systemContext firebaseSystem {
            include *
            autolayout lr
            description "Vista del sistema Firebase que muestra la interacción entre el servicio de mensajería y otros sistemas."
        }

        theme default
    }
}
