# seven_days_weather

- Version de Flutter 3.7.1

# Instalacion de proyecto
  - Descargar las dependencias con `flutter pub get`
  - Crear un archivo .env en el directorio raiz con las siguientes variables:
    - RESERVAMOS_API_URL=https://search.reservamos.mx/api/v2
    - OPENWHEATER_API_URL=https://api.openweathermap.org/data/3.0
    - OPENWEATHER_IMAGES_URL= http://openweathermap.org/img/wn
    - OPEN_WEATHER_KEY= Key de open weather
  - Una vez creado el archivo correr con `flutter run`
# Explicacion del proyecto
La estructura del proyecto esta basada en clean, a su vez aunque es un proyecto pequeño decidi generar las depedencias con `Get_It` para desacoplar un poco las capas, tambien se utiliza el `Bloc` como gestor de estados, aunque por el tipo de proyecto bien podria manejarse con solo cubits o algun gestor menos complejo. en un principio queria agregar mas de una pantalla por lo que agregue `Go_router` pero al final decidi por manejar todo en una misma ,y por ultimo inclui algunas pruebas sobre todo en el Bloc principal.
 ## Estructura
  - Core: Aqui van algunas cosas que ayudan en tareas generales de la app, como clases abstractas, clientes para apis, los componentes que estan aqui pueden ser llevados facilmente a cualquier otro proyecto.
  - Data: Se incluye todo lo relacionado con las fuentes de datos, ya sean datos remotos o locales, aqui mismo se busca convertirlos en las entidades que utilizan en la app para posteriormente mostrarlos.
  - Domain: Es el intermediario entre data y presentacion, aqui se guardan los casos de uso, entidades y las clases abstractas que declaran los repositorios.
  - Presentacion: Todo lo relacionado con lo que se muestra al usuario y controla las interacciones que este hace, incluye pantallas, widgets reutilizables y los Blocs para gestionar el estado de la UI.
  
# Capturas de pantalla 
  ![Simulator Screen Shot - iPhone 12 Pro - 2023-02-11 at 10 28 30](https://user-images.githubusercontent.com/25523918/218272271-7a80ef2e-0c2a-4537-998c-3d33f228a472.png)
![Simulator Screen Shot - iPhone 12 Pro - 2023-02-11 at 10 28 15](https://user-images.githubusercontent.com/25523918/218272273-aed72ea9-5071-4601-bee4-34c1f2bdfb1c.png)
![Simulator Screen Shot - iPhone 12 Pro - 2023-02-11 at 10 28 20](https://user-images.githubusercontent.com/25523918/218272274-f8a04130-0254-4f09-bf9f-6ef46a46a978.png)

  
![Simulator Screen Shot - iPhone 12 Pro - 2023-02-11 at 10 28 36](https://user-images.githubusercontent.com/25523918/218272266-36f9983d-d1f7-4978-b337-26c33da41919.png)
