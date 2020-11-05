import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
class FlutterMapMobike extends StatelessWidget {
  const FlutterMapMobike({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(-33.442187, -70.543300),
        zoom: 14,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/matimondaca/ckh40ybtm0bi01atnd866llbe/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWF0aW1vbmRhY2EiLCJhIjoiY2toNDBmZ3ZtMDc3cDJ0cWI4ZXQxMHJhbyJ9.BIOYNRBr_PQCBmED-whnnA",
          additionalOptions: {
            'accessToken':
                'pk.eyJ1IjoibWF0aW1vbmRhY2EiLCJhIjoiY2toNDBmZ3ZtMDc3cDJ0cWI4ZXQxMHJhbyJ9.BIOYNRBr_PQCBmED-whnnA',
            'id': ' mapbox.mapbox-streets-v7',
          },
        ),
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 50.0,
              height: 50.0,
              point: LatLng(-33.442187, -70.543300),
              builder: (ctx) => Container(
                child: Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 50.0,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}