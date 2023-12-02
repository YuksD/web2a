import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ikiabilgisayar/constants.dart';

class Tanitim extends StatelessWidget {
  const Tanitim({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(decoration: TanitimFon(),
    
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 4,),
              TanitimSolaGidisButonu(),
              const Spacer(),
              const TanitimYazisi(),
              const Spacer(),
              const TanitimResimleri(),
              const Spacer(),
              TanitimSagaGidisButonu(),
              const Spacer(flex: 4,),
            ],
          ),
          GeciciNoktalar(),
          SizedBox(height: 30,)
        ],
      ),
    );
  }

  BoxDecoration TanitimFon() => BoxDecoration(
      gradient: LinearGradient(colors: [ikiaYesilFon,ikiaMaviFon], stops: [0.6,1], begin: Alignment.topLeft, end: Alignment.bottomRight)
      );

  Container TanitimSagaGidisButonu() => Container(height: 200,width: 100, child: Icon(color: ikiaSiyah,Icons.arrow_forward_ios_rounded, size: 50, ),);

  Container TanitimSolaGidisButonu() => Container(alignment: Alignment.center,height: 200,width: 100, child: Icon(color: ikiaGri,Icons.arrow_back_ios_rounded, size: 50),);
}

class GeciciNoktalar extends StatelessWidget {
  const GeciciNoktalar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Container(
        height: 6, width: 30, decoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(color: Color.fromARGB(255, 4, 49, 56)),color: Color.fromARGB(255, 7, 196, 221), borderRadius: BorderRadius.circular(20) ),
      ),
      SizedBox(width: 8,),
    
                  Container(
        height: 6, width: 8, decoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(color: Color.fromARGB(255, 4, 49, 56)),color: Color.fromARGB(255, 99, 112, 113), borderRadius: BorderRadius.circular(20) ),
      ),
      SizedBox(width: 8,),
                  Container(
        height: 6, width: 8, decoration: BoxDecoration(shape: BoxShape.rectangle, border: Border.all(color: Color.fromARGB(255, 4, 49, 56)),color: Color.fromARGB(255, 99, 112, 113), borderRadius: BorderRadius.circular(20) ),
      )
    ],);
  }
}

class TanitimResimleri extends StatelessWidget {
  const TanitimResimleri({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(35)),height: 350,width: 550, child: Image.asset('assets/images/ikialogo.png'),);
  }
}

class TanitimYazisi extends StatelessWidget {
  const TanitimYazisi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(alignment: Alignment.center,height: 400,width: 400,
      child: const Text(textAlign: TextAlign.justify, style: TextStyle( color: ikiaSiyah,fontSize: 20, fontFamily: 'Raleway', fontWeight: FontWeight.w600),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
    );
  }
}