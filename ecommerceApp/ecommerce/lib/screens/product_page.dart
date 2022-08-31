import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/constants.dart';
import 'package:ecommerce/widgets/custom_action_bart.dart';
import 'package:ecommerce/widgets/image_swipe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  //const ProductPage({Key? key}) : super(key: key);
  final String productId;

  ProductPage({this.productId});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final CollectionReference _productsRef =
      FirebaseFirestore.instance.collection("Products");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
        FutureBuilder(
          future: _productsRef.doc(widget.productId).get(),

          // ignore: missing_return
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Scaffold(
                body: Center(
                  child: Text("Error : ${snapshot.error}"),
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> documentData = snapshot.data.data();

              List imageList = documentData['images'];
              return ListView(
                padding: EdgeInsets.all(0),
                children: [
                  ImageSwipe(imageList: imageList,),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0,
                        left: 24.0,
                        right: 24.0,
                        bottom: 4.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 24.0),
                    child: Text(
                      "${documentData['name']}" ?? "product name",
                      style: Constants.boldHeading,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 24.0),
                    child: Text(
                      "\$ ${documentData['price']}" ?? "price",
                      style: TextStyle(
                          fontSize: 18.0,
                          color: Theme.of(context).accentColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 24.0),
                    child: Text(
                      "${documentData['desc']}" ??  "description",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24.0, horizontal: 24.0),
                    child: Text(
                      "${documentData['size']}" ?? "size",
                      style: Constants.regularDarkText,
                    ),
                  )
                ],
              );
            }else{
              return Scaffold(
                body:
                  Center(
                  child:Text("Empty data !!")
                )
              );
            }
          },
        ),
        CustomActionBart(
          hasBackArrow: true,
          hasTitle: false,
          hasBackground: false,
        )
      ]),
    );
  }
}
