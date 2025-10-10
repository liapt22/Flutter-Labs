import 'package:flutter/material.dart';
import 'package:recipes_app/widgets/header.dart';
import 'package:recipes_app/widgets/recipes_slider.dart';
import 'package:recipes_app/widgets/searchbar.dart';
import 'package:recipes_app/widgets/categories.dart';
import 'package:recipes_app/widgets/slider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipes App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(),
                SearchAndFilterBar(),
                CategoryFilterBar(),
                SizedBox(height: 40.0),
                DishesSlider(),
                NewRecipesSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
