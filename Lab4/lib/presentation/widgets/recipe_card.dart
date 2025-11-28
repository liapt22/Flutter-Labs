import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.name,
    required this.imageUrl,
    this.authorPicture,
    required this.authorFullname,
    required this.rating,
    required this.timeLabel,
    this.onTap,
  });

  final String name;
  final String imageUrl;
  final String? authorPicture;
  final String authorFullname;
  final double rating;
  final String timeLabel;
  final VoidCallback? onTap;

  Widget _buildRatingStars() {
    return Row(
      children: List.generate(5, (index) {
        final starPosition = index + 1;
        final icon = rating >= starPosition
            ? Icons.star
            : rating >= starPosition - 0.5
                ? Icons.star_half
                : Icons.star_border;

        return Padding(
          padding: EdgeInsets.only(right: index == 4 ? 0 : 2),
          child: Icon(
            icon,
            color: const Color(0xFFFFAD30),
            size: 16,
          ),
        );
      }),
    );
  }

  String _truncateName(String value) {
    final words = value.split(' ');
    if (words.length > 3) {
      return '${words.take(3).join(' ')}...';
    }
    return value;
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
              boxShadow: const [
                BoxShadow(
                  color: Color(0x1A000000),
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Card(
              color: const Color(0xFFFFFFFF),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 0,
              child: SizedBox(
                width: 255,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50.0,
                    left: 12.0,
                    right: 12.0,
                    bottom: 12.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRatingStars(),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: _NetworkCircleImage(
                                  imageUrl: authorPicture,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'By $authorFullname',
                                style: const TextStyle(
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
                              const SizedBox(width: 2),
                              Text(
                                timeLabel.isEmpty ? '-' : timeLabel,
                                style: const TextStyle(
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
              child: _NetworkCircleImage(
                imageUrl: imageUrl,
                size: 80,
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
                style: const TextStyle(
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

class _NetworkCircleImage extends StatelessWidget {
  const _NetworkCircleImage({
    required this.imageUrl,
    required this.size,
  });

  final String? imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null || imageUrl!.isEmpty) {
      return _fallback();
    }

    return Image.network(
      imageUrl!,
      height: size,
      width: size,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => _fallback(),
    );
  }

  Widget _fallback() {
    return Container(
      height: size,
      width: size,
      color: const Color(0xFFE0E0E0),
      alignment: Alignment.center,
      child: const Icon(
        Icons.person,
        color: Color(0xFF9E9E9E),
        size: 16,
      ),
    );
  }
}
