import 'package:ab_sport/src/models/cancha_models.dart';
import 'package:flutter/material.dart';
//import 'package:getwidget/getwidget.dart';

class CanchaCard extends StatelessWidget {
  const CanchaCard({Key? key, required this.rese}) : super(key: key);
  final Cancha rese;

  @override
  Widget build(BuildContext context) {
    final urlImg = rese.foto!;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
              leading: const Icon(Icons.arrow_drop_down_circle),
              title: Text(rese.tipo ?? ""),
              subtitle: Image(
                image: NetworkImage(urlImg),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              rese.nombre ?? "",
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                //textColor: const Color(0xFF6200EE),
                onPressed: () {
                  // Perform some action
                },
                child: const Text('RESERVAR'),
              ),
            ],
          ),
          //Image.network(rese.foto ?? "")
          //Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    );
  }
}
