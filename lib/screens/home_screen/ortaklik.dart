import 'package:flutter/material.dart';
import 'package:ikiabilgisayar/constants.dart';

class Ortaklik extends StatelessWidget {
  const Ortaklik({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(100),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          color: const Color.fromARGB(255, 255, 255, 255),
          gradient: const RadialGradient(
            colors: [
              Color.fromARGB(35, 26, 192, 192),
              Color.fromARGB(5, 100, 90, 90)
            ],
            center: Alignment.bottomCenter,
            tileMode: TileMode.repeated,
            stops: [0.1, 0.9],
            focal: Alignment.topRight,
            radius: 0.8,
            transform: GradientRotation(0.25),
          ),
          border: Border.all(color: Colors.transparent)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              height: 450,
              width: 600,
              child: const OrtaklarKutusu()),
          Container(
            color: Colors.transparent,
            height: 450,
            width: 600,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 400,
                      width: 100,
                      child: const Icon(Icons.arrow_back_ios,
                          color: Color.fromARGB(70, 97, 110, 110),
                          shadows: [
                            BoxShadow(
                                blurRadius: 0.9,
                                color: Color.fromARGB(70, 151, 158, 158))
                          ]),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(35)),
                      height: 250,
                      width: 200,
                      child: const Column(
                        children: [
                          Spacer(
                            flex: 3,
                          ),
                          Text(
                            'ERP Programı',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            style: TextStyle(),
                            fillerMadde,
                          ),
                          Spacer(),
                          //GeciciNokta(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 400,
                      width: 100,
                      child: Icon(Icons.arrow_forward_ios_rounded,
                          color: Color.fromARGB(255, 25, 146, 150),
                          shadows: [
                            BoxShadow(
                                blurRadius: 0.9,
                                color: Color.fromARGB(255, 160, 218, 221))
                          ]),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GeciciNokta extends StatelessWidget {
  const GeciciNokta({
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

class OrtaklarKutusu extends StatefulWidget {
  const OrtaklarKutusu({Key? key}) : super(key: key);

  @override
  State<OrtaklarKutusu> createState() => _OrtaklarKutusuState();
}

class _OrtaklarKutusuState extends State<OrtaklarKutusu>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<double> tabIconSizes = [40.0, 80.0, 40.0]; // Initial sizes
  List tabIconColors = [
    const Color.fromARGB(100, 255, 255, 255),
    Colors.transparent,
    const Color.fromARGB(100, 255, 255, 255)
  ]; // Initial colors
  List<double> tabImageOpacities = [0.5, 1.0, 0.5]; // Initial sizes

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    _tabController.addListener(_updateTabSizes);
  }

  void _updateTabSizes() {
    setState(() {
      for (int i = 0; i < tabIconSizes.length; i++) {
        tabIconSizes[i] = (_tabController.index == i) ? 80.0 : 40.0;
        tabImageOpacities[i] = (_tabController.index == i) ? 1.0 : 0.5;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(0, 244, 67, 54),
          toolbarHeight: 40,
          bottom: TabBar(
            dividerColor: Colors.transparent,
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            indicatorColor: Colors.transparent,
            controller: _tabController,
            tabs: <Widget>[
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      AnimatedContainer(
                        curve: Curves.decelerate,
                        height: tabIconSizes[0],
                        duration: const Duration(milliseconds: 200),
                        child: Opacity(
                          opacity: tabImageOpacities[0],
                          child: Image.asset(
                            "assets/images/netolojihdlogo.png",
                            height: double.maxFinite,
                          ),
                        ),
                        // Opaklık değeri (0.0 ile 1.0 arasında)
                      )
                    ],
                  ),
                  //Container(height: 80,width: 150,color: tabIconColors[0]),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      AnimatedContainer(
                        curve: Curves.decelerate,
                        height: tabIconSizes[1],
                        duration: const Duration(milliseconds: 300),
                        child: Opacity(
                          opacity: tabImageOpacities[1],
                          child: Image.asset(
                            "assets/images/diahdlogo.png",
                            height: double.maxFinite,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 80, width: 150),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    children: [
                      AnimatedContainer(
                        curve: Curves.decelerate,
                        height: tabIconSizes[2],
                        duration: const Duration(milliseconds: 300),
                        child: Opacity(
                          opacity: tabImageOpacities[2],
                          child: Image.asset(
                            "assets/images/oduyohdlogo.png",
                            height: double.maxFinite,
                          ),
                        ),
                      )
                    ],
                  ),
                  //Container(height: 80,width: 150,color: tabIconColors[2]),
                ],
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'NETOLOJİ YAZILIM',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 32,
                      fontWeight: FontWeight.w800),
                ),
                Spacer(),
                SizedBox(
                    width: 400,
                    child: Center(
                      child: Text(
                          maxLines: 6,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.fade,
                          ),
                          textAlign: TextAlign.center,
                          fillerText),
                    )),
                Spacer(flex: 2),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'DİA YAZILIM',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                SizedBox(
                    width: 400,
                    child: Center(
                      child: Text(
                          maxLines: 6,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textAlign: TextAlign.center,
                          fillerText4x),
                    )),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                ),
                Text(
                  'ÖDÜYO YAZILIM',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                SizedBox(
                    width: 400,
                    child: Center(
                      child: Text(
                          maxLines: 6,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                          textAlign: TextAlign.center,
                          fillerText2x),
                    )),
                Spacer(
                  flex: 2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
