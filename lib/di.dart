
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_app/view_models/MessagesViewModel.dart';
import 'package:get_it/get_it.dart';

import 'data/repositories/Repository.dart';

GetIt getIt = GetIt.instance;

void setup() async {
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<Repository>(() => Repository(networkDataBase: getIt()));
  getIt.registerFactory(() => MessagesViewModel(repository: getIt()));
/*  getIt.registerLazySingleton(() => SharedPreferenceTool());
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(networkDataBase: getIt(), sharedPreference: getIt()));
  getIt.registerFactory(() => TitlesViewModel(homeRepository: getIt()));
  getIt.registerFactory(() => ChooseLanguageViewModel(homeRepository: getIt()));
  getIt.registerFactory(() => AuthenticationViewModel(homeRepository: getIt()));
  getIt.registerFactory(() => PayingViewModel(homeRepository: getIt()));*/
}

class DependencyInjection{
  late FirebaseFirestore firestore;
  late CollectionReference itemsCollection;
  late MessagesViewModel messagesViewModel;
  static DependencyInjection? di;
  void setupDi() async{
    setup();
    firestore = getIt.get<FirebaseFirestore>();
    itemsCollection = firestore.collection("items");
    messagesViewModel = getIt.get<MessagesViewModel>();
  }

  static DependencyInjection getDi(){
    di ??= DependencyInjection();
    return di!;
  }

}