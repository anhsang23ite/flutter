import 'package:flutter/material.dart';

class Lab2_MiCard extends StatelessWidget {
  const Lab2_MiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎴 MiCard'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Avatar
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.amber,
                  child: const Text(
                    '👨‍💻',
                    style: TextStyle(fontSize: 60),
                  ),
                ),
                const SizedBox(height: 20),

                // Tên
                const Text(
                  'Nguyễn Văn A',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),

                // Chức vụ
                const Text(
                  'Lập Trình Viên Flutter',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.amber,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),

                // Divider
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 1,
                    color: Colors.white30,
                  ),
                ),
                const SizedBox(height: 20),

                // Contact Information
                ContactCard(
                  icon: '📧',
                  label: 'Email',
                  value: 'contact@techcompany.vn',
                ),
                const SizedBox(height: 12),
                ContactCard(
                  icon: '📱',
                  label: 'Phone',
                  value: '+84 123 456 789',
                ),
                const SizedBox(height: 12),
                ContactCard(
                  icon: '📍',
                  label: 'Địa chỉ',
                  value: 'Hà Nội, Việt Nam',
                ),
                const SizedBox(height: 12),
                ContactCard(
                  icon: '🌐',
                  label: 'Website',
                  value: 'www.techcompany.vn',
                ),
                const SizedBox(height: 30),

                // Skills Section
                const Text(
                  'Kỹ Năng',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    SkillBadge(skill: 'Flutter'),
                    SkillBadge(skill: 'Dart'),
                    SkillBadge(skill: 'Firebase'),
                    SkillBadge(skill: 'UI/UX'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color(0xFF1E1E1E),
    );
  }
}

/// Widget hiển thị thông tin liên hệ
class ContactCard extends StatelessWidget {
  final String icon;
  final String label;
  final String value;

  const ContactCard({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white60,
                  fontSize: 11,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Widget hiển thị kỹ năng
class SkillBadge extends StatelessWidget {
  final String skill;

  const SkillBadge({Key? key, required this.skill}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        skill,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}