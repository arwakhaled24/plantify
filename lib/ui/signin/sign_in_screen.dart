import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:plantify/ui/custom_widget/text_form_feild_widget.dart';
import 'package:plantify/ui/custom_widget/text_label.dart';
import 'package:plantify/ui/home/Home.dart';
import 'package:plantify/ui/sign_up/sign_up.dart';
import 'package:plantify/ui/signin/sign_in_navigator.dart';
import 'package:plantify/ui/signin/sign_in_view_model.dart';
import 'package:plantify/ui/theme.dart';
import 'package:provider/provider.dart';

import '../custom_widget/dialog_widget.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = "login screen";

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    implements SignInNavigator {
  final formKeySignIn = GlobalKey<FormState>();


  var emailControler = TextEditingController();

  var passeordControler = TextEditingController();

  SignInViewModel viewModel = SignInViewModel();
  void initState() {
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: hight * .1,
              ),
              Center(
                child: Text("Sign in",
                    style: TextStyle(
                        fontSize: 33,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600)),
              ),
              Center(
                child: Text(
                  "Hi Welcom back! ",
                  style: TextStyle(
                      color: AppTheme.lightText,
                      fontFamily: "Poppins",
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKeySignIn,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: hight * .15,
                        ),
                        LabelTextForm(
                          text: "Email",
                        ),
                        SizedBox(
                          height: hight * .02,
                        ),
                        TextFormFeildWidget(
                          controler: emailControler,
                          hintText: "enter your email ",
                          validator: (text) {
                            if(text!.isEmpty){
                              return "email is required";
                            }
                          },
                        ),
                        SizedBox(
                          height: hight * .04,
                        ),
                        LabelTextForm(
                          text: "Password",
                        ),
                        SizedBox(
                          height: hight * .02,
                        ),
                        TextFormFeildWidget(
                          validator: (text) {
                            if(text!.isEmpty){
                              return "password is required";
                            }
                          },
                          controler: passeordControler,
                          hintText: "enter your password ",
                          isPassword: true,
                        ),
                        SizedBox(
                          height: hight * .03,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ////////////
                    ////////////////////////////////////////////
                            signin( emailControler.text, passeordControler.text);
                            // Button press logic
/*
                            viewModel.signin(emailControler.text, passeordControler.text);
*/

                          },
                          style: ElevatedButton.styleFrom(
                              elevation: 0, // Set elevation as needed
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              backgroundColor: Colors.transparent),
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(
                                      0xFFAEDC81), // Lighter color on one side
                                  Color(
                                      0xFF6CC51D), // Regular color on the other side
                                ],
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Center(
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color:
                                        AppTheme.mainBackground, // Text color
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Poppins",
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account ? ",
                    style: TextStyle(
                      color: AppTheme.lightText,
                      fontFamily: "Poppins",
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "Sign up ",
                      style: TextStyle(
                        color: AppTheme.green_2,
                        fontFamily: "Poppins",
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.routeName);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }



  @override
  void ShowLoading(String text) {
    // TODO: implement ShowLoading
    DialogScreen.showmessage(context, "loading...");
  }

  @override
  void HideLoading() {
    Navigator.pop(context);
  }

  @override
  void ShowMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDissMissable = true}) {
    DialogScreen.showprogresDialog(context, message);
  }

  @override
  void NavigateToHomeScreen() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  void signin(String email , String password) {
    if (formKeySignIn.currentState?.validate()!=true) {
return;    }
    viewModel.signin(email, password);

  }
}
