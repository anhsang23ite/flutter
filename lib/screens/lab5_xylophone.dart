import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Lab5_Xylophone extends StatefulWidget {
  const Lab5_Xylophone({Key? key}) : super(key: key);

  @override
  State<Lab5_Xylophone> createState() => _Lab5_XylophoneState();
}

class _Lab5_XylophoneState extends State<Lab5_Xylophone> {
  late AudioPlayer audioPlayer;

  // Danh sách các nốt nhạc
  final List<Note> notes = [
    Note(name: 'Do', color: Colors.red, note: 'C', asset: 'audio/note1.wav'),
    Note(name: 'Re', color: Colors.orange, note: 'D', asset: 'audio/note2.wav'),
    Note(name: 'Mi', color: Colors.yellow, note: 'E', asset: 'audio/note3.wav'),
    Note(name: 'Fa', color: Colors.green, note: 'F', asset: 'audio/note4.wav'),
    Note(name: 'Sol', color: Colors.blue, note: 'G', asset: 'audio/note5.wav'),
    Note(name: 'La', color: Colors.indigo, note: 'A', asset: 'audio/note6.wav'),
    Note(name: 'Ti', color: Colors.purple, note: 'B', asset: 'audio/note7.wav'),
  ];

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  /// Hàm phát âm thanh
  void playNote(Note note) async {
    try {
      await audioPlayer.play(AssetSource(note.asset));
    } catch (error) {
      debugPrint('Lỗi phát âm thanh: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Không thể phát âm thanh ${note.name}.'),
          duration: const Duration(seconds: 1),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🎸 Xylophone'),
      ),
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue,
            width: double.infinity,
            child: const Column(
              children: [
                Text(
                  'Xylophone',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Bấm các nút để phát âm thanh',
                  style: TextStyle(
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          // Các nút nhạc
          Expanded(
            child: Column(
              children: notes.map((note) {
                return Expanded(
                  child: GestureDetector(
                    onTap: () => playNote(note),
                    child: Container(
                      color: note.color,
                      margin: const EdgeInsets.all(4),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              note.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              note.note,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          // Info
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.grey[900],
            child: const Text(
              '💡 Ghi chú: Do, Re, Mi, Fa, Sol, La, Ti\n'
              'Bấm các nút để phát âm thanh tương ứng',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}

/// Model dữ liệu cho mỗi nốt nhạc
class Note {
  final String name;
  final Color color;
  final String note;
  final String asset;

  Note({
    required this.name,
    required this.color,
    required this.note,
    required this.asset,
  });
}