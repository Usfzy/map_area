import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nirsalfo/core/utils/map_utils.dart';

import '../../../core/utils/size_utils.dart';
import '../../../widgets/custom_button.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    super.key,
  });

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
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

    _gotoCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalSize(600),
      margin: getMargin(top: 19),
      child: Column(
        children: [
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
          CustomButton(
            height: getVerticalSize(44),
            text: 'Reset ',
            margin: getMargin(top: 19),
            variant: ButtonVariant.tertiary,
            fontStyle: ButtonFontStyle.interRegular14,
            onTap: _onResetTap,
          ),
          CustomButton(
            height: getVerticalSize(44),
            text: 'Save',
            margin: getMargin(top: 16),
            onTap: _onSaveTap,
          ),
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    _googleMapController.complete(controller);
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

  void _onResetTap() {
    _markers.clear();
    _polygons.clear();

    polygonLatLngs.clear();
    _polygonsLatLngList.clear();
    counter = 0;
    setState(() {});
  }
}
