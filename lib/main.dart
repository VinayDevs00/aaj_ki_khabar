import 'dart:io';

import 'package:aaj_ki_khabar/View/Screens/login_screen.dart';
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;
import 'package:hive_flutter/hive_flutter.dart';
import 'Controller/categories_controller.dart';
import 'Model/postcontroller_hive_model.dart';
import 'View/Screens/home_screen.dart';

void main() async{


  // final appDocumentDirectory = await pathProvider.getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDirectory.path);
  // Hive.registerAdapter(PostControllerHiveModelAdapter());
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.blue,
  ));


  //Flutter BAckground Service Testing



    runApp(App());
}

class App extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {



    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error.toString());
          return GetMaterialApp(home: Scaffold(body: Center(child: Container(child: Text("Error"),)),));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
              home: Scaffold(body: HomeScreen()));
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return GetMaterialApp(home: Scaffold(body: Center(child: Container(child: Text("Loading"),)),));
      },
    );
  }
}