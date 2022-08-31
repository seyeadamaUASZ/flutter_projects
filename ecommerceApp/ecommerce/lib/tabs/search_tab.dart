import 'package:ecommerce/widgets/custom_action_bart.dart';
import 'package:flutter/cupertino.dart';

class SearchTab extends StatelessWidget {
  //const SearchTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("Recherche"),
          ),
          CustomActionBart(
              title: "Recherche",
              hasBackArrow: false
          )
        ],
      ),

    );
  }
}
