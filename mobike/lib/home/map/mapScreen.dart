import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MobikeMap extends StatelessWidget {
  const MobikeMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MobikeMapaBicicleta(),
    );
  }
}

class MobikeMapaBicicleta extends StatefulWidget {
  MobikeMapaBicicleta({Key key}) : super(key: key);

  @override
  _MapMobikeState createState() => _MapMobikeState();
}

class _MapMobikeState extends State<MobikeMapaBicicleta> {
  Widget appbar = Text(
    "Home",
    style: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
    ),
    textAlign: TextAlign.center,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: appbar,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            icon: Icon(Icons.person),
            color: Colors.black,
            iconSize: 30.0,
            onPressed: () {},
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              icon: Icon(Icons.settings),
              color: Colors.black,
              iconSize: 30.0,
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(-33.443, -70.544),
            zoom: 16,
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
                  width: 100.0,
                  height: 100.0,
                  point: LatLng(-33.443, -70.544),
                  builder: (ctx) => Container(
                    child: Icon(
                      Icons.location_pin,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.search),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
