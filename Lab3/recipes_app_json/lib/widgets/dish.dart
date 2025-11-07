import 'package:flutter/material.dart';

class Dish extends StatefulWidget {
  final String name;
  final String imageUrl;
  final String timeLabel;
  final double rating;
  final VoidCallback? onTap;

  const Dish({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.timeLabel,
    required this.rating,
    this.onTap,
  });

  @override
  State<Dish> createState() => _DishState();
}

class _DishState extends State<Dish> {
  bool _bookmarked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.onTap,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          Card(
            color: Color(0xFFEBEBEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 50.0,
                  bottom: 8.0,
                  left: 8.0,
                  right: 8.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            widget.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Time',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFFA9A9A9),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              widget.timeLabel.isEmpty
                                  ? '-'
                                  : widget.timeLabel,
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF484848),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            setState(() => _bookmarked = !_bookmarked);
                            debugPrint(
                              'Dish "${widget.name}" bookmarked: $_bookmarked',
                            );
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset(
                                _bookmarked
                                    ? 'assets/icons/bookmark.png'
                                    : 'assets/icons/bookmark-grey.png',
                                width: 16,
                                height: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -50,
            child: ClipOval(
              child: _DishImage(imageUrl: widget.imageUrl),
            ),
          ),
          Positioned(
            top: -25,
            right: 5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Color(0xFFFFE1B3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.star, color: Color(0xFFFFAD30), size: 14),
                  SizedBox(width: 4),
                  Text(
                    widget.rating.toString(),
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DishImage extends StatelessWidget {
  const _DishImage({required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _fallbackImage();
    }

    return Image.network(
      imageUrl,
      height: 100,
      width: 100,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => _fallbackImage(),
    );
  }

  Widget _fallbackImage() {
    return Container(
      height: 100,
      width: 100,
      color: const Color(0xFFE0E0E0),
      alignment: Alignment.center,
      child: const Icon(
        Icons.fastfood,
        color: Color(0xFF9E9E9E),
      ),
    );
  }
}
