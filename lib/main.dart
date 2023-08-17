import 'package:flutter/material.dart';
import 'package:grocery_app_bloc/Features/Home/UI/home.dart';

void main() {
  runApp(GroceryAppBloc());
}

class GroceryAppBloc extends StatelessWidget {
  const GroceryAppBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal),
      home: HomeScreen(),
    );
  }
}
