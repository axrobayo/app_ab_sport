import 'package:ab_sport/src/models/cancha_basquet_models.dart';
import 'package:ab_sport/src/pages/cancha_basquet_page.dart';
import 'package:ab_sport/src/widgest/location_cancha_basquet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CanchaBasquetCard extends StatelessWidget {
  const CanchaBasquetCard({Key? key, required this.cbasquet}) : super(key: key);
  final CanchaBasquet cbasquet;
  
  @override
  Widget build(BuildContext context) {
    TextEditingController _numberCtrl = TextEditingController();
    _numberCtrl.text = "0987192472";
  @override
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
              ElevatedButton.icon(onPressed: (){
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const LocationWidgetBasquet()),
                );            
              }, 
              icon: const Icon(Icons.location_on)
              , label: const Text('UBICACION'),),

              ElevatedButton.icon(onPressed: (){
                FlutterPhoneDirectCaller.callNumber(_numberCtrl.text);          
              }, 
              icon: const Icon(Icons.local_phone)
              , label: const Text('LLAMAR'),)
            ],
          ),
          
          //Image.network(basquet.foto ?? "")
          //Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    );
  }
}
