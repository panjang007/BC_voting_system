import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            elevation: 0,
          ),
          primaryColor: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ))),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("DaVote"),
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
