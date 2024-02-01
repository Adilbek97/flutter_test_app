import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/core/src/colors.dart';
import 'package:flutter_test_app/core/src/dimensions.dart';
import 'package:flutter_test_app/core/src/images.dart';
import 'package:flutter_test_app/data/models/User.dart';
import 'package:flutter_test_app/di.dart';
import 'package:flutter_test_app/presentation/pages/message_page.dart';

late final DependencyInjection di;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di = DependencyInjection.getDi();
  di.setupDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      color: Colors.white,
      child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14,),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text("Чаты",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: darkGreyColor,
                  fontSize: fontSize32,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.normal,
              ),
            ),
          ),
          const SizedBox(height: 6,),
          _searchBar(),
          const SizedBox(height: 24,),
          _divider(),
          _itemsList(),
        ],
        ),
      )
      )
    );
  }

  Widget _itemsList(){
    var data = DependencyInjection.getDi().messagesViewModel.fetchUsersData();
    return Expanded(
      child: StreamBuilder(
          stream: data,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return const Text("no data");
            final data = snapshot.data!;
            return ListView.separated(
                shrinkWrap: true,
                itemCount: data.docs.length,
                padding: const EdgeInsets.all(8),
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 0,width: 0,),
                itemBuilder: (BuildContext context, int index){
                final User user = User(userName: data.docs[index].get("userName"),
                      message: data.docs[index].get("message"),
                      date: data.docs[index].get("date"),
                      isMy: data.docs[index].get("isMy"));
                  return Padding(
                    padding: const EdgeInsets.only(right: 10,left: 10),
                    child: _listItem(
                        index: index,
                        user: user,
                    ),
                  );
                }
            );
          }
      ),
    );
  }

  Widget _listItem({required int index, required User user}) {
    return Column(
      children: [
        _item(user),
        _divider()
      ],
    );
  }

  Widget _item(User user){
    return InkWell(
      child: Container(
        height: 70,
        padding: const EdgeInsets.only(top: 10,bottom: 10,right: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset("assets/images/userAvatar.png",height: 50,width: 50,),
            const SizedBox(width: 12,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 7,),
                  Text(user.userName,
                    style: const TextStyle(
                      fontFamily: 'Gilroy',
                      color: Colors.black,
                      fontSize: fontSize15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  user.isMy ? _myMessage(user.message) : _message(user.message),
                  const SizedBox(height: 7,)
                ],
              ),
            ),
            const SizedBox(width: 12,),
            Text(user.date,
              style: const TextStyle(
                fontFamily: 'Gilroy',
                color: messageDateColor,
                fontSize: fontSize12,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            )
          ],
        ),
      ),
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MessagePage()),
        );
      },
    );
  }

  Widget _divider() {
    return Container(height: 1,color: strokeColor,);
  }

  Widget _message(String message) {
    return Text(message,
      style: const TextStyle(
        fontFamily: 'Gilroy',
        color: messageDateColor,
        fontSize: fontSize12,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ),
    );
  }

  Widget _myMessage(String message) {
    return Row(
      children: [
      const Text("Вы: ",
      style: TextStyle(
        fontFamily: 'Gilroy',
        color: myMessageColor,
        fontSize: fontSize12,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      )),
      Text(message,
      style: const TextStyle(
        fontFamily: 'Gilroy',
        color: messageDateColor,
        fontSize: fontSize12,
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      )
      )
      ]
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 20,right: 20),
      child: CupertinoSearchTextField(
        backgroundColor: strokeColor,
        prefixIcon: searchIcon,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
        style: const TextStyle(
          fontFamily: 'Gilroy',
          color: searchColor,
          fontSize: fontSize16,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
        placeholder: "Поиск",
        placeholderStyle: const TextStyle(
          fontFamily: 'Gilroy',
          color: searchColor,
          fontSize: fontSize16,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
        ),
      ),
    );
  }
}