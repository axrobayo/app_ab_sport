import 'package:ab_sport/src/models/reservacion_models.dart';
import 'package:flutter/material.dart';

class ListaReservacionPage extends StatelessWidget {
  const ListaReservacionPage({Key? key, required this.reservacion})
      : super(key: key);
  final Reservacion reservacion;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(appBar: AppBar(title: Text(reservacion.estado ?? ""))));
  }
}
