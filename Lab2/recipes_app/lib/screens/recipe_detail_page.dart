import 'package:flutter/material.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ingredients = [
      {
        'name': 'Tomatos',
        'amount': '500g',
        'icon': 'assets/images/tomatos.png',
      },
      {
        'name': 'Cabbage',
        'amount': '300g',
        'icon': 'assets/images/cabbage.png',
      },
      {
        'name': 'Taco',
        'amount': '300g',
        'icon': 'assets/images/taco.png',
      },
      {
        'name': 'Slice Bread',
        'amount': '300g',
        'icon': 'assets/images/bread.png',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/burger.png',
                    width: double.infinity,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.0),
                          Color.fromRGBO(0, 0, 0, 0.9),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  top: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE1B3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.star, color: Color(0xFFFFAD30), size: 18),
                        SizedBox(width: 4),
                        Text(
                          '4.0',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/icons/timer.png',
                        width: 18,
                        height: 18,
                        color: const Color(0xFFD9D9D9),
                      ),
                      const SizedBox(width: 6),
                      const Text(
                        '20 min',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFD9D9D9),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(19),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.08),
                              blurRadius: 12,
                              offset: Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            'assets/icons/bookmark.png',
                            width: 18,
                            height: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Expanded(
                  child: Text(
                    'Spicy chicken burger with French fries',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2C2C2C),
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    '(13k Reviews)',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF9E9E9E),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/laura.png'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Laura Wilson',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/location.png',
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          'Lagos, Nigeria',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF9E9E9E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF129575),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Follow'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF129575),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'Ingredient',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Procedure',
                      style: TextStyle(
                        color: Color(0xFF129575),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _InfoLabel(
                  iconAsset: 'assets/icons/group.png',
                  label: '1 serve',
                ),
                _InfoLabel(
                  label: '10 items',
                ),
              ],
            ),
            const SizedBox(height: 24),
            ...ingredients.map(
              (ingredient) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F7),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 52,
                      height: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Image.asset(
                        ingredient['icon']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        ingredient['name']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2C2C2C),
                        ),
                      ),
                    ),
                    Text(
                      ingredient['amount']!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF9E9E9E),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoLabel extends StatelessWidget {
  final String? iconAsset;
  final String label;

  const _InfoLabel({
    this.iconAsset,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (iconAsset != null) ...[
          Image.asset(
            iconAsset!,
            width: 18,
            height: 18,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 8),
        ],
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFFA9A9A9),
          ),
        ),
      ],
    );
  }
}
