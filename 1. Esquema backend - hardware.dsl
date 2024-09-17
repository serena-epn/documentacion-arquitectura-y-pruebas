workspace {

    model {
        user = person "Usuario" {
            description "El usuario que interactúa con el sistema de monitoreo."
        }
        
        hardwareModule = softwareSystem "Módulos de Hardware" {
            description "Sistema de módulos de hardware que gestiona las funcionalidades del dispositivo de monitoreo."
        }
        
        gsmNetwork = softwareSystem "Red GSM" {
            description "Red utilizada para la comunicación GSM entre los módulos de hardware y el backend."
        }
        
        backend = softwareSystem "Backend NestJS" {
            description "Backend construido con NestJS que procesa y gestiona la información recibida de los módulos de hardware."
        }
        
        database = softwareSystem "Base de Datos MongoDB" {
            description "Base de datos MongoDB utilizada para almacenar los datos de la aplicación."
        }

        hardwareModule -> gsmNetwork : "Transmisión de datos GPS y alertas"

        gsmNetwork -> backend : "Transmisión de datos" 
        backend -> database : "Almacenamiento de datos" 
        
    }

    views {
        systemContext hardwareModule {
            include hardwareModule
            include gsmNetwork
            include backend
            include database
            autolayout lr
            description "Vista de contexto del sistema que muestra cómo los módulos de hardware, la red GSM, el backend y la base de datos interactúan en el ecosistema general."
        }

        container hardwareModule {
            include hardwareModule
            include gsmNetwork
            include backend
            include database
            autolayout lr
            description "Vista de contenedor del sistema de módulos de hardware que muestra cómo se comunica con la red GSM, el backend y la base de datos."
        }

        systemLandscape {
            include hardwareModule
            include gsmNetwork
            include backend
            include database
            autolayout lr
            description "Vista del sistema que ilustra todos los sistemas de software y sus relaciones a un nivel alto."
        }

        theme default
    }
}
