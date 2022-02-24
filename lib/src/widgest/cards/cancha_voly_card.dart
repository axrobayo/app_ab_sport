import 'package:ab_sport/src/models/cancha_voley_models.dart';
import 'package:ab_sport/src/pages/cancha_voley_page.dart';
import 'package:ab_sport/src/widgest/location_cancha_voley_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
//import 'package:url_launcher/url_launcher.dart';

class CanchaVolyCard extends StatelessWidget {
  const CanchaVolyCard({Key? key, required this.voley}) : super(key: key);
  final CanchaVoley voley;
   /*void whatsapp({@required number, @required message}) async {
     String url = "whatsapp://send?phone=$number&text=$message";
     
     await canLaunch(url) ? launch(url) : print("No se puede abrir WhatsApp");
  }*/
  @override
  Widget build(BuildContext context) {
    TextEditingController _numberCtrl = TextEditingController();
    _numberCtrl.text = "0987192472";
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
              ElevatedButton.icon(onPressed: (){
                Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const LocationWidgetVoley()),
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

          //Boton Whatsapp
         
          // ButtonBar(
          //   alignment: MainAxisAlignment.start,
          //   children: [
          //     ElevatedButton(
          //       //textColor: const Color(0xFF6200EE),
          //       onPressed: () {
          //         whatsapp(number: "+593987192472", message: "Mensaje");
                  
          //       },
          //       child: const Text('WhatsApp'),
          //     ),
          //   ],
          // ),
          //Image.network(voley.foto ?? "")
          //Image.asset('assets/card-sample-image-2.jpg'),
        ],
      ),
    );
  }
}
