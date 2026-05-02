/// Model dữ liệu cho node câu chuyện trong Destini
class StoryNode {
  final String text;
  final String choice1;
  final int? choice1Next;
  final String choice2;
  final int? choice2Next;

  StoryNode({
    required this.text,
    required this.choice1,
    required this.choice1Next,
    required this.choice2,
    required this.choice2Next,
  });

  bool get isEnd => choice2Next == null;
}

/// Ngân hàng câu chuyện
class StoryBank {
  static final Map<int, StoryNode> storyData = {
    1: StoryNode(
      text:
          'Bạn thức dậy giữa đêm trong một căn phòng lạ. Có một ánh sáng nhấp nháy dưới giường và một tiếng gõ nhẹ bên cửa.',
      choice1: 'Mở cửa và khám phá hành lang',
      choice1Next: 2,
      choice2: 'Ở lại giường và lắng nghe',
      choice2Next: 3,
    ),
    2: StoryNode(
      text:
          'Hành lang dẫn đến một cánh cửa phát sáng. Bên trong có tiếng thì thầm như mời gọi bạn vào.',
      choice1: 'Bước vào cánh cửa phát sáng',
      choice1Next: 4,
      choice2: 'Quay lại phòng và tìm lối khác',
      choice2Next: 5,
    ),
    3: StoryNode(
      text:
          'Bạn nghe tiếng rì rầm và cảm thấy một làn gió lạnh. Bạn có thể mở cửa sổ hoặc tiếp tục chờ bình minh.',
      choice1: 'Mở cửa và nhìn ra ngoài',
      choice1Next: 5,
      choice2: 'Giữ im lặng và chờ sáng',
      choice2Next: 6,
    ),
    4: StoryNode(
      text:
          'Bạn bước vào thế giới khác, nơi sinh vật huyền bí đang chờ. Bạn phải chọn đồng minh.',
      choice1: 'Gia nhập chiến binh ánh sáng',
      choice1Next: 7,
      choice2: 'Chạy vào bóng tối để ẩn nấp',
      choice2Next: 8,
    ),
    5: StoryNode(
      text:
          'Bạn tìm thấy một cánh cửa bí mật dưới giường. Một luồng sáng dịu dàng phát ra từ bên trong.',
      choice1: 'Mở cửa bí mật',
      choice1Next: 4,
      choice2: 'Đóng lại và gọi người thân',
      choice2Next: 6,
    ),
    6: StoryNode(
      text:
          'Bình minh đến. Mọi thứ trở lại bình thường. Bạn đã sống sót sau một đêm kỳ lạ.',
      choice1: 'Chơi lại',
      choice1Next: 1,
      choice2: 'Thoát',
      choice2Next: null,
    ),
    7: StoryNode(
      text:
          'Bạn chiến thắng thử thách và trở thành anh hùng của thế giới huyền bí. Kết thúc đầy vinh quang.',
      choice1: 'Chơi lại',
      choice1Next: 1,
      choice2: 'Thoát',
      choice2Next: null,
    ),
    8: StoryNode(
      text:
          'Bạn lạc vào bóng tối và tỉnh dậy trong phòng mình, không biết đó là mơ hay thực.',
      choice1: 'Chơi lại',
      choice1Next: 1,
      choice2: 'Thoát',
      choice2Next: null,
    ),
  };

  /// Lấy node câu chuyện theo ID
  static StoryNode? getStory(int storyId) {
    return storyData[storyId];
  }

  /// Lấy tổng số node
  static int getTotalStories() {
    return storyData.length;
  }
}