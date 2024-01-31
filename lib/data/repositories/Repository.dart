import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseRepository{
  late final FirebaseFirestore networkDataBase;
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUsersData();
}

class Repository extends BaseRepository{

  @override
  final FirebaseFirestore networkDataBase;

  Repository({required this.networkDataBase}){
    super.networkDataBase = networkDataBase;
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchUsersData() {
    return networkDataBase.collection("users").snapshots();
  }

}