import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/entities/category.dart';
import '../controllers/feed_controller.dart';

class CategoryFilterBar extends GetView<FeedController> {
  const CategoryFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Obx(() {
        final List<Category> categories = controller.categories.toList();

        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (categories.isEmpty) {
          return const Center(child: Text('No categories'));
        }

        return ListView.separated(
          padding: const EdgeInsets.only(left: 30.0, right: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (context, index) => const SizedBox(width: 0),
          itemBuilder: (context, index) {
            final category = categories[index];
            final isSelected = category.selected;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: ElevatedButton(
                onPressed: () => controller.selectCategory(category.id),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      isSelected ? const Color(0xFF129575) : Colors.white,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  side: const BorderSide(color: Colors.transparent),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 5.0,
                  ),
                ),
                child: Text(
                  category.name,
                  style: TextStyle(
                    color:
                        isSelected ? Colors.white : const Color(0xFF129575),
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
