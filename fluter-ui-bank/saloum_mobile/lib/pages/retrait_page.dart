import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RetraitPage extends StatefulWidget {
  RetraitPage({Key? key}) : super(key: key);

  @override
  State<RetraitPage> createState() => _RetraitPageState();
}

class _RetraitPageState extends State<RetraitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("retrait..."),),);
  }
}