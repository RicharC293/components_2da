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
  final imagesObj = Services();

  /// Simpre me la creo como nula
  /// Creo como null
  /// if(images == null) -> loading
  List<String>? images;

  /// Variable 1 que va a ser la imagen inicial
  final int initialImage = 0;

  /// Variable 2 que va a ser el amount
  final amount = 10;

  /// Controladores
  /// ScrollController -> controllar el scroll de la página
  /// Forma 1
  // final scrollController = ScrollController();
  /// Forma 2
  late ScrollController scrollController;

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

  /// dispose -> se va a detonar al destruir la pantalla - cerrarla
  @override
  void dispose() {
    print("Dispose");
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinity scroll"),
        actions: [
          TextButton(
              onPressed: () {
                /// animateTo nos permite mover el scroll
                // scrollController.animateTo(offset, duration: duration, curve: curve)

                // se salta a un offset en específico
                // scrollController.position.maxScrollExtent -> saltar hasta el fondo de la página
                scrollController
                    .jumpTo(scrollController.position.maxScrollExtent);
              },
              child: const Text("Ir al fondo")),
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

          return ListView.builder(
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
