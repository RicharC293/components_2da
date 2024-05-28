import 'package:flutter/material.dart';

class AlertsScrenn extends StatelessWidget {
  const AlertsScrenn({super.key});

  static const String routeName = '/alerts';

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
                        FilledButton(onPressed: () {}, child: Text("Aceptar")),
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
          onPressed: () {},
          // contenido del botón  -> Text
          child: const Text("Show cupertino alert"),
        ),
      ),
    );
  }
}
