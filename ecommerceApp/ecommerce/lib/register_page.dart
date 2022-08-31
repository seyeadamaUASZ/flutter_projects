import 'package:ecommerce/screens/constants.dart';
import 'package:ecommerce/screens/login_page.dart';
import 'package:ecommerce/widgets/custom_btn.dart';
import 'package:ecommerce/widgets/custom_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  //const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Future<void> _alertDialogBuilder(String error) async{
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Text("Erreur"),
            content: Container(
              child: Text(error),
            ),
            actions: [
              FlatButton(
                child: Text("close"),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          );
        }
        );
  }

  Future<String> _createAccount() async{
    try{
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
         email: _registerEmail, password: _registerPassword);
     return null;
    }on FirebaseAuthException catch(e){
      if(e.code =='weak-password'){
        print('The password provided is the weak');
      }else if(e.code=='email already in use'){
        print("the account already exists for the email");
      }
      return e.message;
    }catch(e){
       print(e.toString());
    }
  }

  void _submitForm() async {
    //set the form to loading state
    setState(() {
      _registerFormLoading=true;
    });
    //utilisateur déjà créé !!!
    String _createAccountFeedBack = await _createAccount();
    if(_createAccountFeedBack !=null){
      _alertDialogBuilder(_createAccountFeedBack);

      setState(() {
        _registerFormLoading=false;
      });
    }else{
      Navigator.pop(context);
    }

  }

  //loading state
  bool _registerFormLoading = false;

  //form fields registration
  String _registerEmail ="";
  String _registerPassword = "";

  //focus Node
  FocusNode _passwordFocusNode;

  @override
  void initState() {
    // TODO: implement initState
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 24.0
                    ),
                    child: Text("Bienvenue dans Ecom App",
                      style: Constants.boldHeading,),

                  ),
                ),

                Column(
                  children: [
                    CustomInput(hinText: "email",
                    onChanged: (value){
                      _registerEmail=value;
                    },
                    onSubmitted: (value){
                      _passwordFocusNode.requestFocus();
                    },
                      textInputAction: TextInputAction.next,
                    ),
                    CustomInput(hinText: "Mot de passe",
                    onChanged: (value){
                      _registerPassword=value;
                    },
                    focusNode: _passwordFocusNode,
                    isPasswordField: true,
                    onSubmitted: (value){

                    },
                    ),
                    CustomBtn(
                      text: "s'inscrire",
                      onPressed: (){
                        //_alertDialogBuilder();
                        _submitForm();
                      },
                      isLoading: _registerFormLoading,
                    )

                  ],
                ),
                Padding(padding: const EdgeInsets.only(
                    bottom: 16.0
                )),
                CustomBtn(
                    text:"Retour à la connexion",
                    onPressed:(){
                      //Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      Navigator.pop(context);
                    },
                    outlineBtn: true
                ),

              ],
            ),
          ),
        )
    );
  }
}
