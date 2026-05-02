import 'package:flutter/material.dart';
import 'dart:math';

class Lab3_Dice extends StatefulWidget {
  const Lab3_Dice({Key? key}) : super(key: key);

  @override
  State<Lab3_Dice> createState() => _Lab3_DiceState();
}

class _Lab3_DiceState extends State<Lab3_Dice> {
  // Biến lưu trữ kết quả xúc xắc
  int dice1 = 1;
  int dice2 = 1;
  int rollCount = 0;

  /// Hàm tung xúc xắc
  void rollDices() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
      rollCount++;
    });
  }

  /// Lấy emoji xúc xắc
  String getDiceEmoji(int number) {
    const dices = ['🎲', '1️⃣', '2️⃣', '3️⃣', '4️⃣', '5️⃣', '6️⃣'];
    return dices[number];
  }

  @override
  Widget build(BuildContext context) {
    final total = dice1 + dice2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('🎲 Dice Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Tiêu đề
            const Text(
              'Tung Xúc Xắc',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),

            // Hiển thị 2 xúc xắc
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Xúc xắc 1
                DiceBox(
                  number: dice1,
                  emoji: getDiceEmoji(dice1),
                ),
                const SizedBox(width: 20),

                // Dấu +
                const Text(
                  '+',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                const SizedBox(width: 20),

                // Xúc xắc 2
                DiceBox(
                  number: dice2,
                  emoji: getDiceEmoji(dice2),
                ),
              ],
            ),
            const SizedBox(height: 40),

            // Hiển thị tổng
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Text(
                    'TỔNG CỘNG',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$total',
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    total == 2
                        ? '😱 Số 2 - Xui xẻo quá!'
                        : total == 7
                            ? '🍀 Số 7 - Số may mắn!'
                            : total == 12
                                ? '🎉 Số 12 - Tuyệt vời!'
                                : 'Kết quả: $total',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Nút tung xúc xắc
            ElevatedButton(
              onPressed: rollDices,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                '🎲 TUNG XÚC XẮC',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 30),

            // Thống kê
            Text(
              'Số lần tung: $rollCount',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF2C3E50),
    );
  }
}

/// Widget hiển thị xúc xắc
class DiceBox extends StatelessWidget {
  final int number;
  final String emoji;

  const DiceBox({
    Key? key,
    required this.number,
    required this.emoji,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            emoji,
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 8),
          Text(
            '$number',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}