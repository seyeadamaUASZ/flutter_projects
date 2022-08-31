import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaiementPage extends StatefulWidget {
  PaiementPage({Key? key}) : super(key: key);

  @override
  State<PaiementPage> createState() => _PaiementPageState();
}

class _PaiementPageState extends State<PaiementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Paiement..."),),
    );
  }
}