import 'package:ab_sport/src/models/cancha_voly_models.dart';
import 'package:flutter/material.dart';
/*import 'package:trifasic_101/src/models/foto_model.dart';
import 'package:trifasic_101/src/models/mantenimiento_model.dart';
import 'package:trifasic_101/src/services/foto_service.dart';
import 'package:trifasic_101/src/widgets/mantenimiento_details_content_widget.dart';
import 'package:trifasic_101/src/widgets/mantenimiento_form_widget.dart';*/
//import 'dart:developer' as developer;

class CanchaVoleyDetailsWidget extends StatefulWidget {
  const CanchaVoleyDetailsWidget({Key? key, required this.cvoley})
      : super(key: key);
  final CanchaVoley cvoley;

  @override
  State<CanchaVoleyDetailsWidget> createState() =>
      _CanchaVoleyDetailsWidgetState();
}

class _CanchaVoleyDetailsWidgetState extends State<CanchaVoleyDetailsWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
    const Tab(text: "Detalles", ),
    const Tab(text: "Reservacion"),
    
    //const Tab(text: "Final")
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: _tabs.length, vsync: this);
    super.initState();
    //_downloadFotos();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TabBar(tabs: _tabs, controller: _tabController),
        /*body: TabBarView(children: [
          MantenimientoDetailsContentWidget(
              cvoley: widget.cvoley),
          MantenimientoFormWidget(
              idcvoley: widget.cvoley.idcvoley ?? "",
              isInicio: true),
          MantenimientoFormWidget(
              idmantenimiento: widget.cvoley.idmantenimiento ?? "",
              isInicio: false),
        ], controller: _tabController)*/);
  }

 /* _downloadFotos() async {
    String id = widget.cvoley.idmantenimiento!;
    FotoService fotoService = FotoService();
    List<Foto>? fotos = await fotoService.getFotos(id);
    developer.log(fotos.toString());
  }*/
}