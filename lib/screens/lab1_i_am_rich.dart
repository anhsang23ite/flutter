import 'package:flutter/material.dart';

class Lab1_IAmRich extends StatelessWidget {
  const Lab1_IAmRich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('💎 I Am Rich'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Viên kim cương - Emoji
            const Text(
              '💎',
              style: TextStyle(fontSize: 120),
            ),
            const SizedBox(height: 40),

            // Tiêu đề chính
            const Text(
              'I Am Rich',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                shadows: [
                  Shadow(
                    blurRadius: 4,
                    color: Colors.black26,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Văn bản phụ
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Tôi chỉ có một cuộc sống - hãy sống nó một cách đầy đủ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFFD700), // Vàng sang trọng
    );
  }
}