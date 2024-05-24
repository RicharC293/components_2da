import 'package:componentes/screens/auxiliar_route_screen.dart';
import 'package:flutter/material.dart';

/// Es muy importante  que cuando se cree una pantalla
/// tanto el nombre del archivo como el nombre de la clase
/// tenga la palabra "screen" ej:
/// archivo -> routing_screen.dart -> usar snack_case (letras separadas por _)
/// clase -> RoutingScreen -> usar PascalCase (Primeras letras mayúsculas)
class RoutingScreen extends StatelessWidget {
  const RoutingScreen({super.key});

  /// Importante crear la ruta, esta es necesaria para una
  /// mayor escalabilidad, ejemplo:
  /// Es más fácil reconocer el nombre de una pantalla si usas esto:
  /// RoutingScreen.routeName -> te ayuda el editor a acceder al valor
  /// Que usar esto:
  /// '/routing' -> posibles problemas de tipado
  ///
  /// Nunca te olvides de agregar esta ruta a tu archivo routes.dart
  static const String routeName = '/routing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rutas"),
        // Asi se puede cambiar el icon
        // leading: Icon(Icons.arrow_back),
      ),
      body: Center(
        child: Column(
          children: [
            // Push named
            // ElevatedButton es un botón definido por material
            // https://m3.material.io/components/all-buttons
            // Todos los botones que se utilizan en Flutter, que siguen las normas de material
            // usan una estructura similar a la detallada a continuación:
            ElevatedButton(
              /// Acción que se va a realizar al presionar el botón
              onPressed: () {
                /// Estrategia de navegación que se va a realizar, en este caso por nombre
                Navigator.pushNamed(
                  context,
                  AuxiliarRouteScreen.routeName,
                  arguments: 'Hola Mundo',
                );
              },

              /// Widget que se va a mostrar en la parte interna del botón,
              /// es decir el contenido del mismo.
              /// Row -> widget de tipo filas que te ayuda a agrupar un
              /// elemento junto a otro
              child: const Row(
                /// Propiedad que te permite definir el tamaño del eje principal
                ///  MainAxisSize.min -> ocupa el minimo, se acopla al contenido
                ///  MainAxisSize.max -> ocupa el máximo, se expande al tamaño disponible
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Icon -> widget que te ayuda a renderizar un icon
                  /// Icons -> clase que continene un catálogo de iconos material
                  Icon(Icons.add),

                  /// Text -> widget que te ayuda a renderizar un texto
                  /// style -> propiedad para agregarle estilos a los textos
                  Text("Push named"),
                ],
              ),
            ),

            /// push replacement named
            /// Botón que sigue las normas material, pero te permite renderizar
            /// un icon y un Text
            FilledButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AuxiliarRouteScreen.routeName);
              },

              /// Icono del botón
              icon: const Icon(Icons.ac_unit_rounded),

              /// Texto que va a estar a la derecha del icon
              label: const Text("Push replacement named"),
            ),

            /// push named and remove until
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AuxiliarRouteScreen.routeName,

                  /// Callback que te permite manejar la estrategia de las rutas
                  /// false -> ultima pantalla es la primera y unica
                  /// isFirst -> para que la primera pantalla se conserve
                  /// settings -> se puede usar para hacer condiciones
                  /// (route) => route.settings.name == RoutingScreen.routeName,
                  (route) => false,
                );
              },
              child: const Text("Push named and remove until"),
            ),

            /// pop
            TextButton(
              onPressed: () {
                /// Navegación hacia atrás del botón
                Navigator.pop(context);
              },
              child: const Text('Pop'),
            ),

            /// Filled button
            FilledButton(
              onPressed: () {
                /// Navegación que te permite avanzar a pantallas sin la necesidad de
                /// declararlo con nombres, es más verboso, pero se usa para:
                /// animaciones entre pantallas
                /// Manejar el builder
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuxiliarRouteScreen(),
                    settings: const RouteSettings(arguments: 'hey ty'),
                  ),
                );
              },
              child: const Text("Push"),
            ),
          ],
        ),
      ),
    );
  }
}
