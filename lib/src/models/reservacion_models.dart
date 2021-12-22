// To parse this JSON data, do
//
//     final reservacion = reservacionFromJson(jsonString);

import 'dart:convert';

Reservacion reservacionFromJson(String str) => Reservacion.fromJson(json.decode(str));

String reservacionToJson(Reservacion data) => json.encode(data.toJson());

class Reservacion {
    Reservacion({
        this.idReservacion,
        this.horario,
        this.precio,
        this.foto,
        this.estado,
    });

    String? idReservacion;
    String? horario;
    double? precio;
    String? foto;
    String? estado;

    factory Reservacion.fromJson(Map<String, dynamic> json) => Reservacion(
        idReservacion: json["idReservacion"],
        horario: json["horario"],
        precio: json["precio"].toDouble(),
        foto: json["foto"],
        estado: json["estado"],
    );

    Map<String, dynamic> toJson() => {
        "idReservacion": idReservacion,
        "horario": horario,
        "precio": precio,
        "foto": foto,
        "estado": estado,
    };
}
