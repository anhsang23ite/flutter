import 'package:flutter/material.dart';
import 'package:labs_app/models/story_model.dart';

class Lab7_Destini extends StatefulWidget {
  const Lab7_Destini({Key? key}) : super(key: key);

  @override
  State<Lab7_Destini> createState() => _Lab7_DestiniState();
}

class _Lab7_DestiniState extends State<Lab7_Destini> {
  int currentStoryId = 1;

  StoryNode? get currentStory => StoryBank.getStory(currentStoryId);

  void chooseOption(int? nextId) {
    if (nextId == null) {
      setState(() {
        currentStoryId = 1;
      });
      return;
    }

    setState(() {
      currentStoryId = nextId;
    });
  }

  @override
  Widget build(BuildContext context) {
    final story = currentStory;

    return Scaffold(
      appBar: AppBar(
        title: const Text('📖 Destini'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: story == null
            ? const Center(child: Text('Không có câu chuyện.', style: TextStyle(color: Colors.white)))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        story.text,
                        style: const TextStyle(fontSize: 22, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => chooseOption(story.choice1Next),
                    child: Text(story.choice1),
                  ),
                  if (!story.isEnd) ...[
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => chooseOption(story.choice2Next),
                      child: Text(story.choice2),
                    ),
                  ],
                ],
              ),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}