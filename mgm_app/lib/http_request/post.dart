import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> makePostRequest( String username, String email ,String password ,
    String countryCode, String mobile, String branch) async {
  // Create the key-value pair object
  Map<String, dynamic> postData = {
    'username': username,
    'password': password,
    'email' : email,
    'countryCode': countryCode,
    'mobile': mobile,
    'totalBranches' : branch
  };

  // Convert the object to JSON format
  String jsonBody = jsonEncode(postData);

  try {
    final response = await http.post(
      Uri.parse('http://localhost:8080/api/users/save'), // Replace with your API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonBody,
    );

    print(response.statusCode);
    if (response.statusCode == 200) {
      // Handle successful response
      return true;
    } else {
      // Handle other status codes
      print('POST request failed with status: ${response.statusCode}');
      return false;
    }
  } catch (error) {
    // Handle errors
    print('Error occurred: $error');
    return false;
  }
}
