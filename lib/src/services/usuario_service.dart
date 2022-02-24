import 'dart:convert';

import 'package:ab_sport/src/models/usuario_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

class UsuarioService {
  UsuarioService();

  //final String _urlRoot = "https://proyecto-5e4b9.web.app/api/registro";
  final String _firebaseAPIKey = 'AIzaSyAAYLawLquO5snwMg2OryoncK99ol0-gn8';
  final String us = "";
  Future<Map<String, dynamic>> login(Usuario usuario) async {
    try {
      final loginBody = {
        "email": usuario.email,
        "password": usuario.password,
        "returnSecureToken": true
      };
      final queryParams = {"key": _firebaseAPIKey};
      var uri = Uri.https("www.googleapis.com",
          "/identitytoolkit/v3/relyingparty/verifyPassword", queryParams);
      var response = await http.post(uri, body: json.encode(loginBody));
      if (response.body.isEmpty) return <String, dynamic>{};
      Map<String, dynamic> decodedResp = json.decode(response.body);
      developer.log(decodedResp.toString());
      return decodedResp;
    } catch (e) {
      developer.log(e.toString());
      return <String, dynamic>{};
    }
  }

  Future<int> postUsuario(Usuario usuario) async {
    try{
      FirebaseAuth registro = FirebaseAuth.instance; 
      await registro.createUserWithEmailAndPassword(email: usuario.email.toString(), password: usuario.password.toString());
      return 201;
    }catch(e){
      return 500;
    }
    /*try {
      var uri = Uri.parse(_urlRoot);
      String usuarioBody = usuarioToJson(usuario);
      final Map<String, String> _headers = {"content-type": "application/json"};
      var response = await http.post(uri, headers: _headers, body: usuarioBody);
      if (response.body.isEmpty) return 400;
      Map<String, dynamic> content = json.decode(response.body);
      int result = content["estado"];
      developer.log("Estado $result");
      return result;
    } catch (ex) {
      developer.log("Error $ex");
      return 500;*/
    }

  Future<void> sendToServer(Usuario usuario) async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference;
      reference = FirebaseFirestore.instance.collection("usuario");
      await reference.add({
        // ignore: unnecessary_string_interpolations
        "uid": "$us",
        "name": usuario.displayName.toString(),
      });
    });
  }


}
