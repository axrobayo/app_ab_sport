import 'package:ab_sport/src/pages/menu_canchas.dart';
import 'package:ab_sport/src/widgest/cuenta_widget.dart';
//import 'package:ab_sport/src/widgest/catalogo_cancha_widget.dart';

//import 'package:ab_sport/src/widgest/location_widget.dart';
import 'package:flutter/material.dart';

class ItemMenu {
  String title;
  IconData icon;
  ItemMenu(this.icon, this.title);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Catalogo"),
  ItemMenu(Icons.history_sharp, "Apartado 2"),
  ItemMenu(Icons.grading, "Apartado 3"),
  //ItemMenu(Icons.search, "Buscar"),
  //ItemMenu(Icons.people, "Técnicos")
];
List<Widget> homeWidgets = [
  const MenuCanchas(),
  //const ListaCanchaWidget(),
  const SettingsPage(),
  const Text("Trabajandooo.....")//ListaReservacionWidget()
  //const MaterialesWidget()
];
