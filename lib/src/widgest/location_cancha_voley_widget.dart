import 'dart:async';

import 'package:ab_sport/src/models/cancha_Voley_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

late double _latitud, _longitud;

class LocationWidgetVoley extends StatefulWidget {
  const LocationWidgetVoley({Key? key}) : super(key: key);

  @override
  State<LocationWidgetVoley> createState() => _LocationWidgetVoleyState();
}

class _LocationWidgetVoleyState extends State<LocationWidgetVoley> {
  final Completer<GoogleMapController> _controller = Completer();

  final Stream<QuerySnapshot> _mantenimientoStrem =
      FirebaseFirestore.instance.collection('canchaVoley').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _mantenimientoStrem,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: SizedBox(
                  child: Text('Error al consultar los mantenimientos.')),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasData) {
            Set<Marker> kMnts =
                snapshot.data!.docs.map((DocumentSnapshot document) {
              CanchaVoley model =
                  CanchaVoley.fromJson(document.data() as Map<String, dynamic>);
              _latitud = model.lat!;
              _longitud = model.lng!;
              Marker marker = Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                  infoWindow: InfoWindow(title: model.nombreCancha),
                  markerId: MarkerId(model.idVoley ?? ""),
                  position:
                      LatLng(model.lat ?? -0.9333, model.lng ?? -78.6185));
              return marker;
            }).toSet();

            return GoogleMap(
              markers: kMnts,
              mapType: MapType.terrain,
              initialCameraPosition:
                  CameraPosition(target: LatLng(_latitud, _longitud), zoom: 14),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          }

          return const SizedBox();
        });
  }
}
