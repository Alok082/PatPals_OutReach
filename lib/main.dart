import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:petpals_outreach/screens/splashscreen.dart';

import 'Askname/askname.dart';
import 'feedbygiving/instruction.dart';
import 'ourstars/ourstars.dart';
import 'ourwork/ourworkpage.dart';
import 'screens/homescreen.dart';
import 'want_to_serve/seeevent.dart';
import 'want_to_serve/workofvolenteer.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,

      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'petpalsOutReach',
      home: const splashscreen(),
      routes: {
        '/homescreen': (context) => const Homescreen(),
        '/Feedbygiving': (context) => const Feedbygiving(),
        '/workofvolenteer': (context) => const workofvolenteer(),
        '/askname': (context) => Frame1(),
        '/ourworkpage': (context) => ourworkpage(),
        '/ourStars': (context) => const ourStars(),
        '/Seeevent': (context) => const Seeevent(),
      },
    );
  }
}
