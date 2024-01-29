import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:petpals_outreach/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Api/callingapi.dart';
import '../Api/headers.dart';
import '../screens/homescreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Frame1 extends StatefulWidget {
  Frame1({
    super.key,
  });

  @override
  State<Frame1> createState() => _Frame1State();
}

class _Frame1State extends State<Frame1> {
  // shared preference
  Future<String> authenticateUser() async {
    // Perform authentication logic
    String authtoken = "here is authtoken";
    // Save token in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('authToken', authtoken);
    return authtoken;
  }

// user detail
  Future userdetailstore() async {
    // Perform authentication logic

    // Save token in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', Name!);
    await prefs.setString('contactno', mobileno!);
    await prefs.setString('radiodonor', selectedRole);
  }
  //closing

  // function declaration
  void showCustomDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            backgroundColor: const Color.fromARGB(255, 15, 13, 72),
            content: Text('Hello, ${Name} Thanks For Visiting Us',
                style: GoogleFonts.pacifico(
                  textStyle: const TextStyle(color: Colors.white, fontSize: 30),
                )),
          ),
        );
      },
    );
    // Delay for 3 seconds
    await Future.delayed(Duration(seconds: 3));

    // Close dialog
    Navigator.of(context).pop();

    // Navigate to another screen
    selectedRole == "DONOR"
        ? Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Homescreen()),
          )
        : Navigator.pushReplacementNamed(context, '/workofvolenteer');
  }
  //navigation

  void timingset() {
    authenticateUser();

    showCustomDialog();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();

  final TextEditingController phoneno = TextEditingController();
// creating object of api calling
  // DonorApi _donorapi = new DonorApi();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.953,
                width: MediaQuery.sizeOf(context).width * 1,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "photos/mainscreen/homebackground1.jpg"), // Replace with your image path
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
                child: Center(
                  child: SizedBox(
                    // height: MediaQuery.sizeOf(context).height * 0.7,
                    width: MediaQuery.sizeOf(context).width * 1,
                    child: Column(
                      children: [
                        Text(" What Should",
                            style: GoogleFonts.dancingScript(
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 238, 238, 238)),
                            )),
                        Text("We ",
                            style: GoogleFonts.dancingScript(
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 238, 238, 238)),
                            )),
                        Text("  Call You? ",
                            style: GoogleFonts.dancingScript(
                              textStyle: const TextStyle(
                                  fontSize: 50,
                                  color: Color.fromARGB(255, 238, 238, 238),
                                  fontWeight: FontWeight.bold),
                            )),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12, left: 12),
                          child: TextFormField(
                            textCapitalization: TextCapitalization.words,
                            maxLength: 17,
                            keyboardType: TextInputType.text,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(RegExp(
                                  r"[a-zA-Z\s]")), // Only allow alphabetic characters
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              }
                              return null; // Return null if the input is valid
                            },
                            onSaved: (value) {
                              if (value != null) {
                                Name = value;
                              }
                              // Save the input value
                            },
                            controller: _textEditingController,
                            decoration: const InputDecoration(
                              counterStyle: TextStyle(
                                  color: Color.fromARGB(255, 252, 251, 251)),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 80, 236,
                                      226), // Set the border color
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors
                                      .green, // Set the focused border color
                                ),
                              ),
                              errorStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 29, 4,
                                    196), // Change the warning text color here
                              ),
                              labelText: 'Enter Your Name',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 250, 247,
                                    247), // Set the label text color
                              ),
                              border: OutlineInputBorder(),
                              hintMaxLines: 1,
                            ),
                          ),
                        ),

                        // end of name field

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'This field is required';
                              } else if (value.length != 10) {
                                return 'Please Enter correct Phone Number';
                              }
                              return null; // Return null if the input is valid
                            },
                            onSaved: (value) {
                              if (value != null) {
                                mobileno = value;
                              }

                              // Save the input value
                            },
                            controller: phoneno,
                            decoration: const InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 80, 236,
                                      226), // Set the border color
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors
                                      .green, // Set the focused border color
                                ),
                              ),
                              errorStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 29, 4,
                                    196), // Change the warning text color here
                              ),
                              labelText: 'Please Enter Your Contact Number',
                              labelStyle: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 250, 247,
                                    247), // Set the label text color
                              ),
                              border: OutlineInputBorder(),
                              hintMaxLines: 1,
                            ),
                          ),
                        ),
                        RadioListTile(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromARGB(255, 255, 255, 255)),
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromARGB(255, 15, 13, 72)),
                          title: Text('DONOR',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          value: 'DONOR',
                          groupValue: selectedRole,
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value!;
                            });
                          },
                        ),
                        RadioListTile(
                          overlayColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromARGB(255, 255, 255, 255)),
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromARGB(255, 15, 13, 72)),
                          title: Text(
                            'VOLUNTEER',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          value: 'VOLUNTEER',
                          groupValue: selectedRole,
                          onChanged: (value) {
                            setState(() {
                              selectedRole = value!;
                            });
                          },
                        ),
                        //

                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Get the text from the text field
                            if (_formKey.currentState!.validate() &&
                                selectedRole.isNotEmpty) {
                              // If validation succeeds, save the input value

                              _formKey.currentState!.save();
                              userdetailstore();

                              if (selectedRole == "DONOR") {
                                DonorApi.postDonorData(Name!, mobileno!);
                              }

                              // apicall();
                              timingset();
                            }

                            // Navigate to the second screen when the button is pressed.
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
                              borderRadius:
                                  BorderRadius.circular(10), // Button shape
                            ),
                          ),
                          child: const Text(
                            'Next',
                            style: TextStyle(
                                color: Color.fromARGB(255, 214, 214, 214)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

//   void greeting(BuildContext context) {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: Color.fromARGB(255, 84, 80, 214),
//             contentPadding:
//                 const EdgeInsets.all(16), // Set padding to control the size

//             // Wrap the content in SingleChildScrollView for flexibility
//             content: SingleChildScrollView(
//                 child: Form(
//               key: _formKey2,
//               child:
//                   // backgroundColor: const Color.fromARGB(255, 224, 236, 117),

//                   Column(
//                 children: [
//                   Text("Hello $_inputText Thanks For Visiting Our Page ",
//                       style: GoogleFonts.dancingScript(
//                         textStyle: const TextStyle(
//                             fontSize: 50, fontWeight: FontWeight.bold),
//                       )),
//                   // TextFormField(
//                   //   validator: (value) {
//                   //     if (value!.isEmpty) {
//                   //       return 'This field is required';
//                   //     } else if (value.length != 10) {
//                   //       return 'Please Enter correct Phone Number';
//                   //     }
//                   //     return null; // Return null if the input is valid
//                   //   },
//                   //   onSaved: (value) {
//                   //     contactno = value!;

//                   //     // Save the input value
//                   //   },
//                   //   controller: phoneno,
//                   //   decoration: const InputDecoration(
//                   //     enabledBorder: OutlineInputBorder(
//                   //       borderSide: BorderSide(
//                   //         color: Color.fromARGB(
//                   //             255, 80, 236, 226), // Set the border color
//                   //       ),
//                   //     ),
//                   //     focusedBorder: OutlineInputBorder(
//                   //       borderSide: BorderSide(
//                   //         color: Colors.green, // Set the focused border color
//                   //       ),
//                   //     ),
//                   //     errorStyle: TextStyle(
//                   //       fontWeight: FontWeight.bold,
//                   //       color: Color.fromARGB(255, 29, 4,
//                   //           196), // Change the warning text color here
//                   //     ),
//                   //     labelText: 'Please Enter Your Contact Number',
//                   //     labelStyle: TextStyle(
//                   //       fontSize: 12,
//                   //       color: Color.fromARGB(
//                   //           255, 250, 247, 247), // Set the label text color
//                   //     ),
//                   //     border: OutlineInputBorder(),
//                   //     hintMaxLines: 1,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             )),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   if (_formKey2.currentState!.validate()) {
//                     // If validation succeeds, save the input value
//                     _formKey2.currentState!.save();
//                     // greeting(context);
//                     Navigator.pop(context);
//                     // Close the pop-up screengreeting
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const Homescreen(
//                                 title: 'push to main screen',
//                               )),
//                     );
//                   }
//                 },
//                 child: Text('Next',
//                     style: GoogleFonts.dancingScript(
//                       textStyle: const TextStyle(
//                           color: Colors.redAccent,
//                           fontSize: 30,
//                           fontWeight: FontWeight.bold),
//                     )),
//               ),
//             ],
//           );
//         });
//   }
// }
