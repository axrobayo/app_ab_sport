import 'package:ab_sport/src/models/cancha_basquet_models.dart';
import 'package:ab_sport/src/widgest/cancha_basquet_details_widget.dart';
import 'package:flutter/material.dart';
//import 'package:trifasic_101/src/models/cbasquet_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:trifasic_101/src/widgets/cbasquet_details_widget.dart';

class CanchaBasquetPage extends StatelessWidget {
  const CanchaBasquetPage({Key? key, required this.cbasquet})
      : super(key: key);
  final CanchaBasquet cbasquet;

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
            title: Text(cbasquet.nombreCancha ?? "",
                overflow: TextOverflow.ellipsis),
            background: Image.asset("assets/images/cancha_basket.png", fit: BoxFit.cover)
            /*cbasquet.tipo == 1
                ? Image.asset("assets/images/preventivo.jpg", fit: BoxFit.cover)
                : cbasquet.tipo == 2
                    ? Image.asset("assets/images/reparacion.jpg",
                        fit: BoxFit.cover)
                    : Image.asset("assets/images/construccion.jpg",
                        fit: BoxFit.cover),*/
          ),
        ),
        SliverFillRemaining(
            child: CanchaBasquetDetailsWidget(cbasquet: cbasquet))
      ],
    )));
  }
}