import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'app/app.dart';
import 'data/data_source/remote_data_source/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}
