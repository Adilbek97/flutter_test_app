
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/repositories/Repository.dart';

class MessagesViewModel extends ChangeNotifier{
  final Repository repository;

  MessagesViewModel({required this.repository});

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUsersData(){
    var fData =  repository.fetchUsersData();
    return fData;
  }
}