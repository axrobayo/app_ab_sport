import 'package:ab_sport/src/models/cancha_voley_models.dart';
import 'package:ab_sport/src/pages/cancha_voley_page.dart';
import 'package:flutter/material.dart';

class CanchaVolyCard extends StatelessWidget {
  const CanchaVolyCard({Key? key, required this.voley}) : super(key: key);
  final CanchaVoley voley;

  @override
  Widget build(BuildContext context) {
    final urlImg = voley.fotoCancha!;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
              //leading: const Icon(Icons.arrow_drop_down_circle),
              title: Text(voley.nombreCancha ?? ""),
              subtitle: Image(
                image: NetworkImage(urlImg), 
                            width: MediaQuery.of(context).size.width
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: 
            Text(
              voley.precio.toString(),
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
                   Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        CanchaVoleyPage (cvoley : voley)),
              );
                  
                },
                child: const Text('RESERVAR'),
              ),
            ],
          ),
          //Image.network(voley.foto ?? "")
          //Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    );
  }
}
