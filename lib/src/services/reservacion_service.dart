import 'dart:convert';
import 'package:ab_sport/src/models/reservacion_models.dart';
import 'package:http/http.dart' as http;

class ReservacionService {
  ReservacionService();

  //Future, indica que es una llama asíncrona
  Future<List<Reservacion>> getReservacion() async {
    List<Reservacion> items = [];
    try {
      var uri = Uri.https("proyecto-5e4b9.web.app", "/api/reservacion");
      final resp = await http.get(uri);
      if (resp.body.isEmpty) return items;
      List<dynamic> jsonList = json.decode(resp.body);
      for (var item in jsonList) {
        final paciente = Reservacion.fromJson(item);
        items.add(paciente);
      }
      return items;
    } on Exception catch (e) {
      // ignore: avoid_print
      print("Exception $e");
      return items;
    }
  }
}
