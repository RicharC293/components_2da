import 'package:flutter/material.dart';

class AuxiliarRouteScreen extends StatelessWidget {
  const AuxiliarRouteScreen({super.key});

  static const String routeName = '/auxiliar';

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(title: const Text('Pantalla Auxiliar')),
      body: Center(
        child: ElevatedButton(
          child: Text("OK's $arguments"),
          onPressed: () {
            final canPop =
                Navigator.canPop(context); // para saber si hay una ruta atrás
            print(canPop);
            // Navigator.pop(context); // para irse a una ruta atrás
            Navigator.maybePop(context); // controlar si existe una ruta
          },
        ),
      ),
    );
  }
}
