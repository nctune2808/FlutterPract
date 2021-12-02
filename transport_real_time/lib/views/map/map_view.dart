import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:transport_real_time/views/search/search_view.dart';

class MapView extends StatelessWidget {
  MapView({Key? key}) : super(key: key);

  Completer<GoogleMapController> _controller = Completer();

  static final Marker _markerGG = Marker(
    markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position: LatLng(37.42796133580664, -122.085749655962),
  );

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final Marker _markerLK = Marker(
    markerId: MarkerId('_LAKE'),
    infoWindow: InfoWindow(title: 'LAKE'),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    position: LatLng(37.43296265331129, -122.08832357078792),
  );
  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  // ---

  static final Polyline _polyline = Polyline(
    polylineId: PolylineId('_polyline'),
    points: [
      _markerGG.position,
      _markerLK.position,
    ],
    width: 5,
  );

  static final Polygon _polygon =
      Polygon(polygonId: PolygonId('_polygon'), points: [], strokeWidth: 5);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GoogleMap(
        mapType: MapType.normal,
        markers: {_markerGG, _markerLK},
        polylines: {_polyline},
        polygons: {_polygon},
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
