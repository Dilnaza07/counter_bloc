import 'package:counter_bloc/features/counter/presentation/counter_page.dart';
import 'package:flutter/material.dart';

import 'features/counter/presentation/counter_bloc_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterBlocPage(),
    );
  }
}