//import 'package:ab_sport/src/models/cancha_futbol_models.dart';
import 'package:ab_sport/src/models/cancha_futbol_models.dart';
//import 'package:ab_sport/src/models/foto_models.dart';
//import 'package:ab_sport/src/services/foto_service.dart';
import 'package:ab_sport/src/widgest/cancha_futbol_details_content_widget.dart';
import 'package:ab_sport/src/widgest/cancha_futbol_form_widget.dart';
import 'package:flutter/material.dart';
/*import 'package:trifasic_101/src/models/foto_model.dart';
import 'package:trifasic_101/src/models/mantenimiento_model.dart';
import 'package:trifasic_101/src/services/foto_service.dart';
import 'package:trifasic_101/src/widgets/mantenimiento_details_content_widget.dart';
import 'package:trifasic_101/src/widgets/mantenimiento_form_widget.dart';*/

class CanchaFutbolDetailsWidget extends StatefulWidget {
  const CanchaFutbolDetailsWidget({Key? key, required this.cfutbol})
      : super(key: key);
  final CanchaFutbol cfutbol;

  @override
  _ReservationDetailsWidgetState createState() =>
      _ReservationDetailsWidgetState();
}

class _ReservationDetailsWidgetState extends State<CanchaFutbolDetailsWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> _myTabs = <Tab>[
    const Tab(text: 'Detalles'),
    const Tab(text: 'Formulario'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(tabs: _myTabs, controller: _tabController),
      body: TabBarView(controller: _tabController, children: [
        CanchaFutbolDetailsContentWidget(cfutbol: widget.cfutbol),
        CanchaFutbolFormWidget(idFutbol: widget.cfutbol.idFutbol ?? "")
      ]),
    );
  }
}
