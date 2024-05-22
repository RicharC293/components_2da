import 'package:componentes/screens/auxiliar_route_screen.dart';
import 'package:componentes/screens/home_screen.dart';
import 'package:flutter/material.dart';

class RoutingScreen extends StatelessWidget {
  const RoutingScreen({super.key});

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
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  AuxiliarRouteScreen.routeName,
                  arguments: 'Hola Mundo',
                );
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add),
                  Text("Push named"),
                ],
              ),
            ),

            /// push replacement named
            FilledButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AuxiliarRouteScreen.routeName);
              },
              icon: const Icon(Icons.ac_unit_rounded),
              label: const Text("Push replacement named"),
            ),

            /// push named and remove until
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  AuxiliarRouteScreen.routeName,

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
                Navigator.pop(context);
              },
              child: const Text('Pop'),
            ),

            /// Filled button
            FilledButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuxiliarRouteScreen(),
                    settings: const RouteSettings(
                      arguments: 'hey ty'
                    ),
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
