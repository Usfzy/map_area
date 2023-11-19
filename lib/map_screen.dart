import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:nirsalfo/core/extensions.dart';

import 'add_farm_model.dart';
import 'core/map_utils.dart';
import 'farm_details_model.dart' show Farm;

class MapScreen extends StatefulWidget {
  static const String routeName = 'map_screen';

  final Farm? farm;
  const MapScreen({super.key, this.farm});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _googleMapController = Completer<GoogleMapController>();

  final _markers = <Marker>{};
  final _polygons = <Polygon>{};

  final polygonLatLngs = <LatLng>[];
  final _polygonsLatLngList = <List<LatLng>>[];

  int _polygonIdCounter = 1;
  int _markerIdCounter = 1;

  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      margin: EdgeInsets.only(top: 19),
      child: Column(
        children: [
          // PlacesAutoCompleteTextField(onPlacesItemClick: _onPlacesItemClick),
          Expanded(
            child: GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: MapUtils.cameraPosition,
              onMapCreated: _onMapCreated,
              zoomControlsEnabled: false,
              onTap: _onGoogleMapTap,
              markers: _markers,
              polygons: _polygons,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{}
                ..add(
                  Factory<PanGestureRecognizer>(
                    () => PanGestureRecognizer(),
                  ),
                ),
            ),
          ),
          ElevatedButton(
            onPressed: _onResetTap,
            child: const Text('reset'),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _onSaveTap,
                  child: const Text('save'),
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: _onSaveExitTap,
                  child: Text('Save Exit'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onPlacesItemClick(Prediction prediction) {
    final lat = prediction.lat;
    final lng = prediction.lng;

    if (lat == null || lng == null) return;

    _gotoLocation(double.parse(lat), double.parse(lng));
  }

  void _onMapCreated(GoogleMapController controller) async {
    _googleMapController.complete(controller);

    _loadFarmPolygons();
    _gotoCurrentLocation();
  }

  void _loadFarmPolygons() {
    if (widget.farm == null || widget.farm?.map == null) return;

    for (var e in widget.farm!.map!) {
      _polygons.add(
        Polygon(
          polygonId: PolygonId(e.polygonId!),
          strokeWidth: 2,
          strokeColor: Colors.yellow,
          fillColor: Colors.yellow.withOpacity(0.15),
          points: e.points!.map((e) {
            return LatLng(double.parse(e.lat!), double.parse(e.long!));
          }).toList(),
        ),
      );
    }

    setState(() {});
  }

  void _onGoogleMapTap(LatLng point) {
    _setPolygon(point);
    _setMarkers(point);
  }

  void _setMarkers(LatLng point) {
    final marker = Marker(
      markerId: MarkerId('${++_markerIdCounter}'),
      position: point,
    );
    _markers.add(marker);
    setState(() {});
  }

  void _setPolygon(LatLng point) {
    polygonLatLngs.add(point);
    _polygonsLatLngList.insert(counter, [...polygonLatLngs]);

    _polygons.add(
      Polygon(
        polygonId: PolygonId('${++_polygonIdCounter}'),
        points: _polygonsLatLngList[counter],
        strokeWidth: 2,
        strokeColor: Colors.yellow,
        fillColor: Colors.yellow.withOpacity(0.15),
      ),
    );
  }

  Future<void> _gotoCurrentLocation() async {
    final position = await MapUtils.getCurrentLocation();
    await _gotoLocation(position.latitude, position.longitude);
  }

  Future<void> _gotoLocation(double lat, double lng) async {
    final controller = await _googleMapController.future;

    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          // bearing: MapUtils.kBearing,
          // tilt: MapUtils.kTilt,
          zoom: MapUtils.kZoomLevelSearch,
          target: LatLng(lat, lng),
        ),
      ),
    );
  }

  void _onSaveTap() {
    _markers.clear();
    polygonLatLngs.clear();

    counter++;

    setState(() {});
  }

  void _onSaveExitTap() {
    final mapElements = _polygons
        .map(
          (element) => AddMapElement(
            polygonId: element.polygonId.value,
            points: element.points
                .map((e) => Point(lat: '${e.latitude}', long: '${e.longitude}'))
                .toList(),
          ),
        )
        .toList();

    context.pop(mapElements);
  }

  void _onResetTap() {
    _markers.clear();
    _polygons.clear();

    polygonLatLngs.clear();
    _polygonsLatLngList.clear();
    counter = 0;
    setState(() {});
  }
}
