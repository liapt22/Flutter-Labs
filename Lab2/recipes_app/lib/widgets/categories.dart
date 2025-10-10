import 'package:flutter/material.dart';
import 'package:recipes_app/services/mock_data.dart';

class CategoryFilterBar extends StatefulWidget {
  const CategoryFilterBar({super.key});

  @override
  State<CategoryFilterBar> createState() => _CategoryFilterBarState();
}

class _CategoryFilterBarState extends State<CategoryFilterBar> {
  List<String> categories = [];
  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _loadMockData();
  }

  void _loadMockData() {
    setState(() {
      categories =
          MockDataService.getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        padding: EdgeInsets.only(left: 30.0, right: 8.0),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _selectedCategory = category;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _selectedCategory == category
                    ? Color(0xFF129575)
                    : Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                side: BorderSide(color: Colors.transparent),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 5.0),
              ),
              child: Text(
                category,
                style: TextStyle(
                  color: _selectedCategory == category
                      ? Colors.white
                      : Color(0xFF129575),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 0),
      ),
    );
  }
}
