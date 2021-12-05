import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:transport_real_time/models/bus_station.dart';
import 'package:transport_real_time/models/place.dart';
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
  List<Place> placeAutoList = [];
  Place placeSelected = Place();
  bool isShown = false;

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

  void _setPredict(String value) async {
    if (value != "" || value.isNotEmpty) {
      isShown = true;
      placeAutoList = await PlaceApi().getPlaceAutocomplete(value);
    } else {
      placeAutoList.clear();
      isShown = false;
    }

    setState(() {
      placeAutoList = placeAutoList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          markers: _markers,
          myLocationEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _setMapStyle(controller);
            _controller.complete(controller);
          },
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            searchBar(),
            isShown
                ? Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // backgroundBlendMode: BlendMode.darken,
                      color: Colors.black54,
                    ),
                    child: Center(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(10.0),
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: placeAutoList.length,
                        itemBuilder: (builder, index) {
                          // print(placeAuto[index].description);
                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                placeAutoList[index].description!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                            onTap: () {
                              print('${placeAutoList[index].place_id}');
                              _searchController.text =
                                  placeAutoList[index].description!;

                              setState(() {
                                placeSelected = placeAutoList[index];
                                isShown = false;
                              });
                            },
                          );
                        },
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }

  TextEditingController _searchController = TextEditingController();

  Widget searchBar() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(hintText: "Address, Postcode ..."),
              textCapitalization: TextCapitalization.words,
              controller: _searchController,
              autocorrect: false,
              onChanged: (value) async {
                _setPredict(value);
              },
            ),
          ),
          IconButton(
              onPressed: () async {
                if (_searchController.text.isNotEmpty) {
                  setState(() {
                    _markers.clear();
                  });
                  // List<PlaceLocation> placeList =
                  //     await PlaceApi().getPlace(_searchController.text);

                  // _goToPlace(placeList[0]);

                  Place placeDetail =
                      await PlaceApi().getPlaceDetail(placeSelected.place_id!);
                  _goToPlace(placeDetail);

                  List<Place> placeNearby =
                      await PlaceApi().getPlaceNearby(placeDetail.location!);

                  for (Place place in placeNearby) {
                    _setMaker(
                      place.location!.lat,
                      place.location!.lng,
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
      ),
    );
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(place.location!.lat, place.location!.lng), zoom: 16)));
    _setMaker(place.location!.lat, place.location!.lng, null);
  }
}
