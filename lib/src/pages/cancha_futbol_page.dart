import 'package:ab_sport/src/models/cancha_futbol_models.dart';
//import 'package:ab_sport/src/models/reservacion_models.dart';
import 'package:ab_sport/src/widgest/cancha_futbol_details_widget.dart';
import 'package:flutter/material.dart';
//import 'package:trifasic_101/src/models/cfutbol_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:trifasic_101/src/widgets/cfutbol_details_widget.dart';

class CanchaFutbolPage extends StatelessWidget {
  const CanchaFutbolPage(
      {Key? key, required this.cfutbol})
      : super(key: key);
  
  final CanchaFutbol cfutbol;

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
              title:
                  Text(cfutbol.nombreCancha ?? "", overflow: TextOverflow.ellipsis),
              background:
                  Image.asset("assets/images/futbol.jpeg", fit: BoxFit.cover)),
        ),
        SliverFillRemaining(
            child: CanchaFutbolDetailsWidget(cfutbol: cfutbol))
      ],
    )));
  }
}
