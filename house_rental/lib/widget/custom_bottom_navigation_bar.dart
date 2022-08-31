import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  //const CustomBottomNavigationBar({Key? key}) : super(key: key);
   final bottomBarItems=[
     'home',
     'home_search',
     'notification',
     'chat',
     'home_mark'
   ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(  
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(  
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0,3)
          )
        ]
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomBarItems.map((e) => SvgPicture.asset('assets/icons/$e.svg',
         color: Color(0xFF811883)
        )).toList(),),
    );
  }
}