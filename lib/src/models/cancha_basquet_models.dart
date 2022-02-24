// To parse this JSON data, do
//
//     final CanchaBasquet = CanchaBasquetFromJson(jsonString);

import 'dart:convert';

import 'package:ab_sport/src/models/foto_models.dart';



CanchaBasquet canchaBasquetFromJson(String str) =>
    CanchaBasquet.fromJson(json.decode(str));

class CanchaBasquet {
  CanchaBasquet({
    this.idBasquet,
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

  String? idBasquet;
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

  factory CanchaBasquet.fromJson(Map<String, dynamic> json) => CanchaBasquet(
        idBasquet: json["idBasquet"],
        nombreCancha: json["nombreCancha"],
        fotoCancha: json["fotoCancha"],
        balon: json["balon"],
        precio: json["precio"].toDouble(),
        horario:
            json["horario"] == null ? null : DateTime.parse(json["horario"]),
        estado: json["estado"],
        nombreCliente: json["nombreCanchaBasquet"],
        telefonoCliente: json["telefonoCanchaBasquet"],
        lat: json["lat"],
        lng: json["lng"],
      );  
}
