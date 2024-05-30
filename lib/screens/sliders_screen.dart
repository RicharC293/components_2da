import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SlidersScreen extends StatefulWidget {
  const SlidersScreen({super.key});

  static const String routeName = '/sliders';

  @override
  State<SlidersScreen> createState() => _SlidersScreenState();
}

class _SlidersScreenState extends State<SlidersScreen> {
  /// Crear una variable valor que va a iniciar en 0 y se puede mutar
  double valorSlider = 0;

  @override
  Widget build(BuildContext context) {
    // print("BUILD");
    return Scaffold(
      appBar: AppBar(title: const Text("Sliders")),
      body: Column(
        children: [
          /// Cargar la imagen 
          /// 1. ImageAsset() -> Es un proveedor
          /// 2. Image.asset() -> Es un widget
          
          /// 1. Tenemos la imagen
          // Image.asset("assets/image.png", height: 400),

          /// 2. A utilizar el Transform para rotar la imagen
          Transform.scale(
            scale: valorSlider,
            child: Transform.rotate(
              /// En angle de rotación expresado en radianes
              angle: valorSlider, 
              /// Widget que queremos rotar
              child: Image.asset("assets/image.png", height: 400),
              ),
          ),


          Text("El valor es: $valorSlider"),
          Slider(
            /// El valor min del slider -> defecto = 0
            min: 0,

            /// Es el valor maximo del slider -> defecto = 1
            max: 10,

            /// value es el valor del inicio del slider - en que posición va a iniciar
            ///
            /// cuando el value sea mayor al valor maximo nos va a dar un assert
            ///
            value: valorSlider,

            /// Método - callback que nos va a retornar el valor del slider
            /// al momento de realizar determinada acción - retorna el valor
            /// en donde se queda el slider
            onChanged: (value) {
              // print("El valor del slider es: $value");
              setState(() {
                valorSlider = value;
              });
            },
          )
          
          /// setState((){}) -> mucha precaución -> build -> reconstruyendo widgets innecesarios
          /// Cuando usar setState -> widget base -> o widgets con un mínimo cambio
          /// 
          /// Gestion de estados -> Comunicar los widgets
          ///  

          /// Crearse un slider y separar el scale en este nuevo slider
        
        ],
      ),
    );
  }
}
