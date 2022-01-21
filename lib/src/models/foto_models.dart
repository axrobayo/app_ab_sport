import 'dart:convert';

Foto fotoFromJson(String str) => Foto.fromJson(json.decode(str));

String fotoToJson(Foto data) => json.encode(data.toJson());

class Foto {
  Foto({this.url, this.observacion, this.fecha, this.idFutbol});

  String? url;
  String? observacion;
  DateTime? fecha;
  String? idFutbol;

  factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        url: json["url"],
        observacion: json["observacion"],
        fecha: DateTime.parse(json["fecha"]),
        idFutbol: json["idFutbol"],
      );

  factory Foto.created(String id) => Foto(idFutbol: id, fecha: DateTime.now());

  Map<String, dynamic> toJson() => {
        "url": url,
        "observacion": observacion,
        "fecha": fecha!.toIso8601String(),
        "idFutbol": idFutbol
      };
}
