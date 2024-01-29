import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../variables.dart';

String? authToken;

// ignore: camel_case_types
class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

// ignore: camel_case_types
class _splashscreenState extends State<splashscreen> {
  // shared preference logic authentication
  Future<void> checkandstore() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('authToken');
    selectedRole = prefs.getString('radiodonor')!;
    Name = prefs.getString('name');
    mobileno = prefs.getString('contactno');
    Donorid = prefs.getString('DonorId')!;
  }

  //
  @override
  void initState() {
    super.initState();
    checkandstore();
    loadDataAndNavigate();

    // Delay for 3 seconds and then navigate to your main content.
  }

  //
  Future<void> loadDataAndNavigate() async {
    // Simulate a 5-second delay for splash screen (you can adjust this as needed)
    await Future.delayed(Duration(seconds: 3));

    try {
      // Fetch data and store it in SharedPreferences using the getdata() function

      if (authToken != null) {
        Navigator.pushReplacementNamed(context, '/homescreen');
      } else {
        Navigator.pushReplacementNamed(context, '/askname');
      }
    } catch (e) {
      // Handle any errors that might occur during data fetching
      print("Error fetching data: $e");
      // You can show an error screen or retry logic here if needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Image.asset(
        "photos/splashscreen/splashlogo.png",
        fit: BoxFit.fill,
      ),
    );
  }
}
