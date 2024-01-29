import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/splashscreen.dart';
import '../variables.dart';

class Aboutus extends StatefulWidget {
  const Aboutus({
    super.key,
  });

  @override
  State<Aboutus> createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  void initState() {
    super.initState();
    checkdata();

    // Delay for 3 seconds and then navigate to your main content.
  }

  Future<void> checkdata() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('authToken');
    userName = prefs.getString('username');
    Mobileno = prefs.getString('contactno');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 500,
          width: 400,
          child:
              Text("This is $authToken and this is $userName and $Mobileno "),
        ),
      ),
    );
  }
}
