// To parse this JSON data, do
//
//     final CanchaVoley = CanchaVoleyFromJson(jsonString);

import 'dart:convert';

import 'package:ab_sport/src/models/foto_models.dart';

CanchaVoley canchaVoleyFromJson(String str) => CanchaVoley.fromJson(json.decode(str));

String canchaVoleyToJson(CanchaVoley data) => json.encode(data.toJson());

class CanchaVoley {
    CanchaVoley({
        this.idVoley,
        this.nombreCancha,
        this.fotoCancha,
        this.balon,
        this.precio,
        this.horario,
        this.fotoCedula,
        this.estado,
        this.nombreCliente,
        this.telefonoCliente,
        this.red,
    });

    String? idVoley;
    String? nombreCancha;
    String? fotoCancha;
    bool? balon;
    double? precio;
    DateTime? horario;
    Foto? fotoCedula;
    bool? estado;
    String? nombreCliente;
    String? telefonoCliente;
    bool? red;

    factory CanchaVoley.fromJson(Map<String, dynamic> json) => CanchaVoley(
        idVoley: json["idVoley"],
        nombreCancha: json["nombre_cancha"],
        fotoCancha: json["foto_cancha"],
        balon: json["balon"],
        precio: json["precio"].toDouble(),
        horario: json["horario"] == null
            ? null
            : DateTime.parse(json["horario"]),
        fotoCedula: json["fotoCedula"] == null
            ? null
            : Foto.fromJson(json["fotoCedula"]),
        estado: json["estado"],
        nombreCliente: json["nombre_cliente"],
        telefonoCliente: json["telefono_cliente"],
        red: json["red"],
    );

    Map<String, dynamic> toJson() => {
        "idVoley": idVoley,
        "nombre_cancha": nombreCancha,
        "foto_cancha": fotoCancha,
        "balon": balon,
        "precio": precio,
        "horario": horario,
        "foto_cedula": fotoCedula!.toJson(),
        "estado": estado,
        "nombre_Cliente": nombreCliente,
        "telefono_Cliente": telefonoCliente,
        "red": red,
    };
}
