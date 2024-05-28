import 'package:componentes/ejercicios/ejercicio_1/ejercicio_1_screen.dart';
import 'package:componentes/ejercicios/ejercicio_2/ejercicio_2_screen.dart';
import 'package:componentes/screens/alerts_screen.dart';
import 'package:componentes/screens/auxiliar_route_screen.dart';
import 'package:componentes/screens/cards_screen.dart';
import 'package:componentes/screens/home_screen.dart';
import 'package:componentes/screens/list_view_screen.dart';
import 'package:componentes/screens/routing_screen.dart';
import 'package:componentes/screens/single_child_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  // Define todas las rutas de pantallas en tú aplicación
  //  Nombre de la ruta : callback que retorna la pantalla
  //  HomeScreen.routeName: (context) => const HomeScreen(),
  //'/mi-route' : (context) => MyWidget(),
  // '/'
  HomeScreen.routeName: (context) => const HomeScreen(),
  // Otras pantallas
  // ...
  RoutingScreen.routeName: (context) => const RoutingScreen(),
  AuxiliarRouteScreen.routeName: (contex) => const AuxiliarRouteScreen(),
  ListViewScreen.routeName: (context) => ListViewScreen(),
  SingleChildScreen.routeName: (context) => const SingleChildScreen(),
  AlertsScrenn.routeName: (context) => const AlertsScrenn(),
  CardsScreen.routeName: (context) => const CardsScreen(),

  /// Ejercicios pantallas
  Ejercicio1Screen.routeName: (context) => const Ejercicio1Screen(),
  Ejercicio2Screen.routeName: (context) => Ejercicio2Screen(),
};
