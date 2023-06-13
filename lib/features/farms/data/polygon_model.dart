import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonModel {
  final List<LatLng> polygonLatLngs;
  final Polygon polygon;

  PolygonModel({
    required this.polygonLatLngs,
    required this.polygon,
  });
}
