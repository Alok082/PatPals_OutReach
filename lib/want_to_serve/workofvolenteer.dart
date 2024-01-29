import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/location_logic.dart';

class workofvolenteer extends StatefulWidget {
  const workofvolenteer({
    super.key,
  });

  @override
  State<workofvolenteer> createState() => _workofvolenteerState();
}

class _workofvolenteerState extends State<workofvolenteer> {
  @override
  Widget build(BuildContext context) {
    LocationLogic locationLogic = LocationLogic(context);

    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 13, 72),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: screenheight * 1,
          width: screenwidth * 1,
          margin: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Your Work As A Volunteer',
                style: GoogleFonts.alikeAngular(
                  textStyle: TextStyle(
                    fontSize: 25.0,
                    color: Color.fromARGB(255, 121, 160, 238),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Food Collection: Volunteers collect pet food from donorshomes. They ensure that the food is in good condition and safe for consumption by street dogs.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.alikeAngular(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 255, 153, 51),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'Distribution: They distribute the collected food to animal food distributors, which can include animal shelters, rescues, or individuals who care for street dogs.',
                textAlign: TextAlign.justify,
                style: GoogleFonts.alikeAngular(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 255, 153, 51),
                  ),
                ),
              ),
              Spacer(),
              Text(
                "Communication: Volunteers effectively communicate with both donors and distributors to coordinate food pickups and deliveries. They may use the app's messaging system to facilitate this.",
                style: GoogleFonts.alikeAngular(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(255, 234, 233, 233),
                  ),
                ),
                textAlign: TextAlign.justify,
              ),
              Spacer(),
              Text(
                'Safety and Care: Volunteers handle the food with care and ensure that it is safely transported to its intended destination. They may also provide care and attention to street dogs they encounter during food distribution.',
                style: GoogleFonts.alikeAngular(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(255, 234, 233, 233),
                  ),
                ),
                textAlign: TextAlign.justify,
              ),
              Spacer(),
              Text(
                'Time Commitment: Volunteers commit their time and effort to pick up and deliver food as scheduled. Their reliability is crucial to the smooth operation of the project.',
                style: GoogleFonts.alikeAngular(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(255, 18, 136, 7),
                  ),
                ),
                textAlign: TextAlign.justify,
              ),
              Spacer(),
              Text(
                'Feedback and Reporting: They provide feedback about their experiences and report any issues or concerns to project organizers, contributing to continuous improvement.',
                style: GoogleFonts.alikeAngular(
                  textStyle: TextStyle(
                    fontSize: 16.0,
                    color: const Color.fromARGB(255, 18, 136, 7),
                  ),
                ),
                textAlign: TextAlign.justify,
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  // Navigate to the second screen when the button is pressed.
                  await locationLogic.checkLocationServiceStatus();
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
                  'Become a Volunteer',
                  style: TextStyle(color: Color.fromARGB(255, 214, 214, 214)),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
