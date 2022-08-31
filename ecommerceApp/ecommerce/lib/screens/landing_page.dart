import 'package:ecommerce/screens/constants.dart';
import 'package:ecommerce/screens/home_page.dart';
import 'package:ecommerce/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context,snapshot){
          if(snapshot.hasError){
            return Scaffold(
              body: Center(
                child: Text("Error:${snapshot.error}"),
              ),
            );

          }
          if(snapshot.connectionState == ConnectionState.done){
            return StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context,streamSnapshot){
                if(snapshot.hasError){
                  return Scaffold(
                    body:Center(
                      child: Text("Error: ${streamSnapshot.error} "),
                    )
                  );
                }
                 //connection state active
                if(streamSnapshot.connectionState==ConnectionState.active){
                    //get the user
                    User _user = streamSnapshot.data ;
                    if(_user == null){
                      //user not logged
                      return LoginPage();
                    }else{
                       return HomePage();
                    }


                }

                return Scaffold(
                  body: Center(
                    child: Text("Checking Authentication....",style: Constants.regularHeading,),
                  ),
                );
              },

            );
          }
          return Scaffold(
            body: Center(
              child: Text("Initialized App....",style: Constants.regularHeading,),
            ),
          );
        }
    );
  }
}