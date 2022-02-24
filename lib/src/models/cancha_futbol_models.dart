// To parse this JSON data, do
//
//     final CanchaFutbol = CanchaFutbolFromJson(jsonString);

import 'dart:convert';

import 'package:ab_sport/src/models/foto_models.dart';

//import 'package:ab_sport/src/models/foto_models.dart';

CanchaFutbol canchaFutbolFromJson(String str) =>
    CanchaFutbol.fromJson(json.decode(str));



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
    this.lat,
    this.lng
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
  double? lat;
  double? lng;

  factory CanchaFutbol.fromJson(Map<String, dynamic> json) => CanchaFutbol(
        idFutbol: json["idFutbol"],
        nombreCancha: json["nombreCancha"],
        fotoCancha: json["fotoCancha"],
        balon: json["balon"],
        precio: json["precio"].toDouble(),
        horario:
            json["horario"] == null ? null : DateTime.parse(json["horario"]),
        estado: json["estado"],
        nombreCliente: json["nombreCliente"],
        telefonoCliente: json["telefonocliente"],
        lat: json["lat"],
        lng: json["lng"],
      );

  
}
