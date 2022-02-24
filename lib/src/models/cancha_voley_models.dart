// To parse this JSON data, do
//
//     final CanchaVoley = CanchaVoleyFromJson(jsonString);

import 'dart:convert';

import 'package:ab_sport/src/models/foto_models.dart';

CanchaVoley canchaVoleyFromJson(String str) =>
    CanchaVoley.fromJson(json.decode(str));

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
    this.lat,
    this.lng,
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
  double? lat;
  double? lng;

  factory CanchaVoley.fromJson(Map<String, dynamic> json) => CanchaVoley(
        idVoley: json["idVoley"],
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
        telefonoCliente: json["telefonoCliente"],
        red: json["red"],
         lat: json["lat"],
        lng: json["lng"],
      );
}
