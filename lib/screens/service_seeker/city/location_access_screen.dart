import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:homeapp/core/constants/app_images.dart';
import '../../../widgets/custom_button.dart';
import '../../service_provider/all_service_provider_screen.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  GoogleMapController? _mapController;

  final TextEditingController _searchController = TextEditingController();
  Marker? _currentLocationMarker;
  bool _showWrongButton = false;
  bool _showImageMap = false;

  //
  // List<Marker> _marker=<Marker>[
  //   Marker(markerId: markerId)
  // ];

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
        // GoogleMapController controller = await _controller
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
                    onPressed: () async {
                      if (_showWrongButton) {
                        _searchController.clear();
                      } else {
                        // First request permission and get location
                        LocationPermission permission =
                            await Geolocator.checkPermission();
                        if (permission == LocationPermission.denied ||
                            permission == LocationPermission.deniedForever) {
                          permission = await Geolocator.requestPermission();
                        }

                        if (permission == LocationPermission.always ||
                            permission == LocationPermission.whileInUse) {
                          setState(() {
                            _showImageMap = true; // Now show CityImageScreen
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Location permission denied')),
                          );
                        }
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
  Position? _currentPosition;
  GoogleMapController? _mapController;

  final List<String> _images = [
    AppImages.mapImgOne,
    AppImages.mapImgTwo,
    AppImages.mapImgThree,
    AppImages.mapImgFour,
    AppImages.mapImgFive,
    AppImages.mapImgSix,
  ];

  final List<LatLng> _latlng = [
    LatLng(24.0271, 72.3850),
    LatLng(26.2389, 73.0243),
    LatLng(23.5880, 72.3693),
    LatLng(24.2585, 72.1907),
    LatLng(24.0906, 72.3947),
    LatLng(23.8500, 72.1210),
  ];

  final List<Marker> _marker = [];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.172, 72.4346),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    _showLocationPermissionDialog();
    loadData();
  }

  void _showLocationPermissionDialog() async {
    await Future.delayed(Duration.zero); // Wait for build

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Location Permission'),
        content: Text('Allow Fixit to access your location?'),
        actions: [
          TextButton(
            child: Text('Don\'t Allow'),
            onPressed: () {
              Navigator.pop(context);
              _showDeniedMessage();
            },
          ),
          TextButton(
            child: Text('Allow Once'),
            onPressed: () {
              Navigator.pop(context);
              _getLocation(temporary: true);
            },
          ),
          TextButton(
            child: Text('Allow While Using Fixit'),
            onPressed: () {
              Navigator.pop(context);
              _getLocation(temporary: false);
            },
          ),
        ],
      ),
    );
  }

  void _getLocation({required bool temporary}) async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      _currentPosition = await Geolocator.getCurrentPosition();
      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            zoom: 16,
          ),
        ),
      );

      setState(() {
        _marker.add(
          Marker(
            markerId: MarkerId("userLocation"),
            position:
                LatLng(_currentPosition!.latitude, _currentPosition!.longitude),
            infoWindow: InfoWindow(title: "Your Location"),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueAzure),
          ),
        );
      });

      print("Location: $_currentPosition");

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Location: ${_currentPosition!.latitude}, ${_currentPosition!.longitude}')),
      );
    } else {
      _showDeniedMessage();
    }
  }

  void _showDeniedMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content:
              Text('Location permission denied.')),
    );
  }

  void loadData() async {
    for (int i = 0; i < _images.length; i++) {
      final bitMapDescriptor = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(
          size: Size(150, 150),
          devicePixelRatio: 2.5,
        ),
        _images[i],
      );
      _marker.add(
        Marker(
          icon: bitMapDescriptor,
          markerId: MarkerId(i.toString()),
          position: _latlng[i],
          infoWindow: InfoWindow(title: "", snippet: ""),
        ),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              mapType: MapType.normal,
              markers: Set<Marker>.of(_marker),
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
                setState(() {});
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
