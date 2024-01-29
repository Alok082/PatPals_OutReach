import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Api/callingapi.dart';
import '../variables.dart';

class ourStars extends StatefulWidget {
  const ourStars({
    super.key,
  });

  @override
  State<ourStars> createState() => _ourStarsState();
}

class _ourStarsState extends State<ourStars> {
  DonorApi _donorapis = DonorApi();
  void initState() {
    super.initState();
    _donorapis.fetchEvents();
    setState(() {});
  }

  // List<String> names = [
  //   "shivam",
  //   "Aadesh",
  //   "Alok",
  //   "Avinash",
  //   "Aditya",
  //   "Akash",
  //   "Ritik",
  //   "Raj",
  //   "Ajay",
  //   "Fulchand",
  //   "Chetan",
  //   "Rajat",
  //   "Ajay",
  //   "Akshat",
  //   "Samarth"
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      "photos/mainscreen/homebackground1.jpg"), // Replace with your image path
                  fit: BoxFit.cover, // Adjust the fit as needed
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rank',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 21),
                  ),
                  Text(
                    '     Name',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 21),
                  ),
                  Text(
                    'Donation',
                    style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 21),
                  ),
                ],
              ),
            ),
          ),
          // backgroundColor: const Color.fromARGB(255, 15, 13, 72),
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
              itemCount: events.length, // 1 heading + 10 items
              itemBuilder: (context, index) {
                final event = events[index];
                // Subsequent items
                int rank = index;
                // String name = names[Random().nextInt(names.length)];
                int donation = Random().nextInt(100);

                return Column(
                  children: [
                    ListTile(
                      textColor: Colors.white,
                      horizontalTitleGap: BorderSide.strokeAlignInside,
                      shape: CircleBorder(),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('    $rank'),
                          Text(event.donorName),
                          Text('$donation'),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          )),
    );
  }
}
