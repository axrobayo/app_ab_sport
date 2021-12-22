// To parse this JSON data, do
//
//     final cancha = canchaFromJson(jsonString);

import 'dart:convert';

Cancha canchaFromJson(String str) => Cancha.fromJson(json.decode(str));

String canchaToJson(Cancha data) => json.encode(data.toJson());

class Cancha {
    Cancha({
        this.tipo,
        this.nombre,
        this.implementos,
    });

    String? tipo;
    String? nombre;
    String? implementos;

    factory Cancha.fromJson(Map<String, dynamic> json) => Cancha(
        tipo: json["Tipo"],
        nombre: json["Nombre"],
        implementos: json["Implementos"],
    );

    Map<String, dynamic> toJson() => {
        "Tipo": tipo,
        "Nombre": nombre,
        "Implementos": implementos,
    };
}