import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saloum_mobile/pages/signin.dart';
import 'package:saloum_mobile/screens/entryScreen.dart';
import 'package:saloum_mobile/styles/app_colors.dart';
import 'package:saloum_mobile/widgets/custom_button.dart';
import 'package:saloum_mobile/widgets/custom_formfield.dart';
import 'package:saloum_mobile/widgets/custom_header.dart';
import 'package:saloum_mobile/widgets/custom_richtext.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _lastNameController = TextEditingController();
  final _firstNameController = TextEditingController();

  final _emailController = TextEditingController();
  final _telephoneController = TextEditingController();
  final _codeAccessController = TextEditingController();
  final _adresseController = TextEditingController();
  
  String get adresse => _adresseController.text.trim();
  String get firstName => _firstNameController.text.trim();
  String get lastName => _lastNameController.text.trim();
  String get telephone => _telephoneController.text.trim();
  String get email => _emailController.text.trim();
  String get codeAccess => _codeAccessController.text.trim();

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
            text: 'Saloum Inscription',
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => new Signin()));
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
                     height: 30,
                     width: MediaQuery.of(context).size.width * 0.8,
                     margin: EdgeInsets.only(
                         left: MediaQuery.of(context).size.width * 0.09),
                     child: Image.asset("assets/login.png"),
                   ),
                  CustomFormField(
                    headingText: "Nom",
                    hintText: "Nom",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _lastNameController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomFormField(
                    headingText: "Prénom",
                    hintText: "Prénom",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _firstNameController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                  ),
                  

                  const SizedBox(
                    height: 24,
                  ),
                  CustomFormField(
                    headingText: "Email",
                    hintText: "Email",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _emailController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Téléphone",
                    hintText: "Téléphone",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _telephoneController,
                    maxLines: 1,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  CustomFormField(
                    headingText: "Adresse",
                    hintText: "Adresse",
                    obsecureText: false,
                    suffixIcon: const SizedBox(),
                    controller: _adresseController,
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
                            "Mot de passe oublié?",
                            style: TextStyle(
                                color: AppColors.blue.withOpacity(0.7),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                  AuthButton(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>new EntryScreen()));
                    },
                    text: 'Accéder',
                  ),
                  CustomRichText(
                    discription: "Si vous avez un  compte? ",
                    text: "Connectez-vous",
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => new Signin()));
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