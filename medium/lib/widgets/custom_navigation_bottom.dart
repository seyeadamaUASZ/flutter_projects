import 'package:flutter/material.dart';

class CustomNavigationBottom extends StatelessWidget {
  //const CustomNavigationBottom({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height:60,
      color: Color(0xFF424242),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            IconButton(onPressed: (){},
            icon: Icon(Icons.home_filled),
            iconSize: 25,
            color: Colors.green,
            ),
            IconButton(onPressed: (){},
            icon: Icon(Icons.search_outlined),
            color: Colors.white,
            ),

            IconButton(onPressed: (){},
            icon: Icon(Icons.label_sharp),
            color: Colors.white,
            ),

            IconButton(onPressed: (){}, 
            icon: CircleAvatar(  
              backgroundImage: AssetImage("assets/adama.jpeg"),
            ),
            //color: Colors.white,
            )

          ]
          
          ),
      ),
    );
  }
}