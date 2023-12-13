import 'package:flutter/material.dart';
import 'dic.dart';

class PageOne extends StatefulWidget {
  const PageOne({super.key});
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  List<Map<String, dynamic>> list = dic;
  List<Map<String, dynamic>> sortedList = [];
  bool isSorted = false;
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    //탭에 따른 라우팅
    if (index == 0) {
      Navigator.pushNamed(context, '/two');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/three');
    }
  }

  @override
  void initState() {
    super.initState();
    //Dart에서는 클래스의 필드 초기화 시점에 메소드를 실행할 수 없다.
    // 그래서 initState에서 sortedWords에 sort()메서드를 사용한다.
    sortedList = List.from(list); //정렬를 하기 전에 복사. list와 분리
    sortedList
        .sort((a, b) => (a['word'] as String).compareTo(b['word'] as String));
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> displayingList = isSorted ? sortedList : list;
    return Scaffold(
      appBar: AppBar(
        title: const Text('영어 다의어'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isSorted = !isSorted;
              });
            },
            child: Text(isSorted ? '원래 순서대로' : '알파벳순'),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 244, 247, 253).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 12,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Center(
          child: ListView.builder(
              itemCount: displayingList.length,
              itemBuilder: (context, i) {
                Map<String, dynamic> word = displayingList[i];
                String imageName = word['image1'];
                String wordName = word['title'];
                String meanings = word['meanings'];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail',
                        arguments: {'arg1': word});
                  },
                  child: Card(
                    elevation: 5,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 120,
                          height: 100,
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
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5), // 텍스트 사이 간격 조정
                              Text(
                                meanings,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 50, 60, 80),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '현재완료',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: '가정법',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
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
      child: Image.asset(imageName, height: 90, width: 110, fit: BoxFit.fill),
    );
  }
}
