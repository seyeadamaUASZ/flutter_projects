import 'package:ecommerce/screens/constants.dart';
import 'package:ecommerce/tabs/home_tab.dart';
import 'package:ecommerce/tabs/savedTab.dart';
import 'package:ecommerce/tabs/search_tab.dart';
import 'package:ecommerce/widgets/bottom_tabs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController _tabPageController;
  int _selectedTab = 0;
  @override
  void initState() {
    // TODO: implement initState
    _tabPageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(

            child: Expanded(
              child: PageView(
                controller: _tabPageController,
                onPageChanged: (num){
                   setState(() {
                     _selectedTab = num;
                   });

                },
                children:
                [
                  HomeTab(),
                  SearchTab(),
                  SavedTab()
                ],
              ),
            ),
          ),

          BottomTabs(
            selectedTab: _selectedTab,
            tabPressed: (num){
              _tabPageController.animateToPage(num,
                  duration: Duration(microseconds: 300),
                  curve: Curves.easeInCubic);
            },
          )

        ],
      )
    );
  }
}
