import 'package:flutter/material.dart';

class SingleChildScreen extends StatelessWidget {
  const SingleChildScreen({super.key});

  static const String routeName = '/single-child';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Single Child')),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
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
