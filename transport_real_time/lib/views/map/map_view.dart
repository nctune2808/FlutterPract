import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transport_real_time/models/place_location.dart';
import 'package:transport_real_time/services/place_api.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';
import 'package:transport_real_time/views/search/search_view.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
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

  Set<Marker> _markers = Set<Marker>();
  Set<Polygon> _polygons = Set<Polygon>();

  @override
  void initState() {
    super.initState();
    _setMaker(37.42796133580664, -122.085749655962);
  }

  void _setMaker(double lat, double lng) {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId('marker'),
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.defaultMarker,
        infoWindow:
            InfoWindow(title: '${_searchController.text.toUpperCase()}'),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBar(),
        Expanded(
          child: GoogleMap(
            mapType: MapType.normal,
            markers: _markers,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);

              print(_searchController.text);
            },
          ),
        ),
      ],
    );
  }

  TextEditingController _searchController = TextEditingController();

  Widget searchBar() {
    return Row(
      children: [
        Expanded(child: TextFormField(controller: _searchController)),
        IconButton(
            onPressed: () async {
              if (_searchController.text.isNotEmpty) {
                print(_searchController.text);
                PlaceLocation place =
                    await PlaceApi().getPlace(_searchController.text);
                _goToPlace(place);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) =>
                //         BusStationsView(lat: place.lat, lng: place.lng),
                //   ),
                // );
              }
            },
            icon: Icon(Icons.search))
      ],
    );
  }

  Future<void> _goToPlace(PlaceLocation place) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(place.lat, place.lng), zoom: 12)));
    _setMaker(place.lat, place.lng);
  }
}
