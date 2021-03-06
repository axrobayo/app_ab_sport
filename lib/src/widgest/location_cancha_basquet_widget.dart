import 'dart:async';

import 'package:ab_sport/src/models/cancha_Basquet_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

late double _latitud, _longitud;

class LocationWidgetBasquet extends StatefulWidget {
  const LocationWidgetBasquet({Key? key}) : super(key: key);

  @override
  State<LocationWidgetBasquet> createState() => _LocationWidgetBasquetState();
}

class _LocationWidgetBasquetState extends State<LocationWidgetBasquet> {
  final Completer<GoogleMapController> _controller = Completer();

  final Stream<QuerySnapshot> _canchaStrem =
      FirebaseFirestore.instance.collection('canchaBasquet').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _canchaStrem,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: SizedBox(
                  child: Text('Error al consultar la cancha')),
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
              CanchaBasquet model = CanchaBasquet.fromJson(
                  document.data() as Map<String, dynamic>);
              _latitud = model.lat!;
              _longitud = model.lng!;
              Marker marker = Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                  infoWindow: InfoWindow(title: model.nombreCancha),
                  markerId: MarkerId(model.idBasquet ?? ""),
                  position:
                      LatLng(model.lat ?? -0.9333, model.lng ?? -78.6185));
              return marker;
            }).toSet();

            return GoogleMap(
              markers: kMnts,
              mapType: MapType.terrain,
              initialCameraPosition: CameraPosition(
                target: LatLng(_latitud, _longitud),
                zoom: 14),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          }

          return const SizedBox();
        });
  }
}
