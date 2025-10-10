import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Jega",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "What do you want to cook today?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: Color(0xFFA9A9A9),
                ),
              ),
            ],
          ),
          Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ColoredBox(
              color: Color(0xFFFFCE80),
              child: SizedBox(
                width: 60,
                height: 60,
                child: Center(
                  child: Image.asset(
                    'assets/images/profile.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
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
