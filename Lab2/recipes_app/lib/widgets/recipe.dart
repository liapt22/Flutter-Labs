import 'package:flutter/material.dart';

class Recipe extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String authorPicture;
  final String authorFullname;
  final double rating;
  final int time;
  final VoidCallback? onTap;

  const Recipe({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.authorPicture,
    required this.authorFullname,
    required this.rating,
    required this.time,
    this.onTap,
  });

  String _truncateName(String name) {
    List<String> words = name.split(' ');
    if (words.length > 3) {
      return '${words.take(3).join(' ')}...';
    }
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Card(
              color: Color(0xFFFFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              child: SizedBox(
                width: 255,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 50.0,
                    left: 12.0,
                    right: 12.0,
                    bottom: 12.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: Color(0xFFFFAD30),
                            size: 16,
                            key: ValueKey(index),
                          );
                        }),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  authorPicture,
                                  height: 24,
                                  width: 24,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                'By $authorFullname',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/timer.png',
                                height: 16,
                                width: 16,
                              ),
                              SizedBox(width: 2),
                              Text(
                                '$time mins',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFA9A9A9),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -40,
            right: 10,
            child: ClipOval(
              child: Image.asset(
                imageUrl,
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 20,
            left: 16,
            child: SizedBox(
              width: 150,
              child: Text(
                _truncateName(name),
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF484848),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
