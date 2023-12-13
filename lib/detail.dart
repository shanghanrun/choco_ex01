import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  const Detail({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Map<String, dynamic> word = arguments['arg1'];

    return Scaffold(
      appBar: AppBar(title: Text(word['title'])),
      body: Center(
        child: Column(
          children: [
            Image.asset(word['image1'], width: 200, fit: BoxFit.fill),
            Text(word['meanings']),
            Text(word['comment1']),
          ],
        ),
      ),
    );
  }
}
