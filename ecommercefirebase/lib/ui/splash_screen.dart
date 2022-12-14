import 'dart:async';

import 'package:ecommercefirebase/const/AppColors.dart';
import 'package:ecommercefirebase/ui/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3),
    ()=>Navigator.push(context,CupertinoPageRoute(builder: (_)=>LoginScreen()))
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppColors.deep_orange,
       body: SafeArea(
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
       
             Text("E-DIAYMA",style: TextStyle(  
               color: Colors.white,
               fontWeight: FontWeight.bold,
               fontSize: 44.sp
             ),),
             SizedBox(height: 10.h,),
             CircularProgressIndicator(color:Colors.white,)
           ],),
         ),
       ),
    );
  }
}