import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Api/callingapi.dart';
import '../variables.dart';
import 'dart:io' show Platform, Process;

class Seeevent extends StatefulWidget {
  const Seeevent({
    super.key,
  });

  @override
  State<Seeevent> createState() => _SeeeventState();
}

class _SeeeventState extends State<Seeevent> {
  String message = '';
  DonorApi _donorapi = DonorApi();

  void showMessageAndRefresh(String newMessage) {
    setState(() {
      message = newMessage;
    });

    // Show SnackBar with the message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );

    // Perform any additional actions for screen refresh here
    // ...
  }

  void initState() {
    super.initState();

    _donorapi.fetchEvents().then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height * 0.953,
        width: MediaQuery.sizeOf(context).width * 1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "photos/mainscreen/homebackground1.jpg"), // Replace with your image path
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: ListView.builder(
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];

            return Column(children: [
              if (index > 0) Divider(height: 2),
              ListTile(
                tileColor: Color.fromARGB(255, 93, 170, 234),
                title: Text(
                  event.donorName,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  'Date: ${event.donationDateTime.substring(0, 10)}\nTime: ${event.donationDateTime.substring(11, 16)}',
                  style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.delete,
                          color: Color.fromARGB(174, 255, 0, 0)),
                      onPressed: () {
                        // Implement calling function using the contact number
                        _donorapi.deleteEvent(event.eventID).then((success) {
                          setState(() {
                            events
                                .removeWhere((e) => e.eventID == event.eventID);
                          });
                          showMessageAndRefresh('Event deleted successfully');
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.call,
                          color: Color.fromARGB(255, 38, 240, 48)),
                      onPressed: () {
                        // Implement calling function using the contact number
                        _makePhoneCall(event.contactNumber);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.location_on,
                          color: Color.fromARGB(255, 10, 255, 210)),
                      onPressed: () {
                        // Implement opening Google Maps at the specified location
                        _openGoogleMaps(event.latitude, event.longitude);
                      },
                    ),
                  ],
                ),
              ),
            ]);
          },
        ),
      ),
    ));
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    print(phoneNumber);
    String url = 'tel:$phoneNumber';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      print('Could not launch $url');
    }
  }

  void _openGoogleMaps(String latitude, String longitude) async {
    print("$latitude $longitude");
    final url = 'https://www.google.com/maps?q=$latitude,$longitude';
    if (Platform.isAndroid) {
      // For Android, use dart:io launch
      await Process.run('adb', [
        'shell',
        'am',
        'start',
        'https://www.google.com/maps?q=$latitude,$longitude'
      ]);
    } else {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        print('Could not launch $url');
      }
    }
  }
}
