import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ikiabilgisayar/constants.dart';

class Tanitim extends StatefulWidget {
  const Tanitim({super.key});

  @override
  State<Tanitim> createState() => _TanitimState();
}

class _TanitimState extends State<Tanitim> {
  late PageController _pageController;
  late Timer _timer;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startTimer() {
    // 3 saniyede bir _onTimerTick fonksiyonunu çağır
    _timer = Timer.periodic(const Duration(seconds: 4), _onTimerTick);
  }

  void _onTimerTick(Timer timer) {
    // Sayfa sayısını kontrol et
    if (currentPage < tanitimData.length - 1) {
      // Eğer sayfa sayısı son sayfadan önceyse bir sonraki sayfaya animasyonlu bir şekilde git
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
  }

  void _resetTimer() {
    // Zamanlayıcıyı sıfırla
    _timer.cancel();
    // Zamanlayıcıyı tekrar başlat
    _startTimer();
  }

  List<Map<String, dynamic>> tanitimData = [
    {
      'text': TanitimText1,
      'image': 'assets/images/experience_photo.png',
    },
    {
      'text': TanitimText2,
      'image': 'assets/images/erp.png',
    },
    {
      'text': TanitimText3,
      'image': 'assets/images/kalitecark.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: TanitimFon(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Spacer(
              //   flex: 4,
              // ),
              TanitimSolaGidisButonu(),
              //const Spacer(),
              SizedBox(
                height: 400,
                width: 1100,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: tanitimData.length,
                    onPageChanged: (int page) {
                      setState(() {
                        currentPage = page;
                      });
                    },
                    itemBuilder: (context, index) => TanitimIcerik(
                          text: tanitimData[index]['text'],
                          image: tanitimData[index]['image'],
                        )),
              ),
              //const Spacer(),
              TanitimSagaGidisButonu(),
              // const Spacer(
              //   flex: 4,
              // ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              tanitimData.length,
              (index) => buildDot(index: index),
            ),
          ),
          //const GeciciNoktalar(),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 45 : 10,
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: const Color.fromARGB(255, 16, 112, 127)),
          color: currentPage == index
              ? const Color.fromARGB(255, 7, 196, 221)
              : const Color.fromARGB(180, 128, 142, 143),
          borderRadius: BorderRadius.circular(20)),
      duration: const Duration(milliseconds: 1500),
      curve: Curves.easeOutExpo,
    );
  }

  BoxDecoration TanitimFon() => const BoxDecoration(
      gradient: RadialGradient(
          focal: Alignment.center,
          focalRadius: BorderSide.strokeAlignOutside,
          radius: 0.5,
          stops: [0.1, 0.9],
          center: Alignment.topCenter,
          tileMode: TileMode.repeated,
          colors: [
            Color.fromARGB(27, 250, 251, 251),
            Color.fromARGB(80, 169, 234, 232),
          ])
      // LinearGradient(
      //     colors: [ikiaYesilFon3, ikiaMaviFon3],
      //     stops: [0.6, 1],
      //     begin: Alignment.topLeft,
      //     end: Alignment.bottomRight)
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
              _resetTimer();
            } else {
              // Eğer son sayfadaysa başa dön
              _pageController.animateToPage(
                tanitimData.length - 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              _resetTimer();
            }
          },
        ),
      );

  Container TanitimSagaGidisButonu() => Container(
        alignment: Alignment.center,
        height: 200,
        width: 100,
        child: IconButton(
          icon: const Icon(Icons.arrow_forward_ios_rounded),
          onPressed: () {
            if (_pageController.page! < tanitimData.length - 1) {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              _resetTimer();
            } else {
              // Eğer son sayfadaysa başa dön
              _pageController.animateToPage(
                0,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              _resetTimer();
            }
          },
        ),
      );
}

class TanitimIcerik extends StatelessWidget {
  const TanitimIcerik({super.key, required this.text, required this.image});
  final String text;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // IMAGE
        Container(
          margin: const EdgeInsets.all(50),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(35)),
          height: 300,
          width: 450,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(35),
              clipBehavior: Clip.hardEdge,
              child: Align(
                  alignment: Alignment.center,
                  heightFactor: 0.9,
                  child: Image.asset(
                    height: 400,
                    image,
                    fit: BoxFit.cover,
                  ))),
        ),
        const SizedBox(width: 20),

        // TEXT
        Container(
          alignment: Alignment.center,
          height: 400,
          width: 400,
          child: Text(
              textAlign: TextAlign.center,
              style: const TextStyle(
                  letterSpacing: 5,
                  color: ikiaSiyah,
                  fontSize: 30,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600),
              text),
        ),
      ],
    );
  }
}

class TanitimResimleri extends StatelessWidget {
  const TanitimResimleri({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(35)),
      height: 350,
      width: 550,
      child: Image.asset('assets/images/ikialogo.png'),
    );
  }
}

class TanitimYazisi extends StatelessWidget {
  const TanitimYazisi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 400,
      width: 400,
      child: const Text(
          textAlign: TextAlign.justify,
          style: TextStyle(
              color: ikiaSiyah,
              fontSize: 20,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600),
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
    );
  }
}

class GeciciNoktalar extends StatelessWidget {
  const GeciciNoktalar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 6,
          width: 30,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: const Color.fromARGB(255, 4, 49, 56)),
              color: const Color.fromARGB(255, 7, 196, 221),
              borderRadius: BorderRadius.circular(20)),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 6,
          width: 8,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: const Color.fromARGB(255, 4, 49, 56)),
              color: const Color.fromARGB(255, 99, 112, 113),
              borderRadius: BorderRadius.circular(20)),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 6,
          width: 8,
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: const Color.fromARGB(255, 4, 49, 56)),
              color: const Color.fromARGB(255, 99, 112, 113),
              borderRadius: BorderRadius.circular(20)),
        )
      ],
    );
  }
}
