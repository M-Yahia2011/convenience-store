import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShippingAddressScreen extends StatefulWidget {
  static const String routeName = "/shipping-address";

  const ShippingAddressScreen({Key? key}) : super(key: key);

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  double latitude = 0;
  double longitude = 0;
  Position? position;
   GoogleMapController? mapController;
  Marker? marker;
  void checkPermissions() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location Service is not enabled");
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permision is denied");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permision is denied permenantly");
    }
    position = await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    checkPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pick your loaction")),
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: const CameraPosition(
              target: LatLng(31, 30),
              // zoom: 12,
            ),
            onLongPress: (position) {
              latitude = position.latitude;
              longitude = latitude;
              marker = Marker(
                markerId: const MarkerId('current_location'),
                position: position,
              );
              setState(() {});
            },
            markers: marker != null ? <Marker>{marker!} : {},
            compassEnabled: true,
            onMapCreated: (controller) {
              mapController = controller;
            },
          ),
          const Positioned(
              top: 20,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "Long press to set your location",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () async {},
                  icon: const Icon(Icons.location_on),
                  label: marker == null
                      ? const Text(
                          "Save Current Location",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        )
                      : const Text("Save Pinned Location")),
            ),
          ),
        ],
      ),
    );
  }
}
