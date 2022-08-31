import 'package:flutter/material.dart';
import 'package:newapp/service/NetworkHanler.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key key,this.categorie}) : super(key: key);
  final String categorie;

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  NetWorkHandler networkHandler;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchDataWithCategorie();
  }


  fetchDataWithCategorie()async{
   var response = await networkHandler.get(widget.categorie); 
   print(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("here your info !!")),
    );
  }
}