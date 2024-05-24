# Uso de ListView

En el ejemplo tienes definida una lista de datos, que corresponden a una combinación de datos tipo List<Map<String, dynamic>>, utiliza estos datos para construir una lista que muestre la siguiente información:
1. Nombre
2. Estatura
3. Genero

### Código guía
Usa este código como guía no lo copies textualmente, experimenta diversas opciones por ejemplo:
* Usa contenedores Container
* Usa Row y Column
* Usa otros widgets descritos en el catálogo de widgets
* https://docs.flutter.dev/ui/widgets
``` dart
ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]["name"] ?? '',
                style: const TextStyle(fontSize: 20)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    '${data[index]["height"] ?? ''} - ${data[index]["mass"] ?? ''}'),
                Text(data[index]["gender"] ?? ''),
              ],
            ),
          );
        },
      ),
```
