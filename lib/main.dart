import 'package:flutter/material.dart';
import 'app/views/home_view.dart';

void main() {
  runApp(const ConversorApp());
}

class ConversorApp extends StatelessWidget {
  const ConversorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Conversor Moeda',
      theme: ThemeData.dark(),
      home: const MyHomePage(), //Ok
    ); //MaterialApp
  }
}
