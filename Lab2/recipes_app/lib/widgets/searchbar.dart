import 'package:flutter/material.dart';

class SearchAndFilterBar extends StatelessWidget {
  const SearchAndFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, top: 10, right: 30, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search recipe',
                hintStyle: TextStyle(
                  color: Color(0xFFD9D9D9),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Color(0xFFD9D9D9)),
                ),
                prefixIcon: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Image.asset(
                    'assets/icons/search-normal.png',
                    width: 12,
                    height: 12,
                    fit: BoxFit.contain,
                    color: Color(0xFFD9D9D9),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ColoredBox(
              color: Color(0xFF129575),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Center(
                  child: Image.asset(
                    'assets/icons/setting-4.png',
                    width: 25,
                    height: 25,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
