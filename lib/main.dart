
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:social_media_app/injector.dart';

import 'app.dart';
import 'data/data_source/remote_data_source/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// initializeing the Core module
  /// Creates [NetworkInfo] , [CloudFirestore] , [CloudStorage] and [FirebasAuthentication] 
  /// instance
  
  await initCoreModue();
  


  runApp(const MyApp());
}
