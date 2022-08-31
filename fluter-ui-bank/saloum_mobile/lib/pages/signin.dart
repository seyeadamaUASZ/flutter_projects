import 'package:flutter/material.dart';
import 'package:saloum_mobile/pages/signup_page.dart';
import 'package:saloum_mobile/screens/entryScreen.dart';
import 'package:saloum_mobile/services/auth_service.dart';
import 'package:saloum_mobile/styles/app_colors.dart';
import 'package:saloum_mobile/widgets/custom_button.dart';
import 'package:saloum_mobile/widgets/custom_formfield.dart';
import 'package:saloum_mobile/widgets/custom_header.dart';
import 'package:saloum_mobile/widgets/custom_richtext.dart';


class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final _identifiantController = TextEditingController();
  final _codeAccessController = TextEditingController();

  String get identifiant  => _identifiantController.text.trim();
  String get password => _codeAccessController.text.trim();
  bool circular=false;

  AuthService authService=AuthService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: AppColors.blue,
          ),
          CustomHeader(
            text: 'Saloum Connexion',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => new SignupPage()));
            },
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: AppColors.whiteshade,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    
                    height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: EdgeInsets.only(
                        top: 16,
                        left: MediaQuery.of(context).size.width * 0.09),
                    child: Image.asset("assets/login.png"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                    headingText: "Identifiant",
                    hintText: "Identifiant",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _identifiantController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Code Accés",
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    hintText: "At least 8 Character",
                    obsecureText: true,
                    suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility), onPressed: () {}),
                    controller: _codeAccessController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Code accés oublié?",
                            style: TextStyle(
                                color: AppColors.blue.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  circular ? CircularProgressIndicator():
                  AuthButton(
                    onTap: ()async {
                      setState(() {
                        circular=true;
                      });
                      Map<String,String> data={
                        "identifiant":_identifiantController.text,
                        "codeAccess":_codeAccessController.text
                      };
                      print(data);
                      var response = await authService.post("login", data);
                      print(response.body);
                      if(response.statusCode==200 || response.statusCode==201){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>new EntryScreen()));
                      }

                      setState(() {
                        circular=false;
                      });
    
                      
                    },
                    text: 'Accéder',
                  ),
                  CustomRichText(
                    discription: "Si vous n'avez pas de compte? ",
                    text: "Inscrire",
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new SignupPage()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}