import 'package:flutter/material.dart';

class SingleChildScreen extends StatelessWidget {
  const SingleChildScreen({super.key});

  static const String routeName = '/single-child';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Single Child')),

      /// El widget SingleChildScrollView te permite entregar las propiedades
      /// de scroll a una columna
      /// MUCHO OJO CON LOS PROBLEMAS DE RENDIMIENTO
      /// Ver la clase del Jueves 23 mayo
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            /// Prueba cambiando los valores para que puedas experimentar con los problemas de rendimiento
            50,
            (index) {
              return Container(
                height: 100,
                width: double.infinity,
                color: Colors.red,
                child: Text("Fila: $index"),
              );
            },
          ),
        ),
      ),
    );
  }
}
