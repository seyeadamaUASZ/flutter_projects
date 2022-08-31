import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:house_rental/widget/best_offer.dart';
import 'package:house_rental/widget/categories.dart';
import 'package:house_rental/widget/custom_app_bart.dart';
import 'package:house_rental/widget/custom_bottom_navigation_bar.dart';
import 'package:house_rental/widget/recommended_house.dart';
import 'package:house_rental/widget/search_input.dart';
import 'package:house_rental/widget/welcome_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(),
      body:SingleChildScrollView(  
        child: Column(children: [
          WelcomeText(),
          SearchInput(),
          Categories(),
          RecommendedHouse(),
          BestOffer()
        ],),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}