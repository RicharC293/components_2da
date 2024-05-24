import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  ListViewScreen({super.key});

  static const String routeName = '/list-view';

  final list = List.generate(100, (index) => '$index lista');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List View")),
      body: ListView.builder(
        // scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          print("INDEX: $index");
          return Container(
            height: 100,
            color: Colors.red,
            child: Text("Hola: $index"),
          );
        },
        itemCount: 5000,
      ),
      // body: ListView.separated(
      //   // scrollDirection: Axis.horizontal,
      //   itemBuilder: (context, index) {
      //     return Column(
      //       children: [
      //         Container(
      //           height: 100,
      //           color: Colors.red,
      //           child: Text("Hola: ${list[index]}"),
      //         ),
      //         Container(
      //           height: 100,
      //           color: Colors.blue,
      //           child: Text("Hola: ${list[index]}"),
      //         )
      //       ],
      //     );
      //   },
      //   separatorBuilder: (_, __) => const SizedBox(height: 20),
      //   itemCount: list.length,
      // ),
      // body: ListView.builder(
      //   // scrollDirection: Axis.horizontal,
      //   itemBuilder: (context, index) {
      //     return Container(
      //       height: 100,
      //       color: Colors.red,
      //       child: Text("Hola: ${list[index]}"),
      //     );
      //   },
      //   itemCount: list.length,
      // ),
      // body: ListView(
      //   // physics: const NeverScrollableScrollPhysics(), //  no tenga scroll
      //   // physics: BouncingScrollPhysics(), // usar el scroll iOS
      //   // physics: AlwaysScrollableScrollPhysics(), // esto seria por defecto
      //   // padding: EdgeInsets.all(10),
      //   // scrollDirection: Axis.horizontal,
      //   children: [
      //     Container(
      //       height: 200,
      //       width: 50,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 50,
      //       color: Colors.yellow,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 50,
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 100,
      //       color: Colors.brown,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 100,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 100,
      //       color: Colors.yellow,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 100,
      //       color: Colors.blue,
      //     ),
      //     Container(
      //       height: 200,
      //       width: 50,
      //       color: Colors.brown,
      //     ),
      //   ],
      // ),
    );
  }
}
