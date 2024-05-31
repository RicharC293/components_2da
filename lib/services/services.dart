/// Simular un servicio que trae un conjunto de imagenes bajo demanda
class Services {
  /// 1. Definir que lo que a traer o retornar es una List<String>
  /// 2. Generar un bucle generar imagenes
  /// 3. Usar Futures para simular el servicio
  /// initialImage -> un entero que indica la imagen inicial
  /// amount -> entero que nos indica el total que vamos a requerir
  Future<List<String>> getImages(int initialImage, int amount) async {
    List<String> images = [];

    /// https://picsum.photos/id/0/200/300
    /// https://picsum.photos/id/1/200/300
    /// https://picsum.photos/id/2/200/300
    /// https://picsum.photos/id/3/200/300
    /// https://picsum.photos/id/4/200/300
    /// https://picsum.photos/id/$index/200/300
    ///
    /// Dinamico
    /// i = 0 -> reemplaza -> i = initialImage
    /// i<10 -> reemplaza -> i < amount
    ///
    ///  0    -     10 = 10
    ///
    ///   5    -   10  = 5
    ///
    ///  5 - (10 + 5)
    ///
    ///  5 - 15 = 10
    ///
    for (int i = initialImage; i < initialImage + amount; i++) {
      final url = "https://picsum.photos/id/$i/1200";
      images.add(url);
    }

    return images;
  }
}
