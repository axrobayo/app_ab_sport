import 'package:ab_sport/src/models/cancha_basquet_models.dart';

import 'package:flutter/material.dart';
//import 'package:trifasic_101/src/models/reservacion_model.dart';
import 'package:timeago/timeago.dart' as timeago;
//import 'package:trifasic_101/src/widgets/reservacion_priority_widget.dart';

class CanchaBasquetDetailsContentWidget extends StatelessWidget {
  const CanchaBasquetDetailsContentWidget(
      {Key? key, required this.cbasquet})
      : super(key: key);
  final CanchaBasquet cbasquet;

  @override
  Widget build(BuildContext context) {
    DateTime createdDate = cbasquet.horario ?? DateTime.now();
    final created = timeago.format(createdDate, locale: 'es');

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(children: [
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Nombre de la cancha"),
          subtitle: Text(cbasquet.nombreCancha ?? ""),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Precio"),
          subtitle: Text(cbasquet.precio.toString()),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Registrado"),
          subtitle: Text(created),
        ),
        ListTile(
          leading: const Icon(Icons.comment),
          title: const Text("Estado"),
          subtitle: Text(cbasquet.horario.toString())
        ),
        const Center(
            child:
                Text("jhaah")/*reservacionPriorityWidget(priority: reservacion.prioridad)*/)
      ]),
    );
  }
}
