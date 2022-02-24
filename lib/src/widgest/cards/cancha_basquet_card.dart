import 'package:ab_sport/src/models/cancha_basquet_models.dart';
import 'package:ab_sport/src/pages/cancha_basquet_page.dart';
import 'package:flutter/material.dart';

class CanchaBasquetCard extends StatelessWidget {
  const CanchaBasquetCard({Key? key, required this.cbasquet}) : super(key: key);
  final CanchaBasquet cbasquet;

  @override
  Widget build(BuildContext context) {
    final urlImg = cbasquet.fotoCancha!;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
              //leading: const Icon(Icons.arrow_drop_down_circle),
              title: Text(cbasquet.nombreCancha ?? ""),
              subtitle: Image(
                  image: NetworkImage(urlImg),
                  width: MediaQuery.of(context).size.width)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              cbasquet.precio.toString(),
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
                            CanchaBasquetPage(cbasquet: cbasquet)),
                  );
                },
                child: const Text('RESERVAR'),
              ),
            ],
          ),
          
          //Image.network(basquet.foto ?? "")
          //Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    );
  }
}
