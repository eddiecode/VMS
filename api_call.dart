import 'dart:convert';

import 'package:http/http.dart' as http;
class Users {
  String id;
  String first_name;
  String last_name;
  String phone_number ;
  String purpose;
  String company;
  String officer_to_see;
  String tag;
  String time;
  Users({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.phone_number,
    required this.purpose,
    required this.company,
    required this.officer_to_see,
    required this.tag,
    required this.time,
});

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    first_name: json["first name"],
    last_name: json["last name"],
    phone_number: json["phone number"],
    purpose: json["purpose"],
    company: json["company"],
    officer_to_see: json["officer to see"],
    tag: json["tag"],
    time: json["time"],
  );
}
Future<List<Users>> getUsers() async {
  final response = await http.get(
    Uri.parse('http://localhost:3300/visitors'),
  );
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    List<Users> users = [];
    for (var u in jsonResponse) {
      Users user =
      Users(id: u['id'], first_name: u['first name'], last_name: u['last name'], phone_number: u['phone'], purpose: u['purpose'], company: u['company'], officer_to_see: u['officer to see'], tag: u['tag'], time: u['time'],  );
      users.add(user);
    }
    return users;
  } else {
    throw Exception('Failed to load post');
  }
}



