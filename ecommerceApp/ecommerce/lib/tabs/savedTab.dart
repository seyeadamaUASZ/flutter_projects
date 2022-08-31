import 'package:ecommerce/widgets/custom_action_bart.dart';
import 'package:flutter/cupertino.dart';

class SavedTab extends StatelessWidget {
  //const SavedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Center(
            child: Text("Sauvegarde"),
          ),
          CustomActionBart(
              title: "Sauvegarde",
              hasBackArrow: false
          )
        ],
      ),

    );
  }
}
