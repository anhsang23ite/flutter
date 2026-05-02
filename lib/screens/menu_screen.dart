import 'package:flutter/material.dart';
import 'lab1_i_am_rich.dart';
import 'lab2_micard.dart';
import 'lab3_dice.dart';
import 'lab4_magic8ball.dart';
import 'lab5_xylophone.dart';
import 'lab6_quizzler.dart';
import 'lab7_destini.dart';
import 'lab8_bmi.dart';
import 'lab9_clima.dart';

/// Menu chính - Danh sách tất cả Lab
class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Danh sách các Lab
    final List<LabItem> labs = [
      LabItem(
        id: 1,
        title: 'I Am Rich',
        description: 'Hiển thị danh tính của bạn',
        emoji: '💎',
        screen: const Lab1_IAmRich(),
      ),
      LabItem(
        id: 2,
        title: 'MiCard',
        description: 'Danh thiếp cá nhân',
        emoji: '🎴',
        screen: const Lab2_MiCard(),
      ),
      LabItem(
        id: 3,
        title: 'Dice',
        description: 'Tung xúc xắc ngẫu nhiên',
        emoji: '🎲',
        screen: const Lab3_Dice(),
      ),
      LabItem(
        id: 4,
        title: 'Magic 8 Ball',
        description: 'Bóng ma thuật trả lời câu hỏi',
        emoji: '🎱',
        screen: const Lab4_Magic8Ball(),
      ),
      LabItem(
        id: 5,
        title: 'Xylophone',
        description: 'Phát âm thanh từ các nút nhạc',
        emoji: '🎸',
        screen: const Lab5_Xylophone(),
      ),
      LabItem(
        id: 6,
        title: 'Quizzler',
        description: 'Trắc nghiệm Đúng/Sai',
        emoji: '❓',
        screen: Lab6_Quizzler(),
      ),
      LabItem(
        id: 7,
        title: 'Destini',
        description: 'Chuyện có lựa chọn nhánh',
        emoji: '📖',
        screen: Lab7_Destini(),
      ),
      LabItem(
        id: 8,
        title: 'BMI Calculator',
        description: 'Tính chỉ số khối cơ thể',
        emoji: '⚖️',
        screen: const Lab8_BMI(),
      ),
      LabItem(
        id: 9,
        title: 'Clima',
        description: 'Xem thời tiết từ API',
        emoji: '🌤️',
        screen: Lab9_Clima(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('📚 Các Phòng Lab'),
        elevation: 0,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: labs.length,
        itemBuilder: (context, index) {
          final lab = labs[index];
          return LabCard(
            lab: lab,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => lab.screen),
              );
            },
          );
        },
      ),
    );
  }
}

/// Model dữ liệu cho mỗi Lab
class LabItem {
  final int id;
  final String title;
  final String description;
  final String emoji;
  final Widget screen;

  LabItem({
    required this.id,
    required this.title,
    required this.description,
    required this.emoji,
    required this.screen,
  });
}

/// Widget hiển thị từng Lab
class LabCard extends StatelessWidget {
  final LabItem lab;
  final VoidCallback onTap;

  const LabCard({
    Key? key,
    required this.lab,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3,
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: const Color(0xFF2196F3),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              '${lab.id}',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            Text(
              lab.emoji,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    lab.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    lab.description,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        trailing: const Icon(Icons.arrow_forward, color: Color(0xFF2196F3)),
        onTap: onTap,
      ),
    );
  }
}