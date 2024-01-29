// // import 'dart:js';

// import 'package:flutter/material.dart';
// // import 'package:location/location.dart' hide LocationAccuracy;
// // import 'package:permission_handler/permission_handler.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:petpals_outreach/variables.dart';

// // Future<void> requestLocationPermission() async {
// //   final status = await Permission.location.request();
// //   if (status.isGranted) {
// //     // You have permission to access the location.
// //     captureLocation();
// //   } else {
// //     // The user denied or didn't grant permission.
// //   }
// // }

// // Future<void> captureLocation() async {
// //   final location = Location();
// //   try {
// //     final currentLocation = await location.getLocation();
// //     // Store the location information (latitude and longitude) in your desired data structure or database.
    // double latitude = currentLocation.latitude ?? 0.0;
    // double longitude = currentLocation.longitude ?? 0.0;
    // print("this is $latitude");
    // print("this is $longitude");
// //   } catch (e) {
// //     // Handle any errors that occur when trying to capture the location.
// //   }
// // }

// class location extends StatefulWidget {
//   const location({super.key});

//   @override
//   State<location> createState() => locationState();
// }

// class locationState extends State<location> {
//   void initState() {
//     super.initState();
//     setState(() {
//       _getCurrentPosition();
//     });
//   }

//   void storelocation() {
//     print("updated");
//     Longitude = _currentPosition?.longitude ?? "";
//     latitude = _currentPosition?.latitude ?? "";
//   }

//   String? _currentAddress;
//   Position? _currentPosition;
//   Future<void> _getCurrentPosition() async {
//     // final hasPermission = await _handleLocationPermission();
//     // if (!locationPermissionGranted) return;
//     await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
//         .then((Position position) {
//       setState(() {
//         _currentPosition = position;
//         storelocation();
//       });
//     }).catchError((e) {
//       debugPrint(e);
//     });
//   }

//   // Future<bool> _handleLocationPermission() async {
//   //   bool serviceEnabled;
//   //   LocationPermission permission;

//   //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   //   if (!serviceEnabled) {
//   //     ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
//   //         content: Text(
//   //             'Location services are disabled. Please enable the services')));
//   //     return false;
//   //   }
//   //   permission = await Geolocator.checkPermission();
//   //   if (permission == LocationPermission.denied) {
//   //     permission = await Geolocator.requestPermission();
//   //     if (permission == LocationPermission.denied) {
//   //       ScaffoldMessenger.of(context as BuildContext).showSnackBar(
//   //           const SnackBar(content: Text('Location permissions are denied')));
//   //       return false;
//   //     }
//   //   }
//   //   if (permission == LocationPermission.deniedForever) {
//   //     ScaffoldMessenger.of(context as BuildContext).showSnackBar(const SnackBar(
//   //         content: Text(
//   //             'Location permissions are permanently denied, we cannot request permissions.')));
//   //     return false;
//   //   }
//   //   return true;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: const Color.fromARGB(255, 161, 183, 202),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('LAT: ${Longitude}'),
//           Text('LNG: ${latitude}'),
//           Text('ADDRESS: ${_currentAddress ?? ""}'),
//           const SizedBox(height: 32),
//         ],
//       ),
//     );
//   }
// }

// garbage of homescreen
  // const SizedBox(
              //     height: 16), // Space between paragraphs and containers
              // 6 containers in pairs of two
              // Row(
              //   children: [
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           getlocationpermission();
              //           if (locationPermissionGranted) {
              //             // Navigate to another page when permission is granted
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => Feedbygiving(
              //                   title: 'f',
              //                 ),
              //               ),
              //             );
              //           } else
              //             (locationPermissionGranted) {
              //               ScaffoldMessenger.of(context as BuildContext)
              //                   .showSnackBar(const SnackBar(
              //                       content: Text(
              //                           'Location services are disabled. Please enable the services')));
              //             };
              //         },
              //         child: Container(
              //           margin: const EdgeInsets.all(8),
              //           height: 100,
              //           decoration: BoxDecoration(
              //             color: Color.fromARGB(255, 15, 13, 72),
              //             borderRadius: BorderRadius.circular(12),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey, // Shadow color
              //                 offset: Offset(
              //                     0, 2), // Offset from the top-left corner
              //                 blurRadius: 10, // Spread radius of the shadow
              //                 spreadRadius: 1, // How far the shadow extends
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               const Image(
              //                 image: AssetImage(
              //                     "photos/buttonicons/donatefood.png"),
              //                 height: 40,
              //                 width: 40,
              //                 color: Colors.blue,
              //                 fit: BoxFit.cover,
              //               ),
              //               Text(
              //                 "Feed By Giving",
              //                 style: const TextStyle(
              //                   color: Color.fromARGB(255, 252, 252, 252),
              //                   fontSize: 20,
              //                   fontWeight: FontWeight.bold,
              //                   textBaseline: TextBaseline.ideographic,
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: InkWell(
              //         onTap: () {
              //           getlocationpermission();
              //           if (locationPermissionGranted) {
              //             // Navigate to another page when permission is granted
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => workofvolenteer(
              //                   title: 'f',
              //                 ),
              //               ),
              //             );
              //           } else
              //             (locationPermissionGranted) {
              //               ScaffoldMessenger.of(context as BuildContext)
              //                   .showSnackBar(const SnackBar(
              //                       content: Text(
              //                           'Location services are disabled. Please enable the services')));
              //             };
              //         },
              //         child: Container(
              //           margin: const EdgeInsets.all(8),
              //           height: 100,
              //           decoration: BoxDecoration(
              //             color: Color.fromARGB(255, 15, 13, 72),
              //             borderRadius: BorderRadius.circular(12),
              //             boxShadow: [
              //               BoxShadow(
              //                 color: Colors.grey, // Shadow color
              //                 offset: Offset(
              //                     0, 2), // Offset from the top-left corner
              //                 blurRadius: 10, // Spread radius of the shadow
              //                 spreadRadius: 1, // How far the shadow extends
              //               ),
              //             ],
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             children: [
              //               const Image(
              //                 image: AssetImage(
              //                     "photos/buttonicons/servefood.png"),
              //                 color: Colors.blue,
              //                 height: 40,
              //                 width: 40,
              //                 fit: BoxFit.cover,
              //               ),
              //               Text(
              //                 "Want To Serve",
              //                 style: const TextStyle(
              //                   color: Color.fromARGB(255, 252, 252, 252),
              //                   fontSize: 20,
              //                   fontWeight: FontWeight.bold,
              //                   textBaseline: TextBaseline.ideographic,
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),

              // Row(
              //   children: [
              // Expanded(
              //   child: Container(
              //     margin: const EdgeInsets.all(8),
              //     height: 100,
              //     decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 15, 13, 72),
              //       borderRadius: BorderRadius.circular(12),
              //       boxShadow: [
              //         BoxShadow(
              //           color: Colors.grey, // Shadow color
              //           offset: Offset(
              //               0, 2), // Offset from the top-left corner
              //           blurRadius: 10, // Spread radius of the shadow
              //           spreadRadius: 1, // How far the shadow extends
              //         ),
              //       ],
              //     ),
              //     child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         const Image(
              //           image: AssetImage("photos/buttonicons/work.png"),
              //           height: 40,
              //           width: 40,
              //           color: Colors.blue,
              //           fit: BoxFit.cover,
              //         ),
              //         Text(
              //           "Our Work",
              //           style: const TextStyle(
              //             color: Color.fromARGB(255, 252, 252, 252),
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             textBaseline: TextBaseline.ideographic,
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              //     Expanded(
              //       child: Container(
              //         margin: const EdgeInsets.all(8),
              //         height: 100,
              //         decoration: BoxDecoration(
              //           color: Color.fromARGB(255, 15, 13, 72),
              //           borderRadius: BorderRadius.circular(12),
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey, // Shadow color
              //               offset: Offset(
              //                   0, 2), // Offset from the top-left corner
              //               blurRadius: 10, // Spread radius of the shadow
              //               spreadRadius: 1, // How far the shadow extends
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             const Image(
              //               image: AssetImage(
              //                   "photos/buttonicons/our_stars.png"),
              //               height: 40,
              //               width: 40,
              //               color: Colors.blue,
              //               fit: BoxFit.cover,
              //             ),
              //             Text(
              //               "Our Stars",
              //               style: const TextStyle(
              //                 color: Color.fromARGB(255, 252, 252, 252),
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.bold,
              //                 textBaseline: TextBaseline.ideographic,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         margin: const EdgeInsets.all(8),
              //         height: 100,
              //         decoration: BoxDecoration(
              //           color: Color.fromARGB(255, 15, 13, 72),
              //           borderRadius: BorderRadius.circular(12),
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey, // Shadow color
              //               offset: Offset(
              //                   0, 2), // Offset from the top-left corner
              //               blurRadius: 10, // Spread radius of the shadow
              //               spreadRadius: 1, // How far the shadow extends
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             const Image(
              //               image: AssetImage(
              //                   "photos/buttonicons/contribution.png"),
              //               height: 40,
              //               width: 40,
              //               color: Colors.blue,
              //               fit: BoxFit.cover,
              //             ),
              //             Text(
              //               "Contribute Us",
              //               style: const TextStyle(
              //                 color: Color.fromARGB(255, 252, 252, 252),
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.bold,
              //                 textBaseline: TextBaseline.ideographic,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: Container(
              //         margin: const EdgeInsets.all(8),
              //         height: 100,
              //         decoration: BoxDecoration(
              //           color: Color.fromARGB(255, 15, 13, 72),
              //           borderRadius: BorderRadius.circular(12),
              //           boxShadow: [
              //             BoxShadow(
              //               color: Colors.grey, // Shadow color
              //               offset: Offset(
              //                   0, 2), // Offset from the top-left corner
              //               blurRadius: 10, // Spread radius of the shadow
              //               spreadRadius: 1, // How far the shadow extends
              //             ),
              //           ],
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             Icon(
              //               Icons.group,
              //               weight: 40,
              //               size: 40,
              //               color: Colors.blue,
              //             ),
              //             // const Image(
              //             //   image: AssetImage("photos/give-food.png"),
              //             // height: 40,
              //             // width: 40,
              //             //   fit: BoxFit.cover,
              //             // ),
              //             Text(
              //               "About Us",
              //               style: const TextStyle(
              //                 color: Color.fromARGB(255, 252, 252, 252),
              //                 fontSize: 20,
              //                 fontWeight: FontWeight.bold,
              //                 textBaseline: TextBaseline.ideographic,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              
