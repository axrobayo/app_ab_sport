// ignore_for_file: file_names

import 'package:ab_sport/src/models/reservacion_models.dart';
import 'package:flutter/material.dart';

class ReservacionCard extends StatelessWidget {
  const ReservacionCard({Key? key, required this.rese}) : super(key: key);
  final Reservacion rese;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("id reservacion: " + rese.idReservacion.toString()),
        subtitle: Text("Precio: " + rese.precio.toString()),
        trailing: Text(rese.horario ?? ""),
        leading: Text("Estado: "+rese.estado.toString()),
      ),
    );
  }
}
