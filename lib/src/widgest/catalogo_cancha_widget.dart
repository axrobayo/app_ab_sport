import 'package:ab_sport/src/models/cancha_models.dart';
import 'package:ab_sport/src/services/cancha_service.dart';
import 'package:ab_sport/src/widgest/cards/cancha_card.dart';
import 'package:flutter/material.dart';

class ListaCanchaWidget extends StatefulWidget {
  const ListaCanchaWidget({Key? key}) : super(key: key);

  @override
  State<ListaCanchaWidget> createState() => _ListaCanchaWidgetState();
}

class _ListaCanchaWidgetState extends State<ListaCanchaWidget> {
  final CanchaService _listaCanchaService = CanchaService();
  List<Cancha>? _listaCancha;

  @override
  void initState() {
    super.initState();
    // ignore: avoid_print
    print("1. Inicio del widget");
    _downloadlistacancha();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print("2. Visualización del widget");
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 4.0),
      child: _listaCancha == null
          ? const Center(
              child: SizedBox.square(
                  dimension: 50.0, child: CircularProgressIndicator()),
            )
          : _listaCancha!.isEmpty
              ? const Center(child: Text("No hay listaReservacion registrados"))
              : ListView(
                  children:
                      _listaCancha!.map((e) => CanchaCard(rese: e)).toList(),
                ),
    );
  }

  _downloadlistacancha() async {
    // ignore: avoid_print
    //print("1.1 Invocación al servicio de mantenimiento");
    _listaCancha = await _listaCanchaService.getCancha();
    if (mounted) {
      setState(() {
        // ignore: avoid_print
        //print("3. Cambio de estado");
      });
    }
  }
}
