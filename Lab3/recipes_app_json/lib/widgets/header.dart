import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/data_controller.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DataController>();

    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Obx(() {
        final user = controller.user.value;
        final name = user?.name ?? '';
        final greeting = user?.greeting ?? '';

        return Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name.isEmpty ? 'Hello' : 'Hello $name',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  greeting.isEmpty
                      ? 'What do you want to cook today?'
                      : greeting,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Color(0xFFA9A9A9),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 60,
              height: 60,
              child: _ProfileImage(url: user?.profileImage),
            ),
          ],
        );
      }),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({this.url});

  final String? url;

  @override
  Widget build(BuildContext context) {
    if (url == null || url!.isEmpty) {
      return _roundedImage(
        Image.asset(
          'assets/images/profile.png',
          fit: BoxFit.cover,
        ),
      );
    }

    return _roundedImage(
      Image.network(
        url!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) {
          return Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget _roundedImage(Widget child) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: child,
    );
  }
}
