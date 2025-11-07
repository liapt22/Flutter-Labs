import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_controller.dart';

class SearchAndFilterBar extends StatefulWidget {
  const SearchAndFilterBar({super.key});

  @override
  State<SearchAndFilterBar> createState() => _SearchAndFilterBarState();
}

class _SearchAndFilterBarState extends State<SearchAndFilterBar> {
  late final DataController _controller;
  late final TextEditingController _textController;
  late final Worker _queryWorker;

  @override
  void initState() {
    super.initState();
    _controller = Get.find<DataController>();
    _textController =
        TextEditingController(text: _controller.searchQuery.value);
    _queryWorker = ever<String>(
      _controller.searchQuery,
      (value) {
        if (_textController.text != value) {
          _textController.value = TextEditingValue(
            text: value,
            selection: TextSelection.collapsed(offset: value.length),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _queryWorker.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        top: 10,
        right: 30,
        bottom: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Obx(() {
              final placeholder = _controller.searchPlaceholder.value.isEmpty
                  ? 'Search recipe'
                  : _controller.searchPlaceholder.value;

              return TextField(
                controller: _textController,
                onChanged: _controller.updateSearch,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: const TextStyle(
                    color: Color(0xFFD9D9D9),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xFFD9D9D9)),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/icons/search-normal.png',
                      width: 12,
                      height: 12,
                      fit: BoxFit.contain,
                      color: const Color(0xFFD9D9D9),
                    ),
                  ),
                  suffixIcon: _controller.searchQuery.value.isEmpty
                      ? null
                      : IconButton(
                          icon: const Icon(Icons.clear, color: Color(0xFFD9D9D9)),
                          onPressed: () {
                            _controller.updateSearch('');
                          },
                        ),
                ),
              );
            }),
          ),
          const SizedBox(width: 16.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const ColoredBox(
              color: Color(0xFF129575),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Center(
                  child: Image(
                    image: AssetImage('assets/icons/setting-4.png'),
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
