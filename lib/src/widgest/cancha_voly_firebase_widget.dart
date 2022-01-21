import 'package:ab_sport/src/models/cancha_voly_models.dart';
import 'package:ab_sport/src/widgest/cards/cancha_voly_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CanchaVoleyFirebaseWidget extends StatefulWidget {
  const CanchaVoleyFirebaseWidget({Key? key}) : super(key: key);

  @override
  _CanchaVoleyFirebaseWidgetState createState() =>
      _CanchaVoleyFirebaseWidgetState();
}

class _CanchaVoleyFirebaseWidgetState extends State<CanchaVoleyFirebaseWidget> {
  final Stream<QuerySnapshot> _canchaVoleyRef =
      FirebaseFirestore.instance.collection('canchaVoley').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _canchaVoleyRef,
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
            CanchaVoley model = CanchaVoley.fromJson(data);
            model.idVoley = document.id;

            return CanchaVolyCard(voley: model);
          }).toList(),
        );
      },
    );
  }
}
