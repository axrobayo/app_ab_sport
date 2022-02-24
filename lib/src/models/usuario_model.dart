// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
  Usuario({this.uid, this.displayName, this.email, this.password});

  String? uid;
  String? displayName;
  String? email;
  String? password;

  factory Usuario.fromMap(map) {
    return Usuario(
      uid: map['uid'],
      email: map['email'],
      displayName: map['displayName'],
    );
  }
  Map<String, dynamic> toJson() => {
        'uid': uid,
        "displayName": displayName,
        "email": email,
        "password": password,
      };
}