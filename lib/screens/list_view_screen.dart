import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  ListViewScreen({super.key});

  static const String routeName = '/list-view';

  final list = List.generate(100, (index) => '$index lista');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List View")),

      /// El ListView más clásico
      /// Te permite crear una lista scrolleable de elementos
      /// Te permite manejar el tipo de scroll con el physics
      /// Te permite agregar un padding
      /// Te permite generar una lista vertical u horizontal
      /// Los usos comunes que le puedes dar a esto es cuando necesitas crear menus o una
      /// lista de elementos que conoces su tamaño
      /// PARA VER ESTE CÓDIGO RECUERDA DESCOMENTARLO
      // body: ListView(
      //   // physics: const NeverScrollableScrollPhysics(), //  no tenga scroll
      //   // physics: BouncingScrollPhysics(), // usar el scroll iOS
      //   // physics: AlwaysScrollableScrollPhysics(), // esto seria por defecto
      //   // padding: EdgeInsets.all(10),
      //   // scrollDirection: Axis.horizontal,
      //   children: [
      //     Container(
      //       height: 200,
      //       width: 50,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 50,
      //       color: Colors.yellow,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 50,
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 100,
      //       color: Colors.brown,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 100,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 100,
      //       color: Colors.yellow,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 100,
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 50,
      //       color: Colors.brown,
      //     ),
      //   ],
      // ),

      /// ListView.builder
      ///
      /// Este tipo de listview comparte todas las propiedades del ListView clásico, pero su uso
      /// se enfoca en consultas de una lista de datos, puede ser de un backend o de una base de datos local
      /// Cualquier tipo de datos en forma de lista pueden ser renderizados en este widget.
      body: ListView.builder(
        // scrollDirection -> define la dirección del scroll en la lista
        // Axis.horizontal -> scroll horizontal o lista horizontal
        // Axis.vertical -> scroll vertical o lista vertical
        scrollDirection: Axis.horizontal,

        /// itemBuilder -> aquí es donde nuestro widget se renderiza
        /// a diferencia del listview tradicional, que te recibe una lista de widgets
        /// para el builder se necesita especificar un widget en común, por ejemplo:
        ///
        /// ```dart
        /// Container(
        /// height: 100,
        /// color: Colors.red,
        /// child: Text("Hola: $index"),
        /// )
        /// ```
        /// Todos nuestros widgets en la lista tendrán la misma estructura,
        /// pero su contenido cambia.
        ///
        /// La sintaxis del builder siempre es parecida, en todos los tipos de listview,
        /// siempre recibe el:
        /// context (contexto de la aplicación),
        /// index(posición del elemento en la lista)
        ///
        itemBuilder: (context, index) {
          print("INDEX: $index");
          return Container(
            height: 100,
            color: Colors.red,
            child: Text("Hola: $index"),
          );
        },

        /// Es importante siempre especificar el item count de tu lista,
        /// el objetivo del count es limitar la cantidad de elementos en la lista
        /// siempre asociar esto a la lista de datos que se esté utilizando para
        /// renderizar esta lista
        ///
        /// En este ejemplo se ha puesto 5000 para indicar el problema de performance que se puede dar
        /// Para enender mejor esto revisa la clase del día Jueves 23 de mayo
        itemCount: 5000,
      ),

      /// Una lista similar al builder, pero que tiene un constructor (builder)
      /// para renderizar una separación
      /// separatorBuilder: (_, __) => const SizedBox(height: 20),
      ///
      /// Nota que los elementos del buider se encuentran definidos con un guión bajo _
      /// Esto indica que el valor de los mismos no va a ser utilizado
      ///
      // body: ListView.separated(
      //   // scrollDirection: Axis.horizontal,
      //   itemBuilder: (context, index) {
      //     return Column(
      //       children: [
      //         Container(
      //           height: 100,
      //           color: Colors.red,
      //           child: Text("Hola: ${list[index]}"),
      //         ),
      //         Container(
      //           height: 100,
      //           color: Colors.blue,
      //           child: Text("Hola: ${list[index]}"),
      //         )
      //       ],
      //     );
      //   },
      //   separatorBuilder: (_, __) => const SizedBox(height: 20),
      //   itemCount: list.length,
      // ),
      // body: ListView.builder(
      //   // scrollDirection: Axis.horizontal,
      //   itemBuilder: (context, index) {
      //     return Container(
      //       height: 100,
      //       color: Colors.red,
      //       child: Text("Hola: ${list[index]}"),
      //     );
      //   },
      //   itemCount: list.length,
      // ),
    );
  }
}
