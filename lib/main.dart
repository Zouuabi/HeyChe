import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'app.dart';
import 'data/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}
