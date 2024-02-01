import 'dart:ffi';

class User{
  String userName = "";
  String date = "";
  String message = "";
  bool isMy = false;
  User({required this.userName, required this.message, required this.date, required this.isMy});
}