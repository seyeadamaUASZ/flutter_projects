import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloum_mobile/pages/depot_page.dart';
import 'package:saloum_mobile/pages/paiement_page.dart';
import 'package:saloum_mobile/pages/retrait_page.dart';
import 'package:saloum_mobile/pages/virement.page.dart';
import 'package:saloum_mobile/screens/home.dart';

class EntryScreen extends StatefulWidget {
  EntryScreen({Key? key}) : super(key: key);

  @override
  State<EntryScreen> createState() => _EntryScreenState();
}

class _EntryScreenState extends State<EntryScreen> {

  int currentState=0;

  List<Widget> pages=[
     HomePage(),
     VirementPage(),
     DepotPage(),
     PaiementPage(),
     RetraitPage(),
    
  ];
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      drawer: SizedBox(
      width: 160.0,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: FlatButton.icon(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xFF015FFF),
                ),
                onPressed: null,
                label: Text("Back",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Colors.black)),
                color: Colors.black,
              ),
            ),
            InkWell(
      onTap: (){
        gotoPage(0);
      },
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Icon(
              Icons.account_balance,
              size: 50.0,
              color: Color(0xFF015FFF),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("ACCOUNTS",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14.0, color: Color(0xFF015FFF))),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    ),
            // buildMenuItem(Icons.account_balance,gotoPage(0), "ACCOUNTS",
            //     opacity: 1.0, color: Color(0xFF015FFF)),
            Divider(),

             InkWell(
      onTap: (){
        gotoPage(1);
      },
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Icon(
              Icons.compare_arrows,
              size: 50.0,
              color: Colors.black,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("TRANSFER",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14.0, color: Colors.black)),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    ),

    Divider(),
    InkWell(
      onTap: (){
        gotoPage(2);
      },
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Icon(
              Icons.receipt,
              size: 50.0,
              color: Colors.black,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("DEPOT",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14.0, color: Colors.black)),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    ),
    Divider(),
    InkWell(
      onTap: (){
        gotoPage(3);
      },
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Icon(
              Icons.attach_money,
              size: 50.0,
              color: Colors.black,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("PAIEMENTS",
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14.0, color: Colors.black)),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    ),





            // buildMenuItem(Icons.compare_arrows,gotoPage(1), "TRANSFER"),
            // Divider(),
            // buildMenuItem(Icons.receipt,gotoPage(2), "DEPOTS"),
            // Divider(),
            // buildMenuItem(Icons.attach_money,gotoPage(3), "PAIEMENTS"),
            // Divider(),
            // buildMenuItem(Icons.sentiment_satisfied,gotoPage(4), "ACHATS"),
            // Divider(),
            // buildMenuItem(Icons.phone,gotoPage(4), "SUPPORTS"),
            // Divider()
          ],
        ),
      ),
    ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          "Saloum Compte",
          style: TextStyle(color: Colors.black,fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.blue,
            ),
            onPressed: () {},
          )
        ],
      ),
      body:pages[currentState] ,
      bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  color: Color(0xFF015FFF),
                  // borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                  onPressed: () {},
                  child: Text("ACTIVITY"),
                ),
                OutlineButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                  onPressed: () {},
                  child: Text("STATEMENTS"),
                ),
                OutlineButton(
                  padding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 28.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                  borderSide: BorderSide(color: Color(0xFF015FFF), width: 1.0),
                  onPressed: () {},
                  child: Text("DETAILS"),
                )
              ],
            ),
          ),
        ),
    );
  }

  gotoPage(int index){
    setState(() {
      currentState = index;
      print(currentState);
    });
  }

  Widget buildMenuItem(IconData icon,onClick, String title,{double opacity = 0.3, Color color = Colors.black}) {
    return InkWell(
      onTap: onClick,
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Icon(
              icon,
              size: 50.0,
              color: color,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(title,
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 14.0, color: color)),
            SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}