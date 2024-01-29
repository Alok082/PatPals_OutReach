import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Api/callingapi.dart';
import '../variables.dart';

class LocationLogic {
  final BuildContext context;

  LocationLogic(this.context);

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> _showLocationServiceDialog() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Location Services'),
          content: Text('Please enable location services to use this feature.'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                // Enable location services
                await Geolocator.openLocationSettings();

                // Check if location service is now enabled

                Navigator.of(context).pop();

                // Navigator.pushNamed(context, '/Feedbygiving');

                // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // for distributor registration
  Future<void> _fetchdistributerLocation() async {
    // Get the user's current location
    position = await Geolocator.getCurrentPosition();

    double latitudes = position!.latitude;
    double Longitudes = position!.longitude;

    DonorApi.registerDistributor(Name!, mobileno!, latitudes, Longitudes);
    Future.delayed(Duration(seconds: 2));
    showCustomDialog();
  }

  Future<void> fetchPrintLocation() async {
    // Ensure location permission
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      // Fetch and print the location
      await _fetchdistributerLocation();
    } else {
      // Handle permission denial
      print('Location permission denied');
    }
  }

  //this is for enable location
  Future<void> checkLocationServiceStatus() async {
    bool serviceEnabled;

    try {
      // Check if location service is enabled
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // If not enabled, ask the user to turn on location service
        await _showLocationServiceDialog();
        return;
      }

      // Location service is enabled, navigate to 'Feedbygiving'
      selectedRole == "DONOR"
          ? Navigator.pushNamed(context, '/Feedbygiving')
          : fetchPrintLocation();
    } catch (e) {
      // Handle errors

      _showSnackbar('Error checking location service status');
    }
  }

  void showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 15, 13, 72),
            content: Text('Thanks For Becoming Volunteer',
                style: GoogleFonts.pacifico(
                  textStyle: TextStyle(color: Colors.white, fontSize: 22),
                )),
            actions: <Widget>[
              TextButton(
                child: Text('Next'),
                onPressed: () {
                  Navigator.of(context).pop();

                  Navigator.pushReplacementNamed(
                      context, '/homescreen'); // Close the dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

  // Future<void> _getCurrentPosition() async {
  //   final hasPermission = await _handleLocationPermission();
  //   if (!hasPermission) return;
  //   await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
  //       .then((Position position) {
  //     setState(() => _currentPosition = position);
  //     latitude = _currentPosition?.latitude ?? 0.0;
  //     longitude = _currentPosition?.longitude ?? 0.0;
  //   }).catchError((e) {
  //     debugPrint(e);
  //   });
  // }
 // from here we are handling location


  
  //use of location

  // Future<void> getCurrentLocation() async {
  //   try {
  //     if (!(await Geolocator.isLocationServiceEnabled())) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //           content: Text(
  //               'Location services are disabled. Please enable the services.'),
  //         ),
  //       );
  //       return;
  //     } else {
  //       LocationPermission permission = await Geolocator.requestPermission();

  //       if (permission == LocationPermission.denied) {
  //         ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
  //             content: Text(
  //                 'Location services are disabled. Please turn on the location services')));
  //         return;
  //       }

  //       // Get the user's current location
  //       position = await Geolocator.getCurrentPosition(
  //           forceAndroidLocationManager: true);

  //       Navigator.pushNamed(context, '/Feedbygiving');
  //     }
  //     // Request permission to access the device's location
  //   } catch (e) {
  //     // Handle errors
  //     ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
  //         content: Text(
  //             'Location services are disabled. Please enable the services')));
  //     return null;
  //   }
  // }
  // end of location

  //show dialog box

  //end

  //this is for taking location from user

  // Future<bool> _handleLocationPermission() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  // ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
  //     content: Text(
  //         'Location services are disabled. Please enable the services')));
  // return false;
  //   }
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       ScaffoldMessenger.of(context as BuildContext).showSnackBar(
  //           const SnackBar(content: Text('Location permissions are denied')));
  //       return false;
  //     }
  //   }
  //   if (permission == LocationPermission.deniedForever) {
  //     ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
  //         content: Text(
  //             'Location permissions are permanently denied, we cannot request permissions.')));
  //     return false;
  //   }
  //   return true;
  // }

  // void getlocationpermission() async {
  //   print("this is permission");
  //   final status = await Permission.location.request();
  //   setState(() {
  //     locationPermissionGranted = status.isGranted;
  //     print(locationPermissionGranted);
  //   });
  // }

  // location permission
