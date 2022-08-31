import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DepotPage extends StatefulWidget {
  DepotPage({Key? key}) : super(key: key);

  @override
  State<DepotPage> createState() => _DepotPageState();
}

class _DepotPageState extends State<DepotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("depot..."),),
    );
  }
}