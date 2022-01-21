import 'package:ab_sport/src/models/cancha_basket_models.dart';
import 'package:flutter/material.dart';
/*import 'package:trifasic_101/src/models/foto_model.dart';
import 'package:trifasic_101/src/models/mantenimiento_model.dart';
import 'package:trifasic_101/src/services/foto_service.dart';
import 'package:trifasic_101/src/widgets/mantenimiento_details_content_widget.dart';
import 'package:trifasic_101/src/widgets/mantenimiento_form_widget.dart';*/
//import 'dart:developer' as developer;

class CanchaBasquetDetailsWidget extends StatefulWidget {
  const CanchaBasquetDetailsWidget({Key? key, required this.cbasquet})
      : super(key: key);
  final CanchaBasquet cbasquet;

  @override
  State<CanchaBasquetDetailsWidget> createState() =>
      _CanchaBasquetDetailsWidgetState();
}

class _CanchaBasquetDetailsWidgetState extends State<CanchaBasquetDetailsWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> _tabs = <Tab>[
    const Tab(
      text: "Detalles",
    ),
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
              cbasquet: widget.cbasquet),
          MantenimientoFormWidget(
              idcbasquet: widget.cbasquet.idcbasquet ?? "",
              isInicio: true),
          MantenimientoFormWidget(
              idmantenimiento: widget.cbasquet.idmantenimiento ?? "",
              isInicio: false),
        ], controller: _tabController)*/
    );
  }

  /* _downloadFotos() async {
    String id = widget.cbasquet.idmantenimiento!;
    FotoService fotoService = FotoService();
    List<Foto>? fotos = await fotoService.getFotos(id);
    developer.log(fotos.toString());
  }*/
}
