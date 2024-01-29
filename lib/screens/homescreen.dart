import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:petpals_outreach/Api/callingapi.dart';
import 'package:petpals_outreach/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'location_logic.dart';

bool locationpermission = false;

class Homescreen extends StatefulWidget {
  const Homescreen({
    super.key,
  });

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();
  }

  // logout
  Future<void> logoutfun() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('authToken');
  }

  // array declarations
  List<String> imageList = [
    'photos/mainscreen/feedthestreetdog.jpg',
    'photos/mainscreen/dog1.jpeg',

    'photos/mainscreen/dog5.jpeg',

    // Add more asset paths for your images
  ];
  List<String> buttonName = [
    selectedRole == "DONOR" ? "Feed By Giving" : "Want To Serve",
    "Our Work",
    "Our Stars",
    "About Us"
  ];
  List<String> buttonicon = [
    selectedRole == "DONOR"
        ? "photos/buttonicons/donatefood.png"
        : "photos/buttonicons/servefood.png",
    "photos/buttonicons/work.png",
    "photos/buttonicons/our_stars.png",
  ];

  @override
  Widget build(BuildContext context) {
    LocationLogic locationLogic = LocationLogic(context);
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar:
        // ConvexAppBar(
        //   style: TabStyle.react,
        //   color: const Color.fromARGB(255, 15, 13, 72),
        // backgroundColor: const Color.fromARGB(255, 15, 13, 72),
        //   elevation: 5,
        //   shadowColor: Colors.white,
        //   items: [
        //     TabItem(
        //       icon: IconButton(
        //         onPressed: () {},
        //         icon: Icon(Icons.supervised_user_circle),
        //       ),
        //       title: "Change Profile",
        //     )
        //   ],
        //   initialActiveIndex: 0,
        //   onTap: (index) => {
        //     print("this is function"),
        //   },
        // ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenheight * 0.35),
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    "photos/splashscreen/splashlogo.png"), // Replace with your image path
                fit: BoxFit.cover, // You can adjust the fit as needed
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 4,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: CarouselSlider.builder(
              itemCount: imageList.length,
              options: CarouselOptions(
                height: screenheight * 0.27,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,

                // Other customization options can be added here.
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Container(
                    margin: const EdgeInsets.all(25),
                    height: screenheight * 0.29,
                    width: screenwidth * 0.85,

                    // color: Colors.white,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        // color: Colors.blue, // Background color
                        border: Border.all(
                          color: const Color.fromARGB(
                              255, 214, 212, 212), // Border color
                          width: 2.0, // Border width
                        )),
                    child: ClipRRect(
                      // Clip the child to a rectangular shape
                      borderRadius: BorderRadius.circular(
                          12), // Set a radius of 0 for a rectangular shape
                      child: Image(
                        image: AssetImage(imageList[index]),
                        fit: BoxFit.cover, // or another BoxFit value
                      ),
                    ));
              },
            ),
          ),
        ),
        floatingActionButton: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(
                    255, 227, 231, 234), // Set your desired shadow color here
                blurRadius: 10.0,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: FloatingActionButton(
            elevation: 5,
            tooltip: 'Change your Profile',
            splashColor: Colors.green,
            backgroundColor: const Color.fromARGB(255, 15, 13, 72),
            onPressed: () {
              // Add the action you want to perform when the FAB is pressed
              logoutfun();
              Navigator.pushReplacementNamed(context, '/askname');
            },
            child: Icon(
              Icons.logout,
              color: const Color.fromARGB(255, 231, 228, 228),
            ),
          ),
        ),
        // closing of app bar
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
              Container(
                padding: EdgeInsets.all(screenheight * 0.02),
                child: const Text(
                  "Feeding dogs is an act of compassion and responsibility. It goes beyond nourishing their bodies; it nourishes the bond between humans and our loyal canine companions. By providing food, we not only satisfy their hunger but also express our love and commitment to their well-being, strengthening the unbreakable connection between us.",
                  style: TextStyle(
                      color: Color.fromARGB(255, 232, 223, 255),
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
              ),
              // description ended here
              SizedBox(
                height: screenheight * 0.42,
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // Number of columns
                    crossAxisSpacing: 8.0, // Spacing between columns
                    mainAxisSpacing: 8.0, // Spacing between rows
                    childAspectRatio: 3.9,
                  ),
                  itemCount: 4, // Number of items in the grid
                  itemBuilder: (BuildContext context, int index) {
                    // if (index == 4) {
                    //   // Last container spanning two columns
                    //   return Container(
                    //     width: 200,
                    //     height: 100.0, // Adjust the height as needed
                    //     color: Colors.blue,
                    //     alignment: Alignment.center,
                    //     child: Text('Last Container'),
                    //   );
                    // }
                    return GestureDetector(
                      onTap: () {
                        if (index == 0 && selectedRole == "DONOR") {
                          locationLogic.checkLocationServiceStatus();
                        } else if (index == 0 && selectedRole == "VOLUNTEER") {
                          Navigator.pushNamed(context, '/Seeevent');
                        } else if (index == 1) {
                          Navigator.pushNamed(context, '/ourworkpage');
                        } else if (index == 2) {
                          Navigator.pushNamed(context, '/ourStars');
                        } else if (index == 3) {}
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        // height: 70,
                        // width: 30,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 15, 13, 72),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey, // Shadow color
                              offset: Offset(
                                  0, 2), // Offset from the top-left corner
                              blurRadius: 10, // Spread radius of the shadow
                              spreadRadius: 1, // How far the shadow extends
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            index == 3
                                ? const Icon(
                                    Icons.group,
                                    weight: 40,
                                    size: 40,
                                    color: Colors.blue,
                                  )
                                : Image(
                                    image: AssetImage(buttonicon[index]),
                                    height: 40,
                                    width: 40,
                                    color: Colors.blue,
                                    fit: BoxFit.cover,
                                  ),
                            Text(
                              buttonName[index],
                              style: const TextStyle(
                                color: Color.fromARGB(255, 252, 252, 252),
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                textBaseline: TextBaseline.ideographic,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
