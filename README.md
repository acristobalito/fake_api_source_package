Si estas buscando un paquete que consuma los servicios de [FakeStoreAPI](https://fakestoreapi.com/) estas en el lugar correcto! 🎉

# Tabla de contenidos
1. [Caracterízticas](#Caracterízticas)
2. [Instalación](#Instalación)
3. [Uso](#Uso)
4. [Información adicional](#Información_adicional)
5. [Librerias](#Librerias)
6. [Equipo](#Equipo)
7. [Conclusiones](#Conclusiones)

## Caracterízticas

El presente paquete construido en Dart, consume 3 diferentes API's de la [FakeStoreAPI](https://fakestoreapi.com/).
Proporciona una clase que contiene los 3 diferentes metodos: getAllCategories(), getProductFromCategory(), getAllProducts(). 

## Instalación

Para usar el paquete, dentro del archivo pubspec.yaml agregar lo siguiente:   
```
dependencies:
  ...yaml
  fake_api_source_package:
  git:
    url: https://github.com/acristobalito/fake_api_source_package
    ref: main
```

## Uso

Para acceder a los metodos del paquete, podemos hacer lo siguiente:
```dart
final catalog = FakeApiSourcePackage();
final String category = 'electronics';
final responseAllCategories = await catalog.getAllCategories();
final responseGetProductsFromCategories = await catalog.getProductFromCategory(category);
final responseAllProducts = await catalog.getAllProducts();
```
Estos metodos se encargan de retornar modelos que pueden ser reutilizados en su proyecto.    
En el proyecto example del paquete, dentro del archivo main_screen_provider.dart, podemos encontrar todas las categorias disponibles de la Api, por defecto el ejemplo tiene definida la categoria 'electronics'.  
Para ejecutar el proyecto de ejemplo, debemos situarnos mediante la terminal en la ruta en la que se encuentra el proyecto y ejecutar los siguientes comandos:
```batch
cd example
flutter pub get
flutter run
```

## Información adicional

Al ejecutar el proyecto example, tenemos una vista en la que se muestran 3 secciones:  
* Todas las categorias
* Productos por categoria electronics
* Todos los productos  
Tengamos en cuenta que si por alguna razon fallan los servicios de ApiFakeStore el proyecto example mostrara una barra circular de carga la cual se mantendra cargando indefinidamente, por lo contrario, si existe una respuesta, este se ocultara y mostrara el contenido correspondiente.

## Librerias
* [http](https://pub.dev/packages/http)
* [dartz](https://pub.dev/packages/dartz)

## Equipo
 Su servidor Antony Raul Cristobal Zambrano desde Perú 🇵🇪

## Conclusiones
Al desarrollar el presente paquete, se logro consolidar conocimientos sobre el tema, y la importación de este en otros proyectos flutter.
Espero que este proyecto cumpla con sus expectativas y sirva como referencia para otros colegas que se adentran en el mundo de Flutter 🩵.
