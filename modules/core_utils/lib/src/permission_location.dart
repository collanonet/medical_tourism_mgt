// Package imports:
import 'package:geolocator/geolocator.dart';

// Project imports:
import '../core_utils.dart';

Future<bool> permissionLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    logger.d('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      logger.d('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.whileInUse ||
      permission == LocationPermission.always) {
    return true;
  } else {
    return false;
  }
}
