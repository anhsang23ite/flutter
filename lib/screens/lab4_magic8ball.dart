import 'package:flutter/material.dart';
import 'dart:math';

class Lab4_Magic8Ball extends StatefulWidget {
  const Lab4_Magic8Ball({Key? key}) : super(key: key);

  @override
  State<Lab4_Magic8Ball> createState() => _Lab4_Magic8BallState();
}

class _Lab4_Magic8BallState extends State<Lab4_Magic8Ball>
    with SingleTickerProviderStateMixin {
  // Danh sách câu trả lời
  final List<String> answers = [
    'Có',
    'Không',
    'Có thể',
    'Chắc chắn',
    'Không bao giờ',
    'Hỏi lại sau',
    'Tất nhiên',
    'Không thể',
    'Rất có thể',
    'Không nên',
    'Thời gian sẽ trả lời',
    'Hoàn toàn có thể',
    'Tuyệt đối không',
    'Có thể đúng',
    'Không chắc',
  ];

  late String currentAnswer;
  bool isShaking = false;
  int askCount = 0;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    currentAnswer = 'Hỏi đi...';
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  /// Hàm xử lý khi bấm bóng ma thuật
  void askMagicBall() async {
    if (isShaking) return;

    setState(() {
      isShaking = true;
    });

    // Animation shake
    await _animationController.forward().then((_) {
      _animationController.reverse();
    });

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      currentAnswer = answers[Random().nextInt(answers.length)];
      askCount++;
      isShaking = false;
    });
  }

  Color getAnswerColor(String answer) {
    if (answer == 'Hỏi đi...') return Colors.grey;
    if (['Có', 'Chắc chắn', 'Tất nhiên', 'Rất có thể', 'Hoàn toàn có thể']
        .contains(answer)) {
      return Colors.green;
    }
    if (['Không', 'Không bao giờ', 'Không thể', 'Không nên', 'Tuyệt đối không']
        .contains(answer)) {
      return Colors.red;
    }
    return Colors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎱 Magic 8 Ball'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hướng dẫn
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '💭 Suy nghĩ về một câu hỏi rồi bấm vào bóng',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 60),

            // Bóng ma thuật
            GestureDetector(
              onTap: askMagicBall,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: (isShaking ? _animationController.value * 0.3 : 0),
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 20,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: getAnswerColor(currentAnswer),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '8',
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    currentAnswer,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 60),

            // Status
            Text(
              isShaking ? '🔮 Đang suy nghĩ...' : 'Bấm vào bóng để hỏi',
              style: TextStyle(
                fontSize: 16,
                color: isShaking ? Colors.amber : Colors.white70,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 30),

            // Thống kê
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Số lần hỏi: $askCount',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF2C3E50),
    );
  }
}