import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUtils {
  MapUtils._();

  static const double kZoomLevel = 10.151926040649414;
  static const double kZoomLevelSearch = 16.151926040649414;
  static const double kTilt = 59.440717697143555;
  static const double kBearing = 192.8334901395799;

  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  static const cameraPosition = CameraPosition(
    bearing: kBearing,
    target: LatLng(37.42796133580664, -122.085749655962),
    tilt: kTilt,
    zoom: kZoomLevel,
  );
}
