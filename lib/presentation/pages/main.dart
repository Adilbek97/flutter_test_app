import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/di.dart';

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
      body: Column(
        children: [
          const Text("Чаты",
            style: TextStyle(fontFamily: 'Gilroy'),
          ),
          const SearchBar(hintText: "search",),
          _itemsList(),
        ],
      ),
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
                  return _listItem(
                      index: index,
                      item: data.docs[index].get("userName")
                  );
                }
            );
          }
      ),
    );
  }

  Widget _listItem({required int index, required item}) {
    return Text(item,style: const TextStyle(fontSize: 32),);
  }

  Widget usersList() {
    return const Text("data");
  }
}