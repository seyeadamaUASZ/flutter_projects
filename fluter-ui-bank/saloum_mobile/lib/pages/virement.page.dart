import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VirementPage extends StatefulWidget {
  VirementPage({Key? key}) : super(key: key);

  @override
  State<VirementPage> createState() => _VirementPageState();
}

class _VirementPageState extends State<VirementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Virement..."),),);
  }
}