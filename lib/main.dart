import 'package:camera_app/gallery_page.dart';
import 'package:camera_app/home_page.dart';
import 'package:camera_app/view_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeScreen(),
    );
  }
}
