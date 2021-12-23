import 'package:ab_sport/src/providers/main_provider.dart';
//import 'package:ab_sport/src/providers/shared_preferences.dart';
import 'package:ab_sport/src/utils/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

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
              //onTap: () {
              // Update the state of the app.
              // ...
              //},
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
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
      ),
    );
  }
}
