import 'package:ab_sport/src/models/reservacion_models.dart';
import 'package:ab_sport/src/services/reservacion_service.dart';
import 'package:ab_sport/src/widgest/cards/reservacion_card.dart';
import 'package:flutter/material.dart';

class ListaReservacionWidget extends StatefulWidget {
  const ListaReservacionWidget({Key? key}) : super(key: key);

  @override
  State<ListaReservacionWidget> createState() => _ListaReservacionWidgetState();
}

class _ListaReservacionWidgetState extends State<ListaReservacionWidget> {
  final ReservacionService _listaReservacionervice = ReservacionService();
  List<Reservacion>? _listaReservacion;

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print("1. Inicio del widget");
    _downloadlistaReservacion();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("2. Visualización del widget");
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
      child: _listaReservacion == null
          ? const Center(
              child: SizedBox.square(
                  dimension: 50.0, child: CircularProgressIndicator()),
            )
          : _listaReservacion!.isEmpty
              ? const Center(child: Text("No hay listaReservacion registrados"))
              : ListView(
                  children: _listaReservacion!
                      .map((e) => ReservacionCard(rese: e))
                      .toList(),
                ),
    );
  }

  _downloadlistaReservacion() async {
    // ignore: avoid_print
    //print("1.1 Invocación al servicio de mantenimiento");
    _listaReservacion = await _listaReservacionervice.getReservacion();
    if (mounted) {
      setState(() {
        // ignore: avoid_print
        //print("3. Cambio de estado");
      });
    }
  }
}
