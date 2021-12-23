// To parse this JSON data, do
//
//     final cancha = canchaFromJson(jsonString);

import 'dart:convert';

Cancha canchaFromJson(String str) => Cancha.fromJson(json.decode(str));

String canchaToJson(Cancha data) => json.encode(data.toJson());

class Cancha {
    Cancha({
        this.id,
        this.tipo,
        this.nombre,
        this.foto,
        this.implementos,
    });

    String? id;
    String? tipo;
    String? nombre;
    String? foto;
    String? implementos;

    factory Cancha.fromJson(Map<String, dynamic> json) => Cancha(
        id: json["id"],
        tipo: json["tipo"],
        nombre: json["nombre"],
        foto: json["foto"],
        implementos: json["implementos"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "nombre": nombre,
        "foto": foto,
        "implementos": implementos,
    };
}
