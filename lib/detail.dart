import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Map<String, dynamic> wordMap = args['arg1'];
    int index = args['arg2'];

    return Scaffold(
      appBar: AppBar(title: Text(wordMap['word'])),
      body: Center(
        child: Column(
          children: [
            Image.asset(wordMap['image1'], width: 200, fit: BoxFit.fill),
            Text(wordMap['meanings']),
            Text(wordMap['comment1']),
          ],
        ),
      ),
    );
  }
}
