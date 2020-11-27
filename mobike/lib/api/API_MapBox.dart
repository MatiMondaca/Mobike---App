import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong/latlong.dart';
import 'package:mobike/utils/constantes.dart';

class MapMobike extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var tileLayerOptions = TileLayerOptions(
      urlTemplate:
          "https://api.mapbox.com/styles/v1/matimondaca/ckh40ybtm0bi01atnd866llbe/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWF0aW1vbmRhY2EiLCJhIjoiY2toNDBmZ3ZtMDc3cDJ0cWI4ZXQxMHJhbyJ9.BIOYNRBr_PQCBmED-whnnA",
      additionalOptions: {
        'accessToken':
            'pk.eyJ1IjoibWF0aW1vbmRhY2EiLCJhIjoiY2toNDBmZ3ZtMDc3cDJ0cWI4ZXQxMHJhbyJ9.BIOYNRBr_PQCBmED-whnnA',
        'id': ' mapbox.mapbox-streets-v7',
      },
    );
    return FlutterMap(
      options: MapOptions(
        center: LatLng(-33.442187, -70.543300),
        maxZoom: 17,
        minZoom: 17,
        zoom: 17,
      ),
      layers: [
        tileLayerOptions,
        MarkerLayerOptions(
          markers: [
            // Ubicacion cliente
            ubicacionCliente(-33.441945, -70.544061),

            // Ubicacion de las bicicletas
            bicicletas(-33.442373, -70.542406),
            bicicletas(-33.442312, -70.542752),
            bicicletas(-33.446690, -70.543079),
            bicicletas(-33.446699, -70.543326),
            bicicletas(-33.439709, -70.548086),
            bicicletas(-33.439732, -70.547723),
            bicicletas(-33.443318, -70.543516),
            bicicletas(-33.443739, -70.543544),
            bicicletas(-33.442754, -70.543469),
            bicicletas(-33.440531, -70.541659),
            bicicletas(-33.440558, -70.541349),
          ],
        ),
      ],
    );
  }

  ///
  /// Metodos
  ///

  Marker ubicacionCliente(lat, long) {
    return Marker(
      width: 50.0,
      height: 50.0,
      point: LatLng(lat, long),
      builder: (context) => Container(
        child: Icon(
          Icons.location_history,
          color: Colors.purple,
          size: 50.0,
        ),
      ),
    );
  }

  Marker bicicletas(lat, long) {
    return Marker(
      width: 40.0,
      height: 40.0,
      point: LatLng(lat, long),
      builder: (context) => SvgPicture.asset(iconBicicleta),
    );
  }
}
