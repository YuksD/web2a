import 'package:flutter/material.dart';
import 'package:ikiabilgisayar/constants.dart';

class OrtakUrunleri extends StatefulWidget {
  const OrtakUrunleri({super.key, required this.urunlerTitle});
  final String urunlerTitle;
  @override
  State<OrtakUrunleri> createState() => _OrtakUrunleriState();
}

class _OrtakUrunleriState extends State<OrtakUrunleri> {
  late PageController _pageController;

  int currentPage = 0;
  List<Map<String, dynamic>> OrtakUrunData = [
    {
      'text': OduyoProducts,
    },
    {
      'text': NetolojiProducts,
    },
    {
      'text': 'TanitimText3',
    }
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TanitimSolaGidisButonu(),
        SizedBox(
          height: 300,
          width: 250,
          child: PageView.builder(
              controller: _pageController,
              itemCount: OrtakUrunData.length,
              onPageChanged: (int page) {
                setState(() {
                  currentPage = page;
                });
              },
              itemBuilder: (context, index) => OrtakUrunICerik(
                    textTitle: widget.urunlerTitle,
                    text: OrtakUrunData[index]['text'],
                  )),
        ),
        TanitimSagaGidisButonu()
      ],
    );
  }

  Container TanitimSagaGidisButonu() => Container(
        alignment: Alignment.center,
        height: 200,
        width: 100,
        child: IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () {
            if (_pageController.page! < OrtakUrunData.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              // Eğer son sayfadaysa başa dön
              _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      );
  Container TanitimSolaGidisButonu() => Container(
        alignment: Alignment.center,
        height: 200,
        width: 100,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            if (_pageController.page! > 0) {
              _pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              // Eğer son sayfadaysa başa dön
              _pageController.animateToPage(
                OrtakUrunData.length - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      );
}

class OrtakUrunICerik extends StatelessWidget {
  const OrtakUrunICerik(
      {super.key, required this.text, required this.textTitle});
  final String text;
  final String textTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 450,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:
            // TEXT
            [
          Container(
            alignment: Alignment.center,
            height: 100,
            width: 250,
            child: Text(
                textAlign: TextAlign.start,
                style: const TextStyle(
                    letterSpacing: 0,
                    color: ikiaSiyah,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600),
                textTitle),
          ),
          Container(
            alignment: Alignment.center,
            height: 200,
            width: 250,
            child: Text(
                textAlign: TextAlign.start,
                style: const TextStyle(
                    letterSpacing: 0,
                    color: ikiaSiyah,
                    fontSize: 20,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w600),
                text),
          ),
        ],
      ),
    );
  }
}
