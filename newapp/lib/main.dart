import 'package:flutter/material.dart';
import 'package:newapp/info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home:InfoPage(categorie: "health",),

    );
  }
}

class HomePage extends StatefulWidget {
  //HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> 
with SingleTickerProviderStateMixin{
  
  List<Widget> _tablist=[
    InkWell(
      onTap: () {
        InfoPage( 
          categorie: "health",
        );
      },
       child: Tab(  
          child: Text("Général")
       ),
     ),
     InkWell(
      onTap: () {
        print("Sport");
      },
       child: Tab(  
          child: Text("Sport")
       ),
     ),
     InkWell(
      onTap: () {
        print("trending");
      },
       child: Tab(  
          child: Text("Trending")
       ),
     ),
     InkWell(
       onTap: (){
         print("editor choice");
       },
       child: Tab(  
          child:Text("Editor choice")
       ),
     ),

     InkWell(
       onTap: (){
         print("category");
       },
       child: Tab(  
        child: Text("Category")
         ),
     ),
  ];

  //create controller
  TabController  _tabController;
  String categorie = "general";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tablist.length, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        toolbarHeight: 110.0, 
        leading: IconButton(  
          onPressed: (){},
          icon: Icon(Icons.menu,
          color: Colors.black,),
        ),
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text("News App",style:TextStyle(  
          color: Colors.black
        ) ,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),
          child: TabBar(   
            indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: _tablist,
          ),
        ),
      ),
      body: TabBarView(  
        //tabbar avec déroulement
        controller: _tabController,
        children: [  
          Padding(padding: EdgeInsets.all(8.0),
                  child: Container(  
                    child: ListView(  

                    ),
                  ),
          ),
          Padding(padding: EdgeInsets.all(8.0),
                  child: Container(),
          ),
          Padding(padding: EdgeInsets.all(8.0),
                  child: Container(),
          ),
          Padding(padding: EdgeInsets.all(8.0),
                  child: Container(),
          ),
          Padding(padding: EdgeInsets.all(8.0),
                  child: Container(),
          ),
        ],
      ),
      
    );
  }
}
