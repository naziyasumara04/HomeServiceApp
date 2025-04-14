import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import '../../../widgets/custom_button.dart';
import '../../service_provider/all_service_provider_screen.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {

  GoogleMapController? _mapController;
  TextEditingController _searchController = TextEditingController();
  Marker? _currentLocationMarker;
  bool _showWrongButton = false;
  bool _showImageMap = false;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _showWrongButton = _searchController.text.isNotEmpty;
      });
    });
  }

  void _searchLocation(String query) async {
    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        LatLng newPosition = LatLng(location.latitude, location.longitude);

        // Move camera to searched location
        _mapController
            ?.animateCamera(CameraUpdate.newLatLngZoom(newPosition, 15));

        // Update marker
        setState(() {
          _currentLocationMarker = Marker(
            markerId: MarkerId('searchedLocation'),
            position: newPosition,
            infoWindow: InfoWindow(title: query),
          );
        });
      }
    } catch (e) {
      print("Location not found: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location not found")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          _showImageMap
              ? CityImageScreen()
              : Container(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    100,
                    20,
                    0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers: _currentLocationMarker != null
                        ? {_currentLocationMarker!}
                        : {},
                    initialCameraPosition:
                        CameraPosition(target: LatLng(20.00, 78.00), zoom: 5),
                    onMapCreated: (GoogleMapController controller) {
                      _mapController = controller;
                    },
                  ),
                ),
          Positioned(
            top: 40,
            left: 15,
            right: 15,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
              ),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search location",
                  border: InputBorder.none,
                  suffixIcon: IconButton(
                    onPressed: () {
                      if (_showWrongButton) {
                        _searchController
                            .clear(); // Clear input when "wrong" button is pressed
                      } else {
                        setState(() {
                          _showImageMap = true;
                        });
                      }
                    },
                    icon: Icon(
                        _showWrongButton ? Icons.close : Icons.my_location),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => _searchLocation(_searchController.text),
                  ),
                ),
                onSubmitted: (value) => _searchLocation(value),
              ),
            ),
          ),
        ],
      ),
    );
  }

}


class CityImageScreen extends StatefulWidget {
  const CityImageScreen({super.key});

  @override
  State<CityImageScreen> createState() => _CityImageScreenState();
}

class _CityImageScreenState extends State<CityImageScreen> {
  GoogleMapController? _controller;

  // Marker? _Locationmarker;
  Set<Marker> markers = {};
  CameraPosition? _initialPosition;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    markers.add(
      Marker(
        markerId: MarkerId('Chhapi'),
        position: LatLng(21.5233, 72.7905),
        infoWindow: InfoWindow(title: 'Chhapi, Gujarat'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(
            20,
            100,
            20,
            0,
          ),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          height: 650,
          child: GoogleMap(
              mapType: MapType.terrain,
              initialCameraPosition: _kGooglePlex,
              markers: markers,
              onMapCreated: (GoogleMapController mapController) {
                setState(() {
                  _controller = mapController;
                });
              }),
        ),
        SizedBox(
          height: 30.h,
        ),
        CustomButton(
          btnText: 'View All',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AllServiceProviderScreen()));
          },
        ),
      ],
    );
  }
}
