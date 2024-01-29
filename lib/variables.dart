import 'package:geolocator/geolocator.dart';

import 'Api/callingapi.dart';

// ask name variable

// location variable
Position? position;

double? distributerlatitude;
double? distributerLongitude;
// location closed
//name variable
String? Name;
String? mobileno;

// radio button variable
String selectedRole = '';
// Donor id
var Donorid = '';
//
//datetime
String formattedDateTime = '';

// process indicator
bool isProcessing = false;
//
double? Longitude;
double? latitude;
var donorstatus = "";

// array for event list
List<EventModel> events = [];
