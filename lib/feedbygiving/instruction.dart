import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import '../Api/callingapi.dart';
import '../screens/homescreen.dart';
import '../variables.dart';

class Feedbygiving extends StatefulWidget {
  const Feedbygiving({
    super.key,
  });

  @override
  State<Feedbygiving> createState() => _FeedbygivingState();
}

class _FeedbygivingState extends State<Feedbygiving> {
  DateTime now = DateTime.now();
  void initState() {
    super.initState();
    setState(() {
      isProcessing = false;
      formattedDateTime = now.toLocal().toString();
    });
  }

  Future<void> _fetchLocation() async {
    // Get the user's current location
    position = await Geolocator.getCurrentPosition();
    setState(() {
      latitude = position!.latitude;
      Longitude = position!.longitude;
    });
    DonorApi.registerEvent(
      Donorid,
      Name!,
      formattedDateTime,
      mobileno!,
      latitude!,
      Longitude!,
    );
    isProcessing
        ? CircularProgressIndicator(
            color: Colors.black,
          )
        : showCustomDialog();
  }

  Future<void> fetchAndPrintLocation() async {
    // Ensure location permission
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      // Fetch and print the location
      await _fetchLocation();
    } else {
      // Handle permission denial
      print('Location permission denied');
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.sizeOf(context).height;
    var screenwidth = MediaQuery.sizeOf(context).width;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: screenheight * 1,
          width: screenwidth * 1,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  "photos/mainscreen/homebackground1.jpg"), // Replace with your image path
              fit: BoxFit.cover, // You can adjust the fit as needed
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage("photos/frame1/foodrestriction.jpg"),
                  height: screenheight * 0.70,
                  width: screenwidth * 0.97,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: screenheight * 0.02,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Navigate to the second screen when the button is pressed.
                  fetchAndPrintLocation();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color.fromARGB(
                      255, 15, 13, 72), // Text color of the button
                  padding: const EdgeInsets.all(
                      16), // Padding around the button's content
                  textStyle: const TextStyle(
                    fontSize: 15, // Text size
                    fontWeight: FontWeight.bold, // Text weight
                  ),
                  elevation: 8, // Elevation (shadow) of the button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Button shape
                  ),
                ),
                child: const Text(
                  'Donate Your Food',
                  style: TextStyle(color: Color.fromARGB(255, 214, 214, 214)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showCustomDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 15, 13, 72),
            content: Text('Thanks For Donating We Will Reach You Shortly',
                style: GoogleFonts.pacifico(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 26),
                )),
            actions: <Widget>[
              TextButton(
                child: Text('Done',
                    style: GoogleFonts.pacifico(
                      textStyle: const TextStyle(
                          color: Color.fromARGB(255, 150, 118, 192),
                          fontSize: 22),
                    )),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                  ); // Close the dialog
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
