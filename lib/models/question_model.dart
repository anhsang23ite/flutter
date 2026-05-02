/// Model dữ liệu cho câu hỏi trong Quizzler
class Question {
  final String text;
  final bool answer;

  Question({
    required this.text,
    required this.answer,
  });
}

/// Danh sách các câu hỏi mẫu (Dạng Đúng/Sai)
class QuestionBank {
  static final List<Question> questions = [
    Question(
      text: 'Flutter được phát triển bởi Google',
      answer: true,
    ),
    Question(
      text: 'Dart là ngôn ngữ lập trình chính của Flutter',
      answer: true,
    ),
    Question(
      text: 'StatefulWidget không thể thay đổi trạng thái',
      answer: false,
    ),
    Question(
      text: 'BuildContext được sử dụng để truy cập trạng thái widget',
      answer: true,
    ),
    Question(
      text: 'MaterialApp là một widget không bắt buộc trong Flutter',
      answer: false,
    ),
    Question(
      text: 'Padding là widget dùng để thêm khoảng cách xung quanh widget con',
      answer: true,
    ),
    Question(
      text:
          'setState() được sử dụng để cập nhật giao diện trong StatelessWidget',
      answer: false,
    ),
    Question(
      text: 'Column và Row đều là widget có sẵn trong Flutter',
      answer: true,
    ),
    Question(
      text: 'Hot Reload chỉ hoạt động khi khởi động lại ứng dụng hoàn toàn',
      answer: false,
    ),
    Question(
      text: 'Scaffold cung cấp cấu trúc cơ bản cho ứng dụng Material Design',
      answer: true,
    ),
  ];

  /// Lấy câu hỏi theo index
  static Question getQuestion(int index) {
    return questions[index];
  }

  /// Lấy tổng số câu hỏi
  static int getTotalQuestions() {
    return questions.length;
  }
}
