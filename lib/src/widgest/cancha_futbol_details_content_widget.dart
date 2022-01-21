import 'package:ab_sport/src/models/cancha_futbol_models.dart';
import 'package:flutter/material.dart';
//import 'package:trifasic_101/src/models/reservacion_model.dart';
import 'package:timeago/timeago.dart' as timeago;
//import 'package:trifasic_101/src/widgets/reservacion_priority_widget.dart';

class CanchaFutbolDetailsContentWidget extends StatelessWidget {
  const CanchaFutbolDetailsContentWidget(
      {Key? key, required this.cfutbol})
      : super(key: key);
  final CanchaFutbol cfutbol;

  @override
  Widget build(BuildContext context) {
    DateTime createdDate = cfutbol.horario ?? DateTime.now();
    final created = timeago.format(createdDate, locale: 'es');

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Nombre de la cancha"),
          subtitle: Text(cfutbol.nombreCancha ?? ""),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Precio"),
          subtitle: Text(cfutbol.precio.toString()),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Registrado"),
          subtitle: Text(created),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Estado"),
          subtitle: Text(cfutbol.horario.toString())
        ),
        const Center(
            child:
                Text("jhaah")/*reservacionPriorityWidget(priority: reservacion.prioridad)*/)
      ]),
    );
  }
}
