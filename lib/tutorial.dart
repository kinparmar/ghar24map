import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_1/fakedata.dart';
import 'package:latlong2/latlong.dart' as LatLng;

class tutorial extends StatefulWidget {
  const tutorial({super.key});

  @override
  State<tutorial> createState() => _tutorialState();
}

class _tutorialState extends State<tutorial> {

  List<Marker> getMarkers()
  {
    return List<Marker>.from(FakeData.fakeLocatiopns.map((e) => new Marker(
      point: LatLng.LatLng(e.latitud,e.longitud), 
      width: 80,
      height: 80,
      child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.home, color: Colors.green), // icon
            Text(e.price), // text
          ],
        ),
              ),
          ));
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(child: FlutterMap(
    options: MapOptions(
      initialCenter: LatLng.LatLng(23.193841, 72.613560),
      initialZoom: 16,
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
      RichAttributionWidget(
        attributions: [
         /*  TextSourceAttribution(
            'OpenStreetMap contributors',
            onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
          ), */
        ],
      ),
      MarkerLayer(markers: getMarkers())
    ],
  ),),
    );
  }
}