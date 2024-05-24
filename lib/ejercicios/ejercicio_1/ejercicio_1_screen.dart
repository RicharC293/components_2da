import 'package:flutter/material.dart';

class Ejercicio1Screen extends StatelessWidget {
  const Ejercicio1Screen({super.key});

  static const String routeName = '/ejercicio-1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicio 1'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add_alert_sharp)),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.compare_arrows_rounded,
                color: Colors.brown,
              )),
        ],
      ),
      body: Center(
        child: Text("Ejercicio 1"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add_circle_outline_sharp),
      ),
    );
  }
}
