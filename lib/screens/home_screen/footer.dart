import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, 
      color: Color.fromARGB(255, 193, 235, 233),
      child: Row(mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Image.asset('assets/images/ikialogo.png', scale: 3,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset('assets/images/ikiaphone.png', scale: 10,),
                      SizedBox(width: 3,),
                      Text('+90 505 505 50 05', style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w600),)
                    ],),),
                SizedBox(height: 20,),
                Container(
                  child: Row(
                    children: [
                      Image.asset('assets/images/ikiakonum.png', scale: 10,),
                      SizedBox(width: 3,),
                      Text('Cumhuriye mah. Şen sok. 2/34 \nEskişehir/Türkiye',style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w600))
                    ],),), 
                SizedBox(height: 20,),
                Container(
                  child: Row(
                    children: [
                      Image.asset('assets/images/ikiamail.png', scale: 10,),
                      SizedBox(width: 3,),
                      Text('2abilgisayar@gmail.com',style: TextStyle(fontFamily: 'Raleway',fontWeight: FontWeight.w600))
                    ],),),                              
              ],
            ),
          ),
        ],
      ),
      );
  }
}