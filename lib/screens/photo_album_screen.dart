import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// Nombre de la screen snack_case
/// Mismo nombre de la clase PascalCase
class PhotoAlbumScreen extends StatelessWidget {
  const PhotoAlbumScreen({super.key});

  static const String routeName = '/photo-album';

  final photoUrl =
      "https://scontent.fuio1-2.fna.fbcdn.net/v/t1.6435-1/61049095_2286442614756155_2690540833324662784_n.jpg?stp=dst-jpg_s480x480&_nc_cat=101&ccb=1-7&_nc_sid=5f2048&_nc_ohc=g8YPGicZrpwQ7kNvgG_zZIS&_nc_ht=scontent.fuio1-2.fna&oh=00_AYBvfkaKg2eV1dFPeFWahUet9I1bjF7s0zB-lkqyz4HE3g&oe=667DE513";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Title de el app bar, generalmente va a ser un widget de tipo Text como hijo
        title: Text("Album de fotos"),

        /// recibe un bool si es true el title se centra si es false se pone en la izquierda
        centerTitle: false,

        /// Recibe Lista widgets -> Siempre van a estar a la derecha del AppBar
        actions: const [
          /// Widget que nos va a permitir crear Avatares
          ///
          /// Container -> tiene varias propiedades mutables -> widget no sea constante
          /// Padding -> es optimo porque solo maneja las separaciones
          /// SizedBox -> es optimo porque solo ocupa un espacio
          ///
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: CircleAvatar(
              /// Utilizar el child para asignarle un contenido al circle avatar, puede ser texto u otros widgets
              /// Iniciales max 2 letras
              /// style nos permite definir el estilo del texto TextStyle
              child: Text(
                "RC",
                style: TextStyle(
                  /// color -> color del texto
                  color: Colors.purple,

                  /// fontSize -> el tamaño de la fuente
                  fontSize: 15,

                  ///fontWeight -> peso de la fuente
                  /// FontWeight.bold -> negrillas
                  /// FontWeight.normal -> normal
                  /// FontWeight.w100 - w900 -> un rango en representación del peso
                  fontWeight: FontWeight.w600,
                ),
              ),

              /// recibe un double y esto define el tamaño del radio del círculo
              // radius: 60,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              /// Voy a crear un avatar que renderiza una imagen remota
              CircleAvatar(
                /// Forma #1
                /// Recibe un image provider
                /// NetworkImage -> un proveedor de imagen que nos permite utilizar una url remota
                /// scale -> permite definir la escala de la imagen pero en relación al peso para optimizar el llamado a la url
                backgroundImage: NetworkImage(photoUrl),

                /// radius -> es lo que define el tamaño del círculo
                radius: 50,

                /// Forma #2
                /// Utilizando el child del circle avatar
                /// Crear widgets de imagenes -> Image.network
                /// Forzar el borde circular de un widget se utiliza el Widget
                /// ClipRRect
                child: ClipRRect(
                  // Radio para que el widget se recorte
                  // Se llama como BorderRadiusGeometry -> BorderRadius
                  // BorderRadius.circular(50) -> se recorta en función de un radio
                  borderRadius: BorderRadius.circular(50),

                  /// Hijo o el widget que se quiere recortar
                  child: Image.network(photoUrl),
                ),
              ),

              /// Un espacio que separa la imagen del otro widget
              const SizedBox(width: 16),

              /// Los nombres y un title
              /// Vamos a usar el expanded para que nuestro widget se adapte a dispositivos pequeños
              const Expanded(
                child: Column(
                  /// Para controlar la alineación en el eje horizontal
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Richar Cangui",
                      style: TextStyle(
                        /// Peso de la letra
                        fontWeight: FontWeight.bold,

                        /// Tamaño de la letra
                        fontSize: 20,
                      ),
                    ),
                    Text("Mis recuerdos"),
                  ],
                ),
              ),
            ],
          ),

          /// Grillas -> GridView
          SizedBox(
            height: 500,

            /// Clasico
            // child: GridView(
            //   /// Caracteristicas de la grilla
            //   /// SliverGridDelegateWithFixedCrossAxisCount -> crear una grilla en base a un numero de elementos en el eje horizontal
            //   /// Row -> [] [] [] [] [] [] []
            //   ///  SliverGridDelegateWithFixedCrossAxisCount -> 3
            //   /// [] [] []
            //   /// [] [] []
            //   /// SliverGridDelegateWithFixedCrossAxisCount -> 2
            //   /// [] []
            //   /// [] []
            //   /// [] []
            //   ///
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 6),

            //   /// Todos los elementos que van a estar en la grilla
            //   children: const [
            //     Text("1"),
            //     Text("2"),
            //     Text("3"),
            //     Text("4"),
            //     Text("5"),
            //     Text("6"),
            //   ],
            //   ),
            // GridView.builder -> complicado de usar
            // GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder)

            /// GridView.count -> Sencillo de usar debido a que no necesita un delegata, solo necesia el número de items
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Text("1"),
                Text("2"),
                Text("3"),
                Text("4"),
                Text("5"),
                Text("6"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
