import 'package:ab_sport/src/models/cancha_voley_models.dart';

import 'package:ab_sport/src/widgest/cancha_voley_details_content_widget.dart';
import 'package:ab_sport/src/widgest/cancha_voley_form_widget.dart';
import 'package:flutter/material.dart';

class CanchaVoleyDetailsWidget extends StatefulWidget {
  const CanchaVoleyDetailsWidget({Key? key, required this.cvoley})
      : super(key: key);
  final CanchaVoley cvoley;

  @override
  _CanchaVoleyDetailsWidgetState createState() =>
      _CanchaVoleyDetailsWidgetState();
}

class _CanchaVoleyDetailsWidgetState extends State<CanchaVoleyDetailsWidget>
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
        CanchaVoleyDetailsContentWidget(cvoley: widget.cvoley),
        CanchaVoleyFormWidget(idFutbol: widget.cvoley.idVoley ?? "")
      ]),
    );
  }
}
