Si estas buscando un paquete que consuma los servicios de [FakeStoreAPI](https://fakestoreapi.com/) estas en el lugar correcto! 🎉

# Tabla de contenidos
1. [Características](#Características)
2. [Instalación](#Instalación)
3. [Uso](#Uso)
4. [Información adicional](#Información_adicional)
5. [Librerías](#Librerías)
6. [Equipo](#Equipo)
7. [Conclusiones](#Conclusiones)

## Características

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
      ref: master
```

## Uso

Para acceder a los metodos del paquete, podemos hacer lo siguiente:  
Instanciamos la clase de nuestro paquete con la siguiente linea:  
```dart
final catalog = FakeApiSourcePackage();
```
A través de esta instancia, podremos tener acceso a los siguientes metodos:  
* `catalog.getAllCategories();`, retorna un tipo de dato `Future<Either<ResponseError, CategoriesModel>>`
* `catalog.getProductFromCategory(category);`, espera un parametro llamado `categoria` de tipo `String` y retorna un tipo de dato `Future<Either<ResponseError, List<ProductModel>>>`.
* `catalog.responseAllProducts();`, el cual retorna un tipo de dato `Future<Either<ResponseError, List<ProductModel>>>`  
  
A continuación explicaremos el contenido de cada modelo de datos que retorna esta respuesta:  
  
**Response Error:** Esta clase es una implementación de la clase exception para capturar cualquier excepción que se pueda presentar durante el consumo del servicio, contiene un atributo de tipo `String` llamado `message`, el cual por defecto se carga con la cadena de texto `Ops!, ha ocurrido un error`.  
```dart
class ResponseError implements Exception {
  final String message;
  ResponseError(this.message);
}
```
**Categories Model:** Esta clase se compone de un atributo llamado `categories` el cual es un `listado` de datos de tipo `String`
```dart
class CategoriesModel {
  List<String> categories;
  CategoriesModel({required this.categories});
}
```
**ProductModel:** Esta clase se compone de diferentes de atributos de tipo de datos nativos, los cuales hacen referencia a los atributos de un producto.
```dart
class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
}
```
**RatingModel:** esta clase es empleada por la clase mencionada previamente, el cual cuenta con dos atirbutos de tipos numericos double e int.
```dart
class RatingModel {
  double rate;
  int count;

  RatingModel({
    required this.rate,
    required this.count,
  });
}
```
**¿Algun ejemplo?**  
Para hacer uso de estos metodos, mostraremos un ejemplo el cual se encuentra en el archivo main_screen_provider.dart del paquete example:
```dart
class MainScreenProvider extends ChangeNotifier {
  List<String>? categories;
  final catalog = FakeApiSourcePackage();
  void _getCategories() async {
    final response = await catalog.getAllCategories();
    response.fold((error) {
      categories = null;
    }, (response) {
      categories = response.categories;
    });
    notifyListeners();
  }
}
```
Empleamos la sintaxis `async` y `await`, ya que el retorno del metodo `catalog.getAllCategories();` retorna `Future<Either<ResponseError, CategoriesModel>>`.  
Este retorno lo almacenamos en una variable `response` con la que podemos evaluar el tipo de dato `Either`. 
Etiher es un tipo de dato que almacena a la vez 2 tipos de datos, denominados left y right.  
Para este caso en el tipo de dato left encontramos al modelo Response error, y en right encontramos el modelo CategoriesModel.  
Posteriormente evaluamos el either mediante la sentencia `response.fold()` asignando en consecuancia un valor nulo a nuestro listado de categorias, o por lo contrario la respuesta del modelo en el que se encuentra mapeado las categorias.  
  
**Nota:*** Para ejecutar el proyecto de ejemplo, ejecutar las siguientes lineas en la terminal de su SO: 
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
