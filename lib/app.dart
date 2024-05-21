import 'package:componentes/utils/routes.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      routes: routes,
      // Solo la ruta inicial
      initialRoute: HomeScreen.routeName,
      // home - initialRoute
      // home: Enrutamiento por funciones
      // initialRoute: Enrutamiento por nombres
    );
  }
}
