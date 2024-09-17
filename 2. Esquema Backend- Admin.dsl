workspace {

    model {
        user = person "Usuario" "Usuario del sistema"

        Admin = softwareSystem "Componente de Administración" {
            UI = container "Interfaz de Usuario" "Interfaz de usuario para el sistema" "Aplicación Web" {
                A1 = component "Login UI" "Interfaz de inicio de sesión del sistema"
                A2 = component "Gestión de Usuarios UI" "Interfaz de gestión de usuarios"
                A3 = component "Gestión de Cuidadores UI" "Interfaz de gestión de cuidadores"
                A4 = component "Gestión de Dispositivos UI" "Interfaz de gestión de dispositivos"
                A5 = component "Gestión de Configuración UI" "Interfaz de gestión de configuración"
            }

            BackendFacade = container "Fachada Backend" "Facilita la comunicación con el backend" {
                AuthAPI = component "API de Autenticación" "Maneja la autenticación y las solicitudes de JWT"
                UserAPI = component "API de Gestión de Usuarios" "Maneja las solicitudes de datos de usuarios"
                CaretakerAPI = component "API de Gestión de Cuidadores" "Maneja las solicitudes de datos de cuidadores"
                DeviceAPI = component "API de Gestión de Dispositivos" "Maneja las solicitudes de datos de dispositivos"
                ConfigAPI = component "API de Gestión de Configuración" "Maneja las solicitudes de datos de configuración"
            }
        }

        Backend = softwareSystem "Backend" {
            AuthService = container "Autenticación" "Maneja la autenticación y validación de tokens" {
                AuthComponent = component "Componente de Autenticación" "Realiza la autenticación y validación de JWT"
            }
            UserService = container "Gestión de Usuarios" "Maneja los datos de usuarios" {
                UserComponent = component "Componente de Gestión de Usuarios" "Maneja los datos de usuarios"
            }
            CaretakerService = container "Gestión de Cuidadores" "Maneja los datos de cuidadores" {
                CaretakerComponent = component "Componente de Gestión de Cuidadores" "Maneja los datos de cuidadores"
            }
            DeviceService = container "Gestión de Dispositivos" "Maneja los datos de dispositivos" {
                DeviceComponent = component "Componente de Gestión de Dispositivos" "Maneja los datos de dispositivos"
            }
            ConfigService = container "Gestión de Configuración" "Maneja los datos de configuración" {
                ConfigComponent = component "Componente de Gestión de Configuración" "Maneja los datos de configuración"
            }
        }

        user -> A1 "Utiliza la interfaz de inicio de sesión"

        A1 -> AuthAPI "Solicita autenticación"
        AuthAPI -> AuthComponent "Envía solicitud de JWT"
        AuthComponent -> AuthAPI "Devuelve JWT"
        AuthAPI -> A1 "Envía JWT"

        A2 -> UserAPI "Solicita datos de usuarios"
        UserAPI -> UserComponent "Obtiene datos de usuarios"
        UserComponent -> UserAPI "Devuelve datos de usuarios"
        UserAPI -> A2 "Devuelve datos de usuarios"

        A3 -> CaretakerAPI "Solicita datos de cuidadores"
        CaretakerAPI -> CaretakerComponent "Obtiene datos de cuidadores"
        CaretakerComponent -> CaretakerAPI "Devuelve datos de cuidadores"
        CaretakerAPI -> A3 "Devuelve datos de cuidadores"

        A4 -> DeviceAPI "Solicita datos de dispositivos"
        DeviceAPI -> DeviceComponent "Obtiene datos de dispositivos"
        DeviceComponent -> DeviceAPI "Devuelve datos de dispositivos"
        DeviceAPI -> A4 "Devuelve datos de dispositivos"

        A5 -> ConfigAPI "Solicita datos de configuración"
        ConfigAPI -> ConfigComponent "Obtiene datos de configuración"
        ConfigComponent -> ConfigAPI "Devuelve datos de configuración"
        ConfigAPI -> A5 "Devuelve datos de configuración"

        A1 -> AuthAPI "Envía JWT al backend"
        AuthAPI -> AuthComponent "Valida JWT"
        AuthComponent -> AuthAPI "JWT validado"
    }

    views {
        systemContext Admin {
            include *
            autolayout lr
        }

        container Admin {
            include *
            autolayout lr
        }

        systemContext Backend {
            include *
            autolayout lr
        }

        container Backend {
            include *
            autolayout lr
        }

        theme default
    }
}