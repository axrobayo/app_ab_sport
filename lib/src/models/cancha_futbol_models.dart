// To parse this JSON data, do
//
//     final CanchaFutbol = CanchaFutbolFromJson(jsonString);

import 'dart:convert';

import 'package:ab_sport/src/models/foto_models.dart';

CanchaFutbol canchaFutbolFromJson(String str) =>
    CanchaFutbol.fromJson(json.decode(str));

String canchaFutbolToJson(CanchaFutbol data) => json.encode(data.toJson());

class CanchaFutbol {
  CanchaFutbol({
    this.idFutbol,
    this.nombreCancha,
    this.fotoCancha,
    this.balon,
    this.precio,
    this.horario,
    this.fotoCedula,
    this.estado,
    this.nombreCliente,
    this.telefonoCliente,
  });

  String? idFutbol;
  String? nombreCancha;
  String? fotoCancha;
  bool? balon;
  double? precio;
  DateTime? horario;
  Foto? fotoCedula;
  bool? estado;
  String? nombreCliente;
  String? telefonoCliente;

  factory CanchaFutbol.fromJson(Map<String, dynamic> json) => CanchaFutbol(
        idFutbol: json["idFutbol"],
        nombreCancha: json["nombreCancha"],
        fotoCancha: json["fotoCancha"],
        balon: json["balon"],
        precio: json["precio"].toDouble(),
        horario:
            json["horario"] == null ? null : DateTime.parse(json["horario"]),
        //fotoCedula: json["fotoCedula"] == null
        //    ? null
        //    : Foto.fromJson(json["fotoCedula"]),
        estado: json["estado"],
        nombreCliente: json["nombreCliente"],
        telefonoCliente: json["telefonocliente"],
      );

  Map<String, dynamic> toJson() => {
        "idFutbol": idFutbol,
        "nombreCancha": nombreCancha,
        "fotoCancha": fotoCancha,
        "balon": balon,
        "precio": precio,
        "horario": horario,
        "fotoCedula": fotoCedula!.toJson(),
        "estado": estado,
        "nombreCliente": nombreCliente,
        "telefonoCliente": telefonoCliente,
      };
}
