import 'package:flutter/material.dart';
import 'dic.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<Map<String, dynamic>> words = dic;
  List<Map<String, dynamic>> sortedWords = [];
  bool isSorted = false;
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayingList = isSorted ? sortedWords : words;
    return Scaffold(
      appBar: AppBar(
        title: const Text('영어 다의어'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        child: Center(
          child: ListView.builder(
              itemCount: displayingList.length,
              itemBuilder: (context, i) {
                Map<String, dynamic> word = displayingList[i];
                return ListTile(
                  leading: loadImage(word),
                  title: Text(
                    '  ${word['word']}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(word['meanings']),
                  onTap: () {},
                );
              }),
        ),
      ),
    );
  }

  Widget loadImage(Map word) {
    return Image.asset(
      word['image1'],
      height: 80,
      width: 70,
      fit: BoxFit.fill,
    );
  }
}
