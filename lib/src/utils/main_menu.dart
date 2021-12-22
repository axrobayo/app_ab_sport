import 'package:ab_sport/src/widgest/listareservacion_widget.dart';
import 'package:ab_sport/src/widgest/location_widget.dart';
import 'package:flutter/material.dart';

class ItemMenu {
  String title;
  IconData icon;
  ItemMenu(this.icon, this.title);
}

List<ItemMenu> menuOptions = [
  ItemMenu(Icons.home, "Catalogo"),
  ItemMenu(Icons.history_sharp, "Reservacion"),
  ItemMenu(Icons.grading, "Listado reservaciones"),
  //ItemMenu(Icons.search, "Buscar"),
  //ItemMenu(Icons.people, "Técnicos")
];
List<Widget> homeWidgets = [
  const LocationWidget(),
  const Text("Aqui debe ir la reservacion"),
  const ListaReservacionWidget()
  //const MaterialesWidget()
];
