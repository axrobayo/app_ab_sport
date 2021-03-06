import 'package:ab_sport/src/models/categoria.dart';
import 'package:ab_sport/src/widgest/cancha_basquet_firebase_widget.dart';
import 'package:ab_sport/src/widgest/cancha_futbol_firebase_widget.dart';
import 'package:ab_sport/src/widgest/cancha_voly_firebase_widget.dart';
//import 'package:ab_sport/src/widgest/catalogo_cancha_widget.dart';
import 'package:flutter/material.dart';

class MenuCanchas extends StatefulWidget {
  const MenuCanchas({Key? key}) : super(key: key);

  @override
  _MenuCanchasState createState() => _MenuCanchasState();
}

class _MenuCanchasState extends State<MenuCanchas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: menu.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1),
          itemBuilder: (context, index) {
            return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10)),
                child: GestureDetector(
                    onTap: () {
                      if (menu[index].nombre == "Fútbol") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const CanchaFutbolFirebaseWidget()));
                      } else if (menu[index].nombre == "Basquet") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const CanchaBasquetFirebaseWidget()));
                      } else if (menu[index].nombre == "Ecuavoley") {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const CanchaVoleyFirebaseWidget()));
                      }
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ListaCanchaWidget()));*/
                      // ignore: avoid_print
                      //print("click en" + menu[index].nombre);
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            menu[index].nombre,
                            style: Theme.of(context).textTheme.headline2!,
                          ),
                          Image.asset(
                            "assets/images/" + menu[index].foto,
                            width: MediaQuery.of(context).size.width,
                          )
                        ])));
          }),
    );
  }
}
