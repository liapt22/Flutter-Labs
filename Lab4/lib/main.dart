import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'data/datasources/feed_remote_data_source.dart';
import 'data/repositories/feed_repository_impl.dart';
import 'domain/usecases/get_feed_use_case.dart';
import 'domain/usecases/get_recipe_detail_use_case.dart';
import 'presentation/controllers/feed_controller.dart';
import 'presentation/widgets/categories.dart';
import 'presentation/widgets/header.dart';
import 'presentation/widgets/recipes_slider.dart';
import 'presentation/widgets/searchbar.dart';
import 'presentation/widgets/slider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final remoteDataSource = FeedRemoteDataSource();
  final repository = FeedRepositoryImpl(remoteDataSource: remoteDataSource);
  final getFeedUseCase = GetFeedUseCase(repository);
  final getRecipeDetailUseCase = GetRecipeDetailUseCase(repository);

  Get.put(
    FeedController(
      getFeedUseCase: getFeedUseCase,
      getRecipeDetailUseCase: getRecipeDetailUseCase,
    ),
  );

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
    final controller = Get.find<FeedController>();

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
