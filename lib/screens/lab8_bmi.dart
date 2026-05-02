import 'package:flutter/material.dart';

class Lab8_BMI extends StatefulWidget {
  const Lab8_BMI({Key? key}) : super(key: key);

  @override
  State<Lab8_BMI> createState() => _Lab8_BMIState();
}

class _Lab8_BMIState extends State<Lab8_BMI> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double? bmi;
  String? category;
  String? advice;
  Color? categoryColor;

  /// Hàm tính BMI
  void calculateBMI() {
    if (heightController.text.isEmpty || weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập cả chiều cao và cân nặng'),
        ),
      );
      return;
    }

    final height = double.parse(heightController.text) / 100;
    final weight = double.parse(weightController.text);

    if (height <= 0 || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Chiều cao và cân nặng phải lớn hơn 0'),
        ),
      );
      return;
    }

    final calculatedBMI = weight / (height * height);

    String newCategory;
    String newAdvice;
    Color newColor;

    if (calculatedBMI < 18.5) {
      newCategory = 'Gầy';
      newAdvice = 'Bạn cần tăng cân để đạt trọng lượng cân bằng';
      newColor = Colors.green;
    } else if (calculatedBMI < 25) {
      newCategory = 'Bình thường';
      newAdvice = 'Trọng lượng của bạn rất tốt. Hãy duy trì nó!';
      newColor = Colors.blue;
    } else if (calculatedBMI < 30) {
      newCategory = 'Thừa cân';
      newAdvice = 'Bạn nên giảm cân để có sức khỏe tốt hơn';
      newColor = Colors.orange;
    } else {
      newCategory = 'Béo phì';
      newAdvice = 'Bạn nên tham khảo ý kiến bác sĩ';
      newColor = Colors.red;
    }

    setState(() {
      bmi = double.parse(calculatedBMI.toStringAsFixed(1));
      category = newCategory;
      advice = newAdvice;
      categoryColor = newColor;
    });
  }

  /// Reset dữ liệu
  void reset() {
    setState(() {
      heightController.clear();
      weightController.clear();
      bmi = null;
      category = null;
      advice = null;
      categoryColor = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚖️ BMI Calculator'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blue,
              width: double.infinity,
              child: const Column(
                children: [
                  Text(
                    'BMI Calculator',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tính chỉ số khối cơ thể',
                    style: TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Input fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Chiều cao
                  TextField(
                    controller: heightController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Chiều cao (cm)',
                      hintStyle: const TextStyle(color: Colors.white54),
                      prefixIcon: const Icon(Icons.height,
                          color: Colors.blue),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Cân nặng
                  TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Cân nặng (kg)',
                      hintStyle: const TextStyle(color: Colors.white54),
                      prefixIcon: const Icon(Icons.fitness_center,
                          color: Colors.blue),
                      filled: true,
                      fillColor: Colors.white10,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: calculateBMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '🧮 Tính BMI',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '🔄 Xóa',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),

            // Result
            if (bmi != null)
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: categoryColor?.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: categoryColor!),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '$bmi',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: categoryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        category!,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: categoryColor,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        advice!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // BMI Chart
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '📊 Bảng BMI',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      '🟢 Gầy: BMI < 18.5',
                      style: TextStyle(color: Colors.green),
                    ),
                    const Text(
                      '🔵 Bình thường: 18.5 ≤ BMI < 25',
                      style: TextStyle(color: Colors.blue),
                    ),
                    const Text(
                      '🟠 Thừa cân: 25 ≤ BMI < 30',
                      style: TextStyle(color: Colors.orange),
                    ),
                    const Text(
                      '🔴 Béo phì: BMI ≥ 30',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF2C3E50),
    );
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }
}