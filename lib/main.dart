import 'dart:io';

import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
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
  runApp(App());
}

class App extends StatelessWidget {
  // Create the initialization Future outside of `build`:
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
          return GetMaterialApp(home: Scaffold(body: HomeScreen()));
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return GetMaterialApp(home: Scaffold(body: Center(child: Container(child: Text("Loading"),)),));
      },
    );
  }
}