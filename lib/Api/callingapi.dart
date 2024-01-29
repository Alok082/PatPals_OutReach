import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../variables.dart';
import 'headers.dart';

class DonorApi {
// Replace with your actual API endpoint

  static Future<void> postDonorData(String donorname, String mobileno) async {
    // Replace 'donors' with your actual endpoint path

    try {
      print("entered");
      final response = await http.post(
        Uri.parse('http://192.168.174.187/PHP-API/registerdonor.php'),
        body: ({
          'donor_name': donorname,
          'contactNumber': mobileno,
        }),
      );
      print("started");

      if (response.statusCode == 200) {
        print('Donor data posted successfully');
        final responseData = json.decode(response.body);
        Donorid = responseData['donorID'].toString();
        donorstatus = responseData['status'];
        print(donorstatus);
        //created instance of shared pref
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('DonorId', Donorid);

        print(Donorid);
      } else {
        print('Failed to post donor data. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error during API call: $e');
    }
  }

  static Future<void> registerDistributor(String name, String mobileNumber,
      double latitude, double longitude) async {
    final apiUrl = 'http://192.168.174.187/PHP-API/registerdistributer.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'dis_name': name,
          'dis_mobileNumber': mobileNumber,
          'dis_latitude': latitude.toString(),
          'dis_longitude': longitude.toString(),
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print(responseData);
        isProcessing = true;
        // Store the response in a variable for further use
      } else {
        print('Error during API call: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during API call: $error');
    }
  }

  // register event
  static Future<void> registerEvent(
      var donorID,
      String donorName,
      String dateTime,
      String contactNo,
      double latitude,
      double longitude) async {
    final apiUrl = 'http://192.168.174.187/PHP-API/insertevent.php';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {
          'donorID': donorID.toString(),
          'donorName': donorName,
          'dateTime': dateTime,
          'latitude': latitude.toString(),
          'longitude': longitude.toString(),
          'contactNumber': contactNo,
        },
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print('Response from server: $responseData');

        // Store the response in a variable for further use
        var eventApiResponse = responseData;
        isProcessing = true;

        // Now you can use 'eventApiResponse' as needed
        // For example, access a specific field: eventApiResponse['eventID']
      } else {
        print('Error during API call: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during API call: $error');
    }
  }

  // to fetch the data
  Future<void> fetchEvents() async {
    final apiUrl =
        'http://192.168.174.187/PHP-API/getevent.php'; // Replace with your actual API endpoint
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List jsonData = json.decode(response.body);

      // Assuming your API returns a list of objects containing 'user_id', 'username', and 'contact_number'
      events = jsonData.map((item) => EventModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }

  // to delete event
  Future<void> deleteEvent(String eventiD) async {
    final apiUrl =
        'http://192.168.174.187/PHP-API/deleteevent.php'; // Replace with your actual API endpoint

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'event_id': eventiD},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (responseData['status'] == 'success') {
          print('Event deleted successfully');
        } else {
          print('Error: ${responseData['message']}');
        }
      } else {
        print('Failed to delete event. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  } //
// closing here
}

class EventModel {
  final String eventID;
  final String donorID;
  final String donorName;
  final String contactNumber;
  final String latitude;
  final String longitude;
  final String donationDateTime;

  EventModel({
    required this.eventID,
    required this.donorID,
    required this.donorName,
    required this.contactNumber,
    required this.latitude,
    required this.longitude,
    required this.donationDateTime,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      eventID: json['EventID'] as String,
      donorID: json['DonorID'] as String,
      donorName: json['DonorName'] as String,
      contactNumber: json['ContactNumber'] as String,
      latitude: json['Latitude'] as String,
      longitude: json['Longitude'] as String,
      donationDateTime: json['DonationDateTime'] as String,
    );
  }
}
