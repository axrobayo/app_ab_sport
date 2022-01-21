// To parse this JSON data, do
//
//     final CanchaBasquet = CanchaBasquetFromJson(jsonString);

import 'dart:convert';

import 'package:ab_sport/src/models/foto_models.dart';

//import 'package:ab_sport/src/models/foto_models.dart';

CanchaBasquet canchaBasquetFromJson(String str) =>
    CanchaBasquet.fromJson(json.decode(str));

String canchaBasquetToJson(CanchaBasquet data) => json.encode(data.toJson());

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

  factory CanchaBasquet.fromJson(Map<String, dynamic> json) => CanchaBasquet(
        idBasquet: json["idBasquet"],
        nombreCancha: json["nombreCancha"],
        fotoCancha: json["fotoCancha"],
        balon: json["balon"],
        precio: json["precio"].toDouble(),
        horario:
            json["horario"] == null ? null : DateTime.parse(json["horario"]),
        //fotoCedula: json["fotoCedula"],
        estado: json["estado"],
        nombreCliente: json["nombreCanchaBasquet"],
        telefonoCliente: json["telefonoCanchaBasquet"],
      );

  Map<String, dynamic> toJson() => {
        "idBasquet": idBasquet,
        "nombreCancha": nombreCancha,
        "fotoCancha": fotoCancha,
        "balon": balon,
        "precio": precio,
        "horario": horario,
        "fotoCedula": fotoCedula!.toJson(),
        "estado": estado,
        "nombreCanchaBasquet": nombreCliente,
        "telefonoCanchaBasquet": telefonoCliente,
      };
}
