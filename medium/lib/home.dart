import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medium/helpers/NewsHelper.dart';
import 'package:medium/models/NewsArticle.dart';
import 'package:medium/widgets/custom_navigation_bottom.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final List categories=[
    "+",
    "For you",
    "Following",
    "Artificial Intelligence",
    "Math",
    "Programming"
  ];

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar:AppBar( 
        backgroundColor: Colors.black,
        title: Text("Home",style: TextStyle(   
          color: Colors.white,
        ),), 
        actions: <Widget>[
          Container(
            width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                        border: Border.all(color: Colors.white)
                        ),
            child: Icon(Icons.notifications_none,color: Colors.white,size: 15,))
        ],
      ) ,
      body:Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:Column(children: [
               _buildCategoriesRow(),
               SizedBox(height: 10,),
               Expanded(child: buildArticles())
               
          ],)
          
          ),
      ),
      bottomNavigationBar: CustomNavigationBottom(),
    );
}


Container _buildCategoriesRow(){
  return Container(   
    height:35.0,
    margin: EdgeInsets.only(top: 16),
    child: ListView.builder(
      itemCount: widget.categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context,index)=>Container( 
        margin: EdgeInsets.only(right: 8),
        child: Row(children: [
          Container(  
            decoration: BoxDecoration(  
              borderRadius: BorderRadius.circular(8.0),
              color: index==1 ? Colors.white : Color(0xFF424242)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(  
                           horizontal: 16,
                           vertical: 8
                         ),
              child: Text(widget.categories[index],style: TextStyle(   
                color: index ==1 ? Colors.black : Colors.white
              ),),
                         
            ),
          )
        ],),
      )
      ),
  );
}

//build padding

Container buildArticles(){
  return Container(
    child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, position) {
              NewsArticle article = NewsHelper.getArticle(position);
              return Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0.5,0.0,0.5),
                child: Card(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(article.categoryTitle, style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 16.0),),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0.0,12.0,0.0,12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(child: Text(article.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0,color: Colors.white),), flex: 3,),
                              Flexible(
                                flex: 1,
                                child: Container(
                                  height: 80.0,
                                    width: 80.0,
                                    child: Image.asset("assets/" + article.imageAssetName, fit: BoxFit.cover,)
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(article.author, style: TextStyle(fontSize: 18.0),),
                                Text(article.date + " . " + article.readTime, style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),)
                              ],
                            ),
                            Icon(Icons.bookmark_border,color: Colors.white,),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          itemCount: NewsHelper.articleCount,
        ),
  );
}

}
  
