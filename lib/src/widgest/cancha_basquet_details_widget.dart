//import 'package:ab_sport/src/models/cancha_futbol_models.dart';
import 'package:ab_sport/src/models/cancha_basquet_models.dart';
import 'package:ab_sport/src/widgest/cancha_basquet_details_content.dart';
import 'package:ab_sport/src/widgest/cancha_basquet_form_widget.dart';

import 'package:flutter/material.dart';

class CanchaBasquetDetailsWidget extends StatefulWidget {
  const CanchaBasquetDetailsWidget({Key? key, required this.cbasquet})
      : super(key: key);
  final CanchaBasquet cbasquet;

  @override
  _CanchaBasquetDetailsWidgetState createState() =>
      _CanchaBasquetDetailsWidgetState();
}

class _CanchaBasquetDetailsWidgetState extends State<CanchaBasquetDetailsWidget>
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
        CanchaBasquetDetailsContentWidget(cbasquet: widget.cbasquet),
        CanchaBasquetFormWidget(idBasquet: widget.cbasquet.idBasquet ?? "")
      ]),
    );
  }
}
