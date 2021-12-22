// To parse this JSON data, do
//
//     final cliente = clienteFromJson(jsonString);

import 'dart:convert';

Cliente clienteFromJson(String str) => Cliente.fromJson(json.decode(str));

String clienteToJson(Cliente data) => json.encode(data.toJson());

class Cliente {
    Cliente({
        this.nombre,
        this.telefono,
    });

    String? nombre;
    String? telefono;

    factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        nombre: json["nombre"],
        telefono: json["telefono"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "telefono": telefono,
    };
}