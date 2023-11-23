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
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 236, 242, 252).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 12,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Center(
          child: ListView.builder(
              itemExtent: 120,
              itemCount: displayingList.length,
              itemBuilder: (context, i) {
                Map<String, dynamic> word = displayingList[i];
                String imageName = word['image1'];
                String wordName = word['word'];
                String meanings = word['meanings'];
                return Card(
                  elevation: 5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 10),
                      SizedBox(
                        width: 110,
                        height: 80,
                        child: loadImage(imageName),
                      ),
                      const SizedBox(width: 30), // 이미지와 텍스트 사이 간격 조정
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              wordName,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5), // 텍스트 사이 간격 조정
                            Text(
                              meanings,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(255, 50, 60, 80),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget loadImage(String imageName) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 156, 150, 156).withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 12,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Image.asset(imageName, height: 80, width: 110, fit: BoxFit.fill),
    );
  }
}
