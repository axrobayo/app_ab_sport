class Categoria {
  int id;
  String nombre;
  String foto;

  Categoria(this.id, this.nombre, this.foto);
}

final menu = [
  Categoria(1, "Fútbol", "futbol.jpeg"),
  Categoria(2, "Basquet", "basket.jpg"),
  Categoria(3, "Ecuavoley", "voley.jpg"),
];
