import 'package:ab_sport/src/models/cancha_futbol_models.dart';
//import 'package:ab_sport/src/models/reservacion_models.dart';
import 'package:ab_sport/src/widgest/cards/cancha_futbol_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CanchaFutbolFirebaseWidget extends StatefulWidget {
  const CanchaFutbolFirebaseWidget({Key? key}) : super(key: key);

  @override
  _CanchaFutbolFirebaseWidgetState createState() =>
      _CanchaFutbolFirebaseWidgetState();
}

class _CanchaFutbolFirebaseWidgetState
    extends State<CanchaFutbolFirebaseWidget> {
  final Stream<QuerySnapshot> _canchaFutbolRef =
      FirebaseFirestore.instance.collection('canchaFutbol').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _canchaFutbolRef,
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
            CanchaFutbol model = CanchaFutbol.fromJson(data);
            model.idFutbol = document.id;

            return CanchaCard(cfutbol: model);
          }).toList(),
        );
      },
    );
  }
}
