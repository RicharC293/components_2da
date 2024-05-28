import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AlertsScrenn extends StatelessWidget {
  const AlertsScrenn({super.key});

  static const String routeName = '/alerts';

  Widget adaptiveAction(
      {required BuildContext context,
      required VoidCallback onPressed,
      required Widget child}) {
    final ThemeData theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alertas"),

        /// actions -> son las acciones que tendrá el app bar
        /// Se encuentran ubicadas en la parte derecha del AppBar
        actions: [
          /// Un button que recibe un icon, se basa en las guias de material
          IconButton(
            onPressed: () {
              /// Método que permite renderizar una alerta de tipo material
              showDialog(
                  context: context,

                  /// Propiedades ----
                  /// Cerrar la alerta al hacer click fuera de la alerta
                  /// true -> se cierra
                  /// false -> no se cierra se necesita un pop en un btn
                  barrierDismissible: false,

                  /// Color de afuera
                  // barrierColor: Colors.amber,
                  /// El builder es el metodo que se encarga de renderizar el contenido de la alerta
                  builder: (context) {
                    /// Widget por defecto en Flutter para trabajar con alertas
                    return AlertDialog(
                      // Title
                      title: const Text('Mi primera alerta'),
                      // Contenido interno de la alerta
                      content: const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "Esta es mi primera alerta, Esta es mi primera alerta, Esta es mi primera alerta, Esta es mi primera alerta"),
                          FlutterLogo(),
                        ],
                      ),

                      /// Boton de accion en la parte inferior
                      actions: [
                        FilledButton(
                            onPressed: () {}, child: const Text("Aceptar")),
                        OutlinedButton(
                          onPressed: () {
                            /// Forzar cerrar la alerta
                            Navigator.pop(context);
                          },
                          child: const Text("Cancelar"),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.add, color: Colors.pink),
          ),
        ],
      ),
      body: Center(
        /// Un boton de tipo texto
        child: TextButton(
          // Acción que va a ejecutar al presionar el btn
          onPressed: () {
            /// Método que crea una alerta pero basada en las normas de cupertino - iOS
            showCupertinoDialog(
              /// Como se identifica el widget dentro del árbol
              context: context,

              /// Queremos que nuestra alerta se cierre al clickear fuera del contenido
              barrierDismissible: true,

              /// Construir el contenido de la alerta
              builder: (context) {
                /// Puede retornar cualquier tipo de widget
                /// Solo para cupertino pero puede usarse en otras alertas
                return CupertinoAlertDialog(
                  /// Titulo de nuestra alerta
                  title: const Text("Mi cupertino alert"),

                  /// Es el contenido de la alerta, recibe cualquier tipo de widget
                  /// Puede ser un column, row, image, container.
                  content: const Text(
                      "Esta es mi alerta en cupertino o de modelo iOS"),

                  /// Acciones o botones que el usuario va a interactuar con la alerta
                  actions: [
                    // Este es un btn material
                    // TextButton(onPressed: () {}, child: Text("Cancelar")),

                    /// Botón de acción que cumple la linea de diseño de cupertino
                    CupertinoDialogAction(
                      child: const Text("Cancelar"),

                      /// Coloca el btn en rojo
                      isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),

                    CupertinoDialogAction(
                      child: const Text("Si, Acepto"),

                      /// Destaca el texto del botón
                      isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          // contenido del botón  -> Text
          child: const Text("Show cupertino alert"),
        ),
      ),

      /// Btn flotante que va a estar en la parte inferior derecha
      /// FloatingActionButton -> Un btn
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// Nos permite conocer la plataforma
          print(Platform.isAndroid);

          /// web -  chrome - no puede trabajar io con web
          print(kIsWeb);

          // if(Platform.isAndroid) {
          //   // showDialog(context: context, builder: builder)
          // } else {
          //   // showCupertinoDialog(context: context, builder: builder)
          // }

          /// 1. Si eres android -> showDialog
          /// 2. Si eres iOS -> showCupertinoDialog
          /// 3. Otro sistema operativo -> showDialog
          showAdaptiveDialog(
              context: context,
              barrierDismissible: true,

              /// Builder renderiza la alerta
              builder: (context) {
                return AlertDialog.adaptive(
                  title: const Text("Adaptativo"),
                  content: const Text("Este es un contenido adaptativo"),
                  actions: [
                    /// Btn adaptativo desde el método contruido
                    adaptiveAction(
                        context: context,
                        onPressed: () {},
                        child: const Text("Cancelar")),
                  ],
                );
              });
        },
        child: const Icon(Icons.route),
      ),
    );
  }
}

/// Centralizar en una clase
// Alertas().crearAlerta()
// class Alertas {
//   /// Patron singleton 
//   Future<void> crearAlerta(BuildContext context) async {
//     await showDialog(context: context, builder: builder);
//   }
// }