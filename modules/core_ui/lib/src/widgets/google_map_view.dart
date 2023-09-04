import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapView extends StatelessWidget {
  const GoogleMapView({
    super.key,
    this.onTap,
    required this.initialCameraPosition,
    this.onMapCreated,
    this.markers = const <Marker>{},
  });

  final Set<Marker> markers;
  final Function(LatLng)? onTap;
  final CameraPosition initialCameraPosition;
  final Function(GoogleMapController)? onMapCreated;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      scrollGesturesEnabled: true,
      markers: markers,
      onTap: onTap,
      initialCameraPosition: initialCameraPosition,
      onMapCreated: onMapCreated,
    );
  }
}
