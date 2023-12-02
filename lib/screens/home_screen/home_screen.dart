import 'package:flutter/material.dart';
import 'package:ikiabilgisayar/constants.dart';
import 'package:ikiabilgisayar/screens/home_screen/footer.dart';
import 'package:ikiabilgisayar/screens/home_screen/ortaklik.dart';
import 'package:ikiabilgisayar/screens/home_screen/tanitim.dart';

class AnaSayfa extends StatelessWidget {
  const AnaSayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(scrolledUnderElevation:0 ,backgroundColor: ikiaBeyaz,
          toolbarHeight: 140,
          title: Padding(
          padding: const EdgeInsets.only(bottom: 20,top: 60, left: 150, right: 150),
          child: Row(
            children:[
              SizedBox(child: Image.asset("assets/images/ikialogo.png", scale: 6,)),
              const Spacer(),
              const NavBarTitle(title:'Çözümler'),
              const SizedBox(width: 20,),
              const NavBarTitle(title:'Başarı Hikayeleri'),
              const SizedBox(width: 20,),
              const NavBarTitle(title:'Kampanyalar'),
              const SizedBox(width: 20,),
              const NavBarTitle(title:'Blog'),
              const SizedBox(width: 20,),
              const NavBarTitle(title:'İletişim'),

          
          
          
            ],
          ),
        ),        
        ),
        body:  SingleChildScrollView(
          child: Column(children:[
            Tanitim(),
            Ortaklik(),
            Footer(),
            

          
          
          
          ]
          
          ),
        ),
      ),
    );
  }
}

class NavBarTitle extends StatefulWidget {
    const NavBarTitle({
    super.key, required this.title,
  });
  final String title;

  @override
  State<NavBarTitle> createState() => _NavBarTitleState();
}

class _NavBarTitleState extends State<NavBarTitle> {
  bool hover = true;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (h){
        setState(() {
         hover = false;
        });
      },
      onExit: (h){
        setState(() {
         hover = true;
        }
        
        );
      },
        child: Container(
          height: 35,
          padding: const EdgeInsets.only(bottom: 5),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                child: AnimatedContainer(
                  curve: Curves.easeInOutCirc,
                  height: 40,
                  width: hover ? 0 : MediaQuery.of(context).size.width ,
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(
                  width: 1.2,
                  color:
                  //hover==true? Color.fromARGB(0, 239, 22, 22): 
                  Color.fromARGB(255, 7, 196, 221), ) )),
                  duration: Duration(milliseconds: hover ? 300 :1200),)),
          
              Padding(padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text( widget.title, style: TextStyle(
                  fontFamily: 'Raleway',
                  
                             color: hover==true? ikiaSiyah : ikiaMavi,
                             fontWeight: FontWeight.w800,
                             fontSize: 16,
                             letterSpacing: 0.5
                ),),
              ),
            ],
          ),
        )
    );
  }
}



class Sliverr extends StatelessWidget {
  const Sliverr({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}