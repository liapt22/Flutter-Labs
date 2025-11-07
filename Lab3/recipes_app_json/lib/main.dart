import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/data_controller.dart';
import 'widgets/categories.dart';
import 'widgets/header.dart';
import 'widgets/recipes_slider.dart';
import 'widgets/searchbar.dart';
import 'widgets/slider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(DataController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Recipes App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataController>();

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          if (controller.hasError.value) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('Failed to load data'),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: controller.loadData,
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Header(),
                  SearchAndFilterBar(),
                  CategoryFilterBar(),
                  SizedBox(height: 40.0),
                  DishesSlider(),
                  NewRecipesSlider(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
