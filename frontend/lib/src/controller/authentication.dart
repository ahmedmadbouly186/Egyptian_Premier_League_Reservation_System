import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:web_frontend/src/dio/constant_end_points.dart';
// import the user module
import 'package:web_frontend/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../shared/constants/constants.dart' as cons;

// import 'package:flutter_dotenv/flutter_dotenv.dart';
const url = cons.url;

Future<bool> login(Map<String, String> query, BuildContext context,
    {admin = false}) async {
  print(query);
  final Response response = await http
      .post(Uri.parse('$url/user/login'), body: json.encode(query), headers: {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  });
  if (response.statusCode == 200) {
    String token = json.decode(response.body)['token'];
    User user = User.fromJson(json.decode(response.body)['user']);
    // saved the token in the local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
    // save the user in the local storage
    prefs.setString('user', json.encode(user));

    if (admin) {
      prefs.setString('admin', admin.toString());
    }
    return true;
  } else {
    // ignore: use_build_context_synchronously
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("error message"),
          content:
              Text(json.decode(response.body)['message'] ?? "Failed to login"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );

    return false;
  }
}

Future<bool> signUp(Map<String, String> query, BuildContext context) async {
  final Response response = await http
      .post(Uri.parse('$url/user/signup'), body: json.encode(query), headers: {
    "Access-Control-Allow-Origin": "*",
    'Content-type': 'application/json',
    'Accept': 'application/json',
  });
  print(response.statusCode);
  if (response.statusCode == 201) {
    String token = json.decode(response.body)['token'];
    User user = User.fromJson(json.decode(response.body)['user']);
    // saved the token in the local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('token', token);
    // // save the user in the local storage
    // prefs.setString('user', json.encode(user));
    return true;
  } else {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("error message"),
          content:
              Text(json.decode(response.body)['message'] ?? "Failed to signup"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
          ],
        );
      },
    );
    return false;
  }
}

Future<bool> check_login() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString('token');
  if (token == null) {
    return false;
  } else {
    return true;
  }
}

Future<User> get_user() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? users = prefs.getString('user');
  if (users == null) {
    return User();
  } else {
    User user = User.fromJson(json.decode(users));
    return user;
  }
}

Future<bool> check_user_is_manager() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? users = prefs.getString('user');
  if (users == null) {
    return false;
  } else {
    User user = User.fromJson(json.decode(users));
    if (user.role == 'manager') {
      return true;
    } else {
      return false;
    }
  }
}

Future<bool> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  prefs.remove('user');
  return true;
}
