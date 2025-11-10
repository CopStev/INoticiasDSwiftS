#App Noticias con API
Está es una aplicación hecha en XCode (SwiftUI) que consume una API y fue creada con ayuda de Copilot. Igualmente se le agregaron 3 pantallas adicionales que muestran una app completa de noticias que contiene:
- Pantalla de Bienvenida que tiene un botón de modo oscuro 
- Pantalla de Noticias que consume la API de noticias
- Pantalla de los trabajadores del periodico, hecho con una API gratuita con información al azar
- Pantalla de contacto con información hecha con objetos. 
- Un TabView que conecta todas estas pantallas.

## API Utilizadas y tecnologías utilizadas
- SwiftUI
- NewsAPI para las noticias: https://newsapi.org/
- Random User API para los trabajadores: https://randomuser.me/
- Swift Package Manager para gestionar las dependencias
- URLSession para realizar las solicitudes HTTP
- Codable para parsear los datos JSON
- Combine para manejar la asincronía y la vinculación de datos
- Dark Mode para el modo oscuro
 ## Ejecutar el proyecto
1. Clona el repositorio en tu máquina local.
  git clone https://github.com/CopStev/INoticiasDSwiftS.git
2. Abre el proyecto en XCode.

#Nota
“La aplicación utiliza el patrón MVVM para separar la lógica de negocio de la interfaz de usuario y mejorar la mantenibilidad.”
