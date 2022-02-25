import 'package:ab_sport/src/providers/main_provider.dart';
//import 'package:ab_sport/src/providers/shared_preferences.dart';
import 'package:ab_sport/src/utils/main_menu.dart';
import 'package:ab_sport/src/widgest/email_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
//import 'package:url_launcher/url_launcher.dart';

//const _url = 'https://github.com/axrobayo/app_ab_sport';
final List<String> _options = [
  "Catalogo",
  "Reservacion",
  "Listado reservaciones"
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  //final prefs = Preferences() ;

  @override
  Widget build(BuildContext context) {
    //print("2. Construcción del widget");
    final mainProvider = Provider.of<MainProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Configuración'),
            ),
            ListTile(
              title: const Text('Modo oscuro'),
              trailing: Switch(
                  value: mainProvider.mode,
                  onChanged: (bool value) async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setBool("mode", value);
                    mainProvider.mode = value;
                    //setState(() {});
                  }),
              
            ),
            ListTile(
              title: const Text('Contactanos: AB Sport'),
              onTap: () {
                Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const EmailForm()));
              },
            ),
          ],
        )),
        appBar: AppBar(
            centerTitle: true,
            title: Text('AB Sport - ' + _options[mainProvider.index])),
        body: homeWidgets[mainProvider.index],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (int index) {
            mainProvider.index = index;
            //print("3. Cambio de estado del widget");
          },
          currentIndex: mainProvider.index,
          type: BottomNavigationBarType.fixed,
          items: menuOptions
              .map((e) =>
                  BottomNavigationBarItem(icon: Icon(e.icon), label: e.title))
              .toList(),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(230, 0, 3, 8),
          foregroundColor: const Color.fromARGB(255, 253, 253, 253),
          //mini: true,
          onPressed: () {
            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    const EmailForm()));
            // Respond to button press
          },
          child: const Icon(Icons.mail),
        ),
      ),
    );
  }
}

/*void _launchURL() async {
  if (!await launch(_url)) throw 'no se puede acceder al siguiente enlace: $_url';
}*/
