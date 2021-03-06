import 'dart:convert';
import 'package:ab_sport/src/models/cancha_futbol_models.dart';
import 'package:http/http.dart' as http;

class CanchaService {
  CanchaService();

  //Future, indica que es una llama asíncrona
  Future<List<CanchaFutbol>> getCancha() async {
    List<CanchaFutbol> items = [];
    try {
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/cancha");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final cancha = CanchaFutbol.fromJson(item);
        items.add(cancha);
      }
      return items;
    } on Exception catch (e) {
      // ignore: avoid_print
      print("Exception $e");
      return items;
    }
  }
}
