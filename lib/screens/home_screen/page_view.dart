import 'package:flutter/material.dart';

class PageViewApp extends StatefulWidget {
  const PageViewApp({super.key});

  @override
  _PageViewAppState createState() => _PageViewAppState();
}

class _PageViewAppState extends State<PageViewApp> {
  int currentPage = 1;
  int currentSubPage = 0; // Alt sayfa için indeks

  List<String> titles = ['Meyveler', 'Sebzeler', 'Arabalar'];

  List<List<List<String>>> content = [
    [
      ['Elma', 'Armut', 'Erik'],
      ['Kiraz', 'Şeftali', 'Çilek'],
    ],
    [
      ['Domates', 'Patates', 'Biber'],
      ['Patlıcan', 'Havuç', 'Enginar'],
    ],
    [
      ['Toyota', 'Mercedes', 'Audi'],
      ['Ferrari', 'Fiat', 'Renault'],
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Counter'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$currentPage - ${currentSubPage + 1}',
            style: const TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      titles[currentPage - 1],
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: content[currentPage - 1][currentSubPage]
                          .map((item) => ListTile(title: Text(item)))
                          .toList(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  changeSubPage(-1);
                },
                child: const Text('<'),
              ),
              ElevatedButton(
                onPressed: () {
                  changeSubPage(1);
                },
                child: const Text('>'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () {
                  changePage(-1);
                },
                child: const Text('-'),
              ),
              ElevatedButton(
                onPressed: () {
                  changePage(1);
                },
                child: const Text('+'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void changeSubPage(int delta) {
    setState(() {
      currentSubPage += delta;

      // Alt sayfa geçişleri
      if (currentSubPage < 0) {
        currentSubPage = 0;
      } else if (currentSubPage >= content[currentPage - 1].length) {
        currentSubPage = content[currentPage - 1].length - 1;
      }
    });
  }

  void changePage(int delta) {
    setState(() {
      currentPage += delta;
      currentSubPage = 0;

      if (currentPage < 1) {
        currentPage = 1;
      } else if (currentPage > 3) {
        currentPage = 3;
      }
    });
  }
}

class W1 extends StatefulWidget {
  const W1({super.key});

  @override
  State<W1> createState() => _W1State();
}

class _W1State extends State<W1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const W2(text: 'merhaba'),
    );
  }
}

class W2 extends StatefulWidget {
  const W2({super.key, required this.text});
  final String text;

  @override
  State<W2> createState() => _W2State();
}

class _W2State extends State<W2> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text);
  }
}
