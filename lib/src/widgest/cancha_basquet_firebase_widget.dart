import 'package:ab_sport/src/models/cancha_basket_models.dart';
import 'package:ab_sport/src/widgest/cards/cancha_basquet_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CanchaBasquetFirebaseWidget extends StatefulWidget {
  const CanchaBasquetFirebaseWidget({Key? key}) : super(key: key);

  @override
  _CanchaBasquetFirebaseWidgetState createState() =>
      _CanchaBasquetFirebaseWidgetState();
}

class _CanchaBasquetFirebaseWidgetState
    extends State<CanchaBasquetFirebaseWidget> {
  final Stream<QuerySnapshot> _canchaBasquetRef =
      FirebaseFirestore.instance.collection('canchaBasquet').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _canchaBasquetRef,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Un error ha ocurrido"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox.square(
                  dimension: 50.0, child: CircularProgressIndicator()));
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            CanchaBasquet model = CanchaBasquet.fromJson(data);
            model.idBasquet = document.id;

            return CanchaBasquetCard(basquet: model);
          }).toList(),
        );
      },
    );
  }
}
