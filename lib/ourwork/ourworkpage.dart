import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ourworkpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenheight = MediaQuery.of(context).size.height;
    var screenwidth = MediaQuery.of(context).size.width;
    final List<String> imageUrls = [
      'photos/ourwork/1.jpg',
      'photos/ourwork/4.jpg',
      'photos/ourwork/7.jpeg',
      'photos/ourwork/2.jpg',
      'photos/ourwork/8.jpeg',
      'photos/ourwork/3.jpg',
      'photos/ourwork/5.jpg',
      'photos/ourwork/6.jpg',

      // Add more image URLs as needed
    ];
    final List<String> imageUrls2 = [
      'photos/ourwork/2.jpg',
      'photos/ourwork/5.jpg',
      'photos/ourwork/8.jpeg',
      'photos/ourwork/3.jpg',
      'photos/ourwork/6.jpg',
      'photos/ourwork/7.jpeg',
      'photos/ourwork/1.jpg',
      'photos/ourwork/2.jpg',

      // Add more image URLs as needed
    ];
    final List<String> imageUrls3 = [
      'photos/ourwork/3.jpg',

      'photos/ourwork/6.jpg',
      'photos/ourwork/1.jpg',
      'photos/ourwork/5.jpg',
      'photos/ourwork/8.jpeg',
      'photos/ourwork/2.jpg',
      'photos/ourwork/4.jpg',
      'photos/ourwork/7.jpeg',

      // Add more image URLs as needed
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 8,
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Color.fromARGB(255, 79, 141, 188),
        ),
        backgroundColor: const Color.fromARGB(255, 15, 13, 72),
        body: Container(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, indexouter) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "photos/mainscreen/homebackground1.jpg"), // Replace with your image path
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
                  itemCount: imageUrls.length,
                  options: CarouselOptions(
                    height: screenheight * 0.30,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,

                    // Other customization options can be added here.
                  ),
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return Container(
                        margin: const EdgeInsets.all(20),
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
                            child: indexouter == 0
                                ? Image(
                                    image: AssetImage(imageUrls[index]),
                                    fit:
                                        BoxFit.cover, // or another BoxFit value
                                  )
                                : Image(
                                    image: AssetImage(
                                      indexouter == 1
                                          ? imageUrls2[index]
                                          : imageUrls3[index],
                                    ),
                                    fit:
                                        BoxFit.cover, // or another BoxFit value
                                  )));
                  },
                ),
              );
            },
          ),
        ),
      ),

      // Column(
      //   children: [
      //     Container(
      //       decoration: const BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage(
      //               "photos/splashscreen/splashlogo.png"), // Replace with your image path
      //           fit: BoxFit.cover, // You can adjust the fit as needed
      //         ),
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.grey,
      //             spreadRadius: 4,
      //             blurRadius: 5,
      //             offset: Offset(0, 3), // changes position of shadow
      //           ),
      //         ],
      //       ),
      //       child: CarouselSlider.builder(
      //         itemCount: imageUrls.length,
      //         options: CarouselOptions(
      //           height: screenheight * 0.27,
      //           enableInfiniteScroll: true,
      //           autoPlay: true,
      //           autoPlayInterval: const Duration(seconds: 3),
      //           autoPlayAnimationDuration: const Duration(milliseconds: 800),
      //           autoPlayCurve: Curves.fastOutSlowIn,

      //           // Other customization options can be added here.
      //         ),
      //         itemBuilder: (BuildContext context, int index, int realIndex) {
      //           return Container(
      //               margin: const EdgeInsets.all(20),
      //               height: screenheight * 0.29,
      //               width: screenwidth * 0.85,

      //               // color: Colors.white,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(12),
      //                   // color: Colors.blue, // Background color
      //                   border: Border.all(
      //                     color: const Color.fromARGB(
      //                         255, 214, 212, 212), // Border color
      //                     width: 2.0, // Border width
      //                   )),
      //               child: ClipRRect(
      //                 // Clip the child to a rectangular shape
      //                 borderRadius: BorderRadius.circular(
      //                     12), // Set a radius of 0 for a rectangular shape
      //                 child: Image(
      //                   image: AssetImage(imageUrls[index]),
      //                   fit: BoxFit.cover, // or another BoxFit value
      //                 ),
      //               ));
      //         },
      //       ),
      //     ),
      //     Container(
      //       decoration: const BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage(
      //               "photos/splashscreen/splashlogo.png"), // Replace with your image path
      //           fit: BoxFit.cover, // You can adjust the fit as needed
      //         ),
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.grey,
      //             spreadRadius: 4,
      //             blurRadius: 5,
      //             offset: Offset(0, 3), // changes position of shadow
      //           ),
      //         ],
      //       ),
      //       child: CarouselSlider.builder(
      //         itemCount: imageUrls.length,
      //         options: CarouselOptions(
      //           height: screenheight * 0.27,
      //           enableInfiniteScroll: true,
      //           autoPlay: true,
      //           autoPlayInterval: const Duration(seconds: 3),
      //           autoPlayAnimationDuration: const Duration(milliseconds: 800),
      //           autoPlayCurve: Curves.fastOutSlowIn,

      //           // Other customization options can be added here.
      //         ),
      //         itemBuilder: (BuildContext context, int index, int realIndex) {
      //           return Container(
      //               margin: const EdgeInsets.all(20),
      //               height: screenheight * 0.29,
      //               width: screenwidth * 0.85,

      //               // color: Colors.white,
      //               decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(12),
      //                   // color: Colors.blue, // Background color
      //                   border: Border.all(
      //                     color: const Color.fromARGB(
      //                         255, 214, 212, 212), // Border color
      //                     width: 2.0, // Border width
      //                   )),
      //               child: ClipRRect(
      //                 // Clip the child to a rectangular shape
      //                 borderRadius: BorderRadius.circular(
      //                     12), // Set a radius of 0 for a rectangular shape
      //                 child: Image(
      //                   image: AssetImage(imageUrls[index]),
      //                   fit: BoxFit.cover, // or another BoxFit value
      //                 ),
      //               ));
      //         },
      //       ),
      //     ),
      // ],
    );
  }
}
