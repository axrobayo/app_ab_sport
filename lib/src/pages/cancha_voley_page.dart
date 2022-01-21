import 'package:ab_sport/src/models/cancha_voley_models.dart';
import 'package:ab_sport/src/widgest/cancha_voley_details_widget.dart';
import 'package:flutter/material.dart';
//import 'package:trifasic_101/src/models/cvoley_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:trifasic_101/src/widgets/cvoley_details_widget.dart';

class CanchaVoleyPage extends StatelessWidget {
  const CanchaVoleyPage({Key? key, required this.cvoley})
      : super(key: key);
  final CanchaVoley cvoley;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: true,
          expandedHeight: 180.h,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(cvoley.nombreCancha ?? "",
                overflow: TextOverflow.ellipsis),
            background: Image.asset("assets/images/cancha_voly.png", fit: BoxFit.cover)
            /*cvoley.tipo == 1
                ? Image.asset("assets/images/preventivo.jpg", fit: BoxFit.cover)
                : cvoley.tipo == 2
                    ? Image.asset("assets/images/reparacion.jpg",
                        fit: BoxFit.cover)
                    : Image.asset("assets/images/construccion.jpg",
                        fit: BoxFit.cover),*/
          ),
        ),
        SliverFillRemaining(
            child: CanchaVoleyDetailsWidget(cvoley: cvoley))
      ],
    )));
  }
}