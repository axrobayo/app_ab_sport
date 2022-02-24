import 'dart:async';
import 'package:ab_sport/src/models/cancha_futbol_models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//final CanchaFutbol puntos = CanchaFutbol();
late double latitud, longitud;


class LocationWidgetFutbol extends StatefulWidget {
  const LocationWidgetFutbol({Key? key}) : super(key: key);

  @override
  State<LocationWidgetFutbol> createState() => _LocationWidgetFutbolState();
}

class _LocationWidgetFutbolState extends State<LocationWidgetFutbol> {
  final Completer<GoogleMapController> _controller = Completer();

  /*final CameraPosition _kLatacunga = CameraPosition(
    target: LatLng(puntos.lat!, puntos.lng!),
    zoom: 14,
  );*/

  final Stream<QuerySnapshot> _mantenimientoStrem =
      FirebaseFirestore.instance.collection('canchaFutbol').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _mantenimientoStrem,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: SizedBox(child: Text('Error al consultar la cancha.')),
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
              CanchaFutbol model = CanchaFutbol.fromJson(
                  document.data() as Map<String, dynamic>);
              latitud= model.lat!;    
              longitud=model.lng!;

              Marker marker = Marker(
                  icon: BitmapDescriptor.defaultMarkerWithHue(
                      BitmapDescriptor.hueRed),
                  infoWindow: InfoWindow(title: model.nombreCancha),
                  markerId: MarkerId(model.idFutbol ?? ""),
                  position:
                      LatLng(model.lat ?? -0.9333, model.lng ?? -78.6185));
              return marker;
            }).toSet();

            return GoogleMap(
              markers: kMnts,
              mapType: MapType.terrain,
              initialCameraPosition: CameraPosition(
                target: LatLng(latitud, longitud),
                zoom: 14,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            );
          }

          return const SizedBox();
        });
  }
}
