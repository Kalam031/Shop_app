import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/$urlSegment?key=AIzaSyCY7wGny9K8Mnx8qWUWoRScO_4SprL1mzA';
    final response = await http.post(
      url,
      body: json.encode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(json.decode(response.body));
  }

  Future<void> signUp(String email, String password) async {
    return _authenticate(email, password, 'accounts:signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'accounts:signInWithPassword');
  }
}
