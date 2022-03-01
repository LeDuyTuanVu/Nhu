import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:nhu/models/user.dart';

class UserController extends ChangeNotifier {
  late User user;

  // User

  void saveUser(String name, String img, String email, String id) {
    log("WRONG");
    user = User(name: name, email: email, img: img, id: id);
    log("SAVED");
    notifyListeners();
  }
}
