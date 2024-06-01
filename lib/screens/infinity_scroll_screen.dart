import 'package:componentes/screens/list_view_screen.dart';
import 'package:componentes/services/services.dart';
import 'package:flutter/material.dart';

class InfinityScrollScreen extends StatefulWidget {
  const InfinityScrollScreen({super.key});

  static const String routeName = '/infinity-scroll';

  @override
  State<InfinityScrollScreen> createState() => _InfinityScrollScreenState();
}

class _InfinityScrollScreenState extends State<InfinityScrollScreen> {
  /// Creando el objeto de la clase Services
  /// NUNCA LO HAGAN -> prod
  final imagesObj = Services();

  /// Simpre me la creo como nula
  /// Creo como null
  /// if(images == null) -> loading
  List<String>? images;

  /// Variable 1 que va a ser la imagen inicial
  /// Xq esta variable va a ser nuestra guía para consultar nuevas imagenes
  int initialImage = 0;

  /// Variable 2 que va a ser el amount
  final amount = 10;

  /// Controladores
  /// ScrollController -> controllar el scroll de la página
  /// Forma 1
  // final scrollController = ScrollController();
  /// Forma 2
  late ScrollController scrollController;

  /// Bandera que va a controlar el fetch de los servicios
  /// Ademas controlar que no se hagan multiples peticiones en el scroll
  bool isLoading = false;

  /// Hemos visto Statefull
  /// setState((){})
  /// buil se reconstruye
  /// init State -> define el inicio de tu widget - es algo que se va a ejecutar antes mostrarse
  /// el primer frame

  @override
  void initState() {
    super.initState();
    print("Init State");
    scrollController = ScrollController();
    getImages();
  }

  /// Esto que voy a construir es una llamada async
  Future<void> getImages() async {
    /// Hacer una petición al servicio para que me retorne la lista de imagenes en el init state
    images = await imagesObj.getImages(initialImage, amount);
    setState(() {});
  }

  /// Crear una nueva función paginado
  Future<void> paginado() async {
    ///1. obtener el valor de la página final
    ///2. realizar una consulta al servicio
    ///3. agrupar las listas
    ///4. actualizar la interfaz

    /// 1.
    /// 0 ------- 9
    /// 0+9 = 9
    final finalPage = initialImage + amount;
    print("FinalPage");
    print(finalPage);

    /// mutar nuestra variable initialImage
    /// 0 > 9
    /// 9 > 19
    /// 19 > 29
    initialImage = finalPage + 1;
    print("InitialPage");
    print(initialImage);

    /// 2.
    isLoading = true;
    final newImages = await imagesObj.getImages(initialImage, amount);
    isLoading = false;

    ///3.
    ///addAll es para agregar todos los elementos de una lista a otra lista
    /// A = [1,2,3]
    /// B = [4,5,6]
    /// A =  A.addAll(B) = [1,2,3,4,5,6]
    images?.addAll(newImages);

    ///4.
    setState(() {});
  }

  Future<void> refresh() async {
    initialImage = 20;
    images = await imagesObj.getImages(initialImage, amount);
    setState(() {});
  }

  /// dispose -> se va a detonar al destruir la pantalla - cerrarla
  @override
  void dispose() {
    print("Dispose");
    scrollController.dispose();
    super.dispose();
  }

  /// 1. NotificationListener -> Widget que escucha un cambio de un scroll
  ///   --- Necesita envolver a un widget que sea de tipo Scroll
  ///   --- ListView - .builder .separated
  ///   --- GridView - .buider .count
  ///   --- SingleChildScrollView
  ///
  /// 2. Usando los Listeners que puede llamarse desde un ScrollController

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinity scroll"),
        actions: [
          TextButton(
              onPressed: () {
                /// animateTo nos permite mover el scroll
                scrollController.animateTo(
                    scrollController.position.minScrollExtent,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.bounceIn);

                // se salta a un offset en específico
                // scrollController.position.maxScrollExtent -> saltar hasta el fondo de la página
                // scrollController
                //     .jumpTo(scrollController.position.maxScrollExtent);
              },
              child: const Text("Arriba")),
          TextButton(
              onPressed: () {
                /// animateTo nos permite mover el scroll
                scrollController.animateTo(
                  /// Posicionamiento
                  scrollController.position.maxScrollExtent,

                  /// Tiempo Animación -> 250 - 400 ms
                  duration: const Duration(milliseconds: 100),

                  /// Animación
                  curve: Curves.bounceIn,
                );

                // se salta a un offset en específico
                // scrollController.position.maxScrollExtent -> saltar hasta el fondo de la página
                // scrollController
                //     .jumpTo(scrollController.position.maxScrollExtent);
              },
              child: const Text("Abajo")),
        ],
      ),
      // Esto no es una buena práctica
      // body: images == null
      //     ? const CircularProgressIndicator()
      //     : images!.isEmpty
      //         ? Text("No hay datos")
      //         :
      body: Builder(
        builder: (context) {
          /// Loading ->
          if (images == null) {
            return const Center(child: CircularProgressIndicator());
          }

          /// Vacío
          if (images!.isEmpty) {
            return const Center(child: Text("Está vacío"));
          }

          ///    Clase <Tipo de dato>
          ///    Personas<String>
          /// Dentro de la clase existe un parámetro dinámico
          /// T variable
          /// String variable
          /// Personas<double>
          /// T variable
          /// double variable
          /// RefreshIndicator -> hace pull refresh sirve para actualizar
          return NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              // print(notification.metrics.pixels);
              // print(notification.metrics.atEdge);

              /// Hacer una condición que me indique
              /// 1. Que el scroll ya llegó al fondo o el final
              /// 2. Que me indique cuando esta por llegar al fondo - 300px antes

              /// 1.
              if (notification.metrics.atEdge &&
                  notification.metrics.pixels > 0 &&
                  !isLoading) {
                print("El scroll ha llegado al final");
                paginado();
              }

              /// Posición final del scroll
              /// notification.metrics.maxScrollExtent - 1000 , 2000, 3000
              /// Dependiendo de cuantos elementos tengamos en el scroll
              ///  Pixeles
              ///   1  -> minScrollExtent
              ///   2
              ///   3
              ///   4  ---- Límite
              ///   5
              ///   6   -> maxScrollExtent
              if (notification.metrics.pixels >
                  (notification.metrics.maxScrollExtent - 500)) {
                print("Está llegando al fondo");
              }

              return true;
            },
            child: RefreshIndicator(
              onRefresh: () async {
                await refresh();
              },
              child: ListView.builder(
                controller: scrollController,

                /// Retornar el widget a renderizar
                itemBuilder: (context, index) {
                  return Card(
                    child: Image.network(
                      images![index],
                      height: 300,

                      /// fit todas las imagenes
                      /// define la inscripción de una imagen
                      /// BoxFit
                      /// BoxFit.cover -> expande la imagen -> mucho cuidado con las dimensiones de las imagenes
                      /// xq se puede pixelear
                      fit: BoxFit.fitWidth,
                    ),
                  );
                },
                itemCount: images!.length,
              ),
            ),
          );
        },
      ),

      /// Future Builder
      // body: FutureBuilder(
      //   future: Services().getImages(0, 10),
      //   builder: (context, snapshot) {
      //     /// Mostrar un loading
      //     /// connectionState enum tiene varios valores que nos indica el
      //     /// estado de la conexión del future
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const CircularProgressIndicator(); //LOADING;
      //     }

      //     /// Capturar los error
      //     if (snapshot.hasError) {
      //       return const Text("Ha ocurrido un error");
      //     }

      //     /// Otras propiedades - servir

      //     /// Definir si tiene data y mostrar el widget con data

      //     /// Validar si la data existe, si la data no existe

      //     if (!snapshot.hasData) {
      //       return const Text("No hay información");
      //     }

      //     //// Si vas a colocar !, asegurate de haber validado la data y que exista
      //     final data = snapshot.data!;

      //     /// ListView - [ Widget1, Widget2, Widgetn ]
      //     ///
      //     /// ListView.builder -> [WidgetX, WidgetX]

      //     return ListView.builder(
      //       /// Retornar el widget a renderizar
      //       itemBuilder: (context, index) {
      //         return Card(
      //           child: Image.network(
      //             data[index],
      //             height: 300,

      //             /// fit todas las imagenes
      //             /// define la inscripción de una imagen
      //             /// BoxFit
      //             /// BoxFit.cover -> expande la imagen -> mucho cuidado con las dimensiones de las imagenes
      //             /// xq se puede pixelear
      //             fit: BoxFit.fitWidth,
      //           ),
      //         );
      //       },

      //       /// Logitud de la lista
      //       itemCount: data.length,
      //     );
      //   },
      // ),
    );
  }
}
