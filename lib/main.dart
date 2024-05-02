import 'package:flutter/material.dart';

import 'home.dart';

 main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black, // Fondo del AppBar negro
          foregroundColor: Colors.white, // Color de los iconos y texto del AppBar
        ),
      ),
      darkTheme: ThemeData(
        // Define tu tema oscuro aquí
        brightness: Brightness.dark,
        // Otros ajustes de tu tema oscuro
      ),
      home: const MyHomePage(title: 'La Linterna mas cool'),
    );
  }
}