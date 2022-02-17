import 'package:ab_sport/src/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    Map<String, dynamic> content = JwtDecoder.decode(mainProvider.token);

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Trifasic - Ajustes")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Card(
                child: ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          mainProvider.token = "";
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.logout)),
                    leading: const Icon(Icons.person),
                    //title: Text(content["name"]),
                    subtitle: const Text("Nombre"))),
            /*Card(
                child: ListTile(
                    leading: const Icon(Icons.computer),
                    title: Text(content["role"].toString().toUpperCase()),
                    subtitle: const Text("Rol"))),*/
            Card(
                child: ListTile(
                    leading: const Icon(Icons.important_devices),
                    title: Text(content["user_id"]),
                    subtitle: const Text("Id"))),
            Card(
                child: ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(content["email"]),
                    subtitle: const Text("Correo electrónico"))),
            /*Card(
                child: ListTile(
                    leading: const Icon(Icons.people),
                    title: content.containsKey("group")
                        ? Text("GRUPO " + content["group"])
                        : null,
                    subtitle: const Text("Grupo de trabajo"))),*/
            //const SettingMode()
          ],
        ),
      ),
    ));
  }
}