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

          Image.asset('assets/images/saydam2a.png'),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                  children: [
                  Icon(Icons.phone),
                  SizedBox(width: 3,),
                  Text('+90 505 505 50 05')
                ],),),
                SizedBox(height: 8,),
                Container(child: Row(children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 3,),
                  Text('Cumhuriye mah. Şen sok. 2/34 \nEskişehir/Türkiye')
                ],),), 
                SizedBox(height: 8,),
                Container(child: Row(children: [
                  Icon(Icons.mail_outline_outlined),
                  SizedBox(width: 3,),
                  Text('2abilgisayar@gmail.com')
                ],),),                              
              ],
            ),
          ),
        ],
      ),
      );
  }
}