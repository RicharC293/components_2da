import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {
  const CardsScreen({super.key});

  static const String routeName = '/cards';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cards")),

      /// Card -> widget que renderiza una tarjeta
      body: Card(
        /// Contenido de la tarjeta
        child: Container(
          /// Padding siempre con el EdgeInsets
          /// 1. EdgeInsets.all -> padding a todos los lados
          /// 2. EdgeInsets.symmetric -> padding horizontal y vertical
          /// 3. EdgeInsets.only -> padding solo a un lugar en específico
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            /// Propiedad que define el tamaño de la columna
            /// MainAxisSize.max -> defecto -> columna ocupe todo el espacio disponible
            /// MainAxisSize.min -> ocupa el tamaño el contenido
            mainAxisSize: MainAxisSize.min,
            children: [
              // https://api.flutter.dev/flutter/material/Card-class.html
              // Generamos el icono | textos
              const Row(
                children: [
                  /// Construir el icono
                  Icon(Icons.access_alarm),

                  /// SizedBox -> es un widget que genera una caja vacía
                  /// Filas -> width
                  /// Columnas -> height
                  SizedBox(width: 16),

                  /// Construir los textos
                  /// Expanded -> es un widget que te permite hacer un wrap(saltar a la siguiente línea) los textos
                  /// cuando el ancho de la pantalla no es suficiente.
                  /// Condiciones -> Siempre debe estar dentro de un Column o un Row
                  Expanded(
                    child: Column(
                      /// Define el tipo de alineación en el eje opuesto (horizontal)
                      /// CrossAxisAlignment.center - default
                      /// CrossAxisAlignment.start
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Title
                        /// Actualizar los estilos
                        /// style: TextStyle( ... propiedades ... ) /// test las propiedades
                        Text('Titulo de la tarjeta'),

                        /// Body
                        Text(
                            'Cuerpo de la tarjeta Cuerpo de la tarjeta Cuerpo de la tarjeta'),
                      ],
                    ),
                  ),
                ],
              ),

              // Generar los botones
              // btn1 | btn2
              Row(
                /// mainAxisAlignment -> Define la alineación del eje principal - horizontal
                /// MainAxisAlignment.start -> default
                /// MainAxisAlignment.end -> envia al final
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  /// Btn 1
                  TextButton(onPressed: () {}, child: Text("Acción 1")),

                  /// Btn 2
                  TextButton(onPressed: () {}, child: Text("Acción 2")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
