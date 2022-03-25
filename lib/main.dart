import 'package:demo/backend/providers/data_provider.dart';
import 'package:demo/base_screen.dart';
import 'package:demo/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xff29274F),
        ),
        home: const BaseScreen());
  }
}
