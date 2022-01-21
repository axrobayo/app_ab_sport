import 'package:ab_sport/src/models/cancha_voley_models.dart';
import 'package:flutter/material.dart';
//import 'package:trifasic_101/src/models/reservacion_model.dart';
import 'package:timeago/timeago.dart' as timeago;
//import 'package:trifasic_101/src/widgets/reservacion_priority_widget.dart';

class CanchaVoleyDetailsContentWidget extends StatelessWidget {
  const CanchaVoleyDetailsContentWidget({Key? key, required this.cvoley})
      : super(key: key);
  final CanchaVoley cvoley;

  @override
  Widget build(BuildContext context) {
    DateTime createdDate = cvoley.horario ?? DateTime.now();
    final created = timeago.format(createdDate, locale: 'es');

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Nombre de la cancha"),
          subtitle: Text(cvoley.nombreCancha ?? ""),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Precio"),
          subtitle: Text(cvoley.precio.toString()),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Registrado"),
          subtitle: Text(created),
        ),
        ListTile(
            leading: const Icon(Icons.comment),
            title: const Text("Estado"),
            subtitle: Text(cvoley.horario.toString())),
        const Center(
            child: Text(
                "jhaah") /*reservacionPriorityWidget(priority: reservacion.prioridad)*/)
      ]),
    );
  }
}
