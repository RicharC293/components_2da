import 'package:flutter/material.dart';

class FormsScreen extends StatefulWidget {
  const FormsScreen({super.key});

  static const String routeName = '/forms';

  @override
  State<FormsScreen> createState() => _FormsScreenState();
}

class _FormsScreenState extends State<FormsScreen> {
  final _formKey = GlobalKey<FormState>();

  final textController = TextEditingController();

  /// Crear variables
  String? nombre = "";

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formularios")),

      /// Conocer como ingresar un dato en un input
      ///  Form -> Nos permite generar el formulario
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            /// TextField -> nos permite ingresar texto
            // TextField(
            //   decoration: const InputDecoration(
            //     labelText: "Mi primer text field",
            //     hintText: "Escribe algo...",

            //     /// Borde del input
            //     border: OutlineInputBorder(),

            //     /// Con esta propiedad le podemos dar un comportamiento al label y al hint text
            //     floatingLabelBehavior: FloatingLabelBehavior.auto,
            //   ),

            //   /// Como va cambiando nuestro input
            //   onChanged: (value) {
            //     print(value);
            //   },
            //   // Nos ayuda a cambiar el estilo del teclado
            //   // TextInputType
            //   keyboardType: TextInputType.text,

            //   /// Podemos usarlo para multiples lineas
            //   // maxLines: 3,

            //   /// Contraseñas
            //   // obscureText: true,

            //   /// Capitalización al texto primera letra con mayúscula
            //   /// TextCapitalization.words -> Nombres Apellidos
            //   /// TextCapitalization
            //   textCapitalization: TextCapitalization.words,
            // ),

            /// TextFormFiel -> Formularios

            TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: "Nombre y Apellido",
                hintText: "Richar Cangui",
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,

              /// Para detonarlo usar _formKey.currentState!.save();
              onSaved: (value) {
                /// se va a actualizar
                nombre = value;
              },

              /// Cumple o no cumple alguna condición lo que tenemos dentro del TextFormFiel
              validator: (value) {
                /// Validator -> no sea vacío
                if (value == null) {
                  return "Es requerido";
                }

                /// Que no sea un string vacío
                if (value.isEmpty) {
                  return "Es requerido";
                }

                /// Todas las condiciones que queramos
                /// Validar si son emails -> Regex
                /// Validar que sean letras -> Regex
                return null;
              },
            ),
            TextFormField(
              validator: (value) {
                /// Validator -> no sea vacío
                if (value == null) {
                  return "Es requerido";
                }

                /// Que no sea un string vacío
                if (value.isEmpty) {
                  return "Es requerido";
                }

                /// Todas las condiciones que queramos
                /// Validar si son emails -> Regex
                /// Validar que sean letras -> Regex
                return null;
              },
            ),
            TextFormField(
              validator: (value) {
                /// Validator -> no sea vacío
                if (value == null) {
                  return "Es requerido";
                }

                /// Que no sea un string vacío
                if (value.isEmpty) {
                  return "Es requerido";
                }

                /// Todas las condiciones que queramos
                /// Validar si son emails -> Regex
                /// Validar que sean letras -> Regex
                return null;
              },
            ),
            FilledButton(
              onPressed: () {
                /// Validar los TextFormField
                final isValidated = _formKey.currentState!.validate();
                // print(isValidated);

                // /// Obtener el valor del texto
                // print("el valor es");
                // print(textController.text);

                // /// mutar el valor del input
                // textController.text = "Hola a todos";

                if (!isValidated) return;
                print("Mi nombre es: $nombre");
                /// Trigger on saved
                _formKey.currentState!.save();
                print("Mi nombre ahora es: $nombre");

                ///Ejecuta la acción al servidor
              },
              child: const Text("Registrarse"),
            ),
          ],
        ),
      ),
    );
  }
}
