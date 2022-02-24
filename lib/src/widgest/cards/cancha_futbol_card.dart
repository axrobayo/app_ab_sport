import 'package:ab_sport/src/models/cancha_futbol_models.dart';
import 'package:ab_sport/src/pages/cancha_futbol_page.dart';
import 'package:ab_sport/src/widgest/location_cancha_futbol_widget.dart';
import 'package:flutter/material.dart';
//import 'package:photo_view/photo_view.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
//import 'package:flutter_animated_button/flutter_animated_button.dart';
//import 'package:getwidget/getwidget.dart';

class CanchaCard extends StatelessWidget {
  const CanchaCard({Key? key, required this.cfutbol}) : super(key: key);
  final CanchaFutbol cfutbol;

  @override
  Widget build(BuildContext context) {
    TextEditingController _numberCtrl = TextEditingController();
    _numberCtrl.text = "0987192472";
    final urlImg = cfutbol.fotoCancha!;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          ListTile(
              //leading: const Icon(Icons.arrow_drop_down_circle),
              title: Text(cfutbol.nombreCancha ?? ""),
              subtitle:Image(
                  image: NetworkImage(urlImg),
                  width: MediaQuery.of(context).size.width)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              cfutbol.precio.toString(),
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.start,
            children: [
              ElevatedButton.icon(onPressed: (){
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                          const  LocationWidgetFutbol()),
                );            
              }, 
              icon: const Icon(Icons.location_on)
              , label: const Text('UBICACION'),),

              ElevatedButton.icon(onPressed: (){
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                          CanchaFutbolPage(cfutbol: cfutbol)),
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
          
          //Image.network(cfutbol.foto ?? "")
          //Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    );
  }
}
