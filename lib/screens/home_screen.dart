import 'package:componentes/ejercicios/ejercicio_1/ejercicio_1_screen.dart';
import 'package:componentes/screens/alerts_screen.dart';
import 'package:componentes/screens/cards_screen.dart';
import 'package:componentes/screens/list_view_screen.dart';
import 'package:componentes/screens/single_child_screen.dart';
import 'package:flutter/material.dart';

import '../ejercicios/ejercicio_2/ejercicio_2_screen.dart';
import 'routing_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //Declarando nombres de rutas
  // static const TipoDeDato(String) routeName = '/nombre-ruta';
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Componentes"),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.alt_route),
            title: const Text(
              "Enrutamiento",
              // style: TextStyle(
              //   color: Colors.red,
              //   fontSize: 19,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator
              Navigator.pushNamed(context, RoutingScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text("List View"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, ListViewScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text("Single Child Scroll View"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, SingleChildScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_alert_sharp),
            title: const Text("Alertas"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, AlertsScrenn.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text("Tarjetas"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, CardsScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.photo),
            title: const Text("Álbum de fotos"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.pushNamed(context, ListViewScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.play_arrow),
            title: const Text("Sliders"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.pushNamed(context, ListViewScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.swap_vert_circle_outlined),
            title: const Text("Infinity scroll"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.pushNamed(context, ListViewScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.format_strikethrough),
            title: const Text("Formularios"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigator.pushNamed(context, ListViewScreen.routeName);
            },
          ),
          const Divider(),
          const Text("Ejercicios"),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text("Ejercicio 1"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, Ejercicio1Screen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.remove_red_eye),
            title: const Text("Ejercicio 2"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, Ejercicio2Screen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
