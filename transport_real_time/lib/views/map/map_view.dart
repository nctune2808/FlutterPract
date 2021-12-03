import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transport_real_time/models/bus_station.dart';
import 'package:transport_real_time/models/place_location.dart';
import 'package:transport_real_time/services/bus_api.dart';
import 'package:transport_real_time/services/place_api.dart';

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
  int counter = 0;

  @override
  void initState() {
    super.initState();
    _setMaker(37.42796133580664, -122.085749655962, null);
  }

  void _setMaker(double lat, double lng, BitmapDescriptor? icon) {
    setState(() {
      counter++;
      final String markerId = 'marker_${counter}';

      _markers.add(Marker(
        markerId: MarkerId(markerId),
        position: LatLng(lat, lng),
        icon: icon ?? BitmapDescriptor.defaultMarker,
        infoWindow:
            InfoWindow(title: '${_searchController.text.toUpperCase()}'),
      ));
    });
  }

  void _setMapStyle(GoogleMapController controller) async {
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    controller.setMapStyle(value);
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
            myLocationEnabled: true,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _setMapStyle(controller);
              _controller.complete(controller);
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
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(hintText: "Address, Postcode ..."),
            textCapitalization: TextCapitalization.words,
            controller: _searchController,
            autocorrect: false,
          ),
        ),
        IconButton(
            onPressed: () async {
              if (_searchController.text.isNotEmpty) {
                setState(() {
                  _markers.clear();
                });
                List<PlaceLocation> placeList =
                    await PlaceApi().getPlace(_searchController.text);

                _goToPlace(placeList[0]);
                for (PlaceLocation place in placeList) {
                  print(place);
                  _setMaker(
                    place.lat,
                    place.lng,
                    BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueAzure),
                  );
                }

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
        CameraPosition(target: LatLng(place.lat, place.lng), zoom: 16)));
    _setMaker(place.lat, place.lng,
        BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));
  }
}
