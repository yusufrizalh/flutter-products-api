// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  // menentukan lokasi awal
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  LatLng _initialCameraPosition = LatLng(-7.323965988993663, 112.7412458893145);
  late GoogleMapController _controller;
  Location _location = Location();

  // method ketika google maps mulai muncul
  void _onMapCreated(GoogleMapController _ctrl) {
    _controller = _ctrl;

    final marker = Marker(
      markerId: MarkerId('inix_sby'),
      position: _initialCameraPosition,
      infoWindow: InfoWindow(
        title: 'Inixindo Surabaya',
        snippet: 'Gedung KOMPAS Gramedia',
        onTap: () {
          // memunculkan informasi lengkap
        },
      ),
    );

    setState(() {
      markers[MarkerId('inix_sby')] = marker;
    });

    // _location.onLocationChanged.listen((loc) {
    //   _controller.animateCamera(
    //     CameraUpdate.newCameraPosition(
    //       CameraPosition(
    //         target: LatLng(loc.latitude!, loc.longitude!),
    //         zoom: 18,
    //       ),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _initialCameraPosition,
                  zoom: 19,
                ),
                zoomControlsEnabled: true,
                mapType: MapType.satellite,
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: markers.values.toSet(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
