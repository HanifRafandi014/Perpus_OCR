import 'package:flutter/material.dart';
import 'package:perpus_ocr/pages/dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:perpus_ocr/pages/mybooks.dart';
import 'package:perpus_ocr/pages/start_app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Add this line
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PerpusNas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartApp(),
    );
  }
}
