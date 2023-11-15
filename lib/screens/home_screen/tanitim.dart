import 'package:flutter/material.dart';

class Tanitim extends StatelessWidget {
  const Tanitim({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Color.fromARGB(255, 255, 255, 255),
    
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(flex: 4,),
              Container(alignment: Alignment.center,height: 400,width: 100, child: Icon(color: Colors.black45,Icons.arrow_back_ios_rounded),),
              Spacer(),
              Container(alignment: Alignment.center,height: 400,width: 400,
                child: const Text(style: TextStyle(fontSize: 24),
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'),
              ),
              Spacer(),
              Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(35)),height: 350,width: 550, child: Image.asset('assets/images/saydam2a.png'),),
              Spacer(),
              Container(height: 400,width: 100, child: Icon(Icons.arrow_forward_ios_rounded),),
              Spacer(flex: 4,),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center,
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
          ],),
          SizedBox(height: 30,)
        ],
      ),
    );
  }
}