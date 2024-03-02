import 'package:flutter/material.dart';
import 'package:plantify/ui/custom_widget/dialog_widget.dart';
import 'package:plantify/ui/custom_widget/text_form_feild_widget.dart';
import 'package:plantify/ui/sign_up/sign_up_navigator.dart';
import 'package:plantify/ui/sign_up/sign_up_view_model.dart';
import 'package:plantify/ui/signin/sign_in_screen.dart';
import 'package:plantify/ui/theme.dart';
import '../custom_widget/text_label.dart';
import '../home/Home.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "sign up ";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    implements SignUpNavigator {
  final formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();
  SignUpViewModel viewModel = SignUpViewModel();
  void initState() {
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: hieght * .04,
            ),
            Center(
              child: Text(
                "Create account",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 33,
                ),
              ),
            ),
            Center(
              child: Text(
                "fill your information bellow",
                style: TextStyle(
                    color: AppTheme.lightText,
                    fontSize: 15,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: hieght * .04,
                      ),
                      LabelTextForm(text: "Name"),
                      SizedBox(
                        height: hieght * .01,
                      ),
                      TextFormFeildWidget(
                          controler: nameController,
                          hintText: "enter your name ",
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return "please enter name";
                            }
                          }),
                      SizedBox(
                        height: hieght * .02,
                      ),
                      LabelTextForm(text: "Email"),
                      SizedBox(
                        height: hieght * .01,
                      ),
                      TextFormFeildWidget(
                        controler: emailController,
                        hintText: "Enter your E-mail address",
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter E-mail address";
                          }
                          var reg = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                          if (!reg.hasMatch(text)) {
                            return "please enter E-mail address";
                          }
                        },
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: hieght * .02,
                      ),
                      LabelTextForm(text: "Phone number"),
                      SizedBox(
                        height: hieght * .01,
                      ),
                      TextFormFeildWidget(
                        controler: phoneController,
                        hintText: "enter your phone number",
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "please enter phone number";
                          }
                        },
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: hieght * .03,
                      ),
                      LabelTextForm(text: "password"),
                      SizedBox(
                        height: hieght * .01,
                      ),
                      TextFormFeildWidget(
                        controler: passwordController,
                        hintText: "please enter your password",
                        validator: (text) {
                          RegExp specialCharRegex = RegExp(r'[!@#\$%^&*(),.?":{}|<>]');

                          if (text == null || text.trim().isEmpty) {
                            return "please enter Password must contain special caracters, capital caracters and numbers";
                          }
                          if (text.length < 6) {
                            return "Short password ";
                          }
                          if(!specialCharRegex.hasMatch(text)) {
                            return "password must contain special caracters";
                          }
                          RegExp capitalCharRegex = RegExp(r'[A-Z]');
                           if(!capitalCharRegex.hasMatch(text)) {
                              return "password must contain capital caracters";
                            }
                          RegExp numbersRegex = RegExp(r'[0-9]');
                          if(!numbersRegex.hasMatch(text)) {
                            return "password must contain numbers";
                          }
                        },
                        isPassword: true,
                      ),
                      SizedBox(
                        height: hieght * .01,
                      ),
                      Row(
                        children: [
                          Text(
                            "agree with ",
                            style: TextStyle(
                              color: AppTheme.lightText,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "terms and conditions",
                            style: TextStyle(
                              color: AppTheme.green_2,
                              fontFamily: "Poppins",
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: hieght * .04,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          signupform(
                              nameController.text,
                              passwordController.text,
                              phoneController.text,
                              emailController.text);

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
                                Color(0xFFAEDC81), // Lighter color on one side
                                Color(
                                    0xFF6CC51D), // Regular color on the other side
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: AppTheme.mainBackground, // Text color
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already have an account ? ",
                  style: TextStyle(
                    color: AppTheme.lightText,
                    fontFamily: "Poppins",
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                      color: AppTheme.green_2,
                      fontFamily: "Poppins",
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void signupform(String name, String password, String phone, String email) {
    if (formKey.currentState?.validate() != true) {
      return;
    }
    viewModel.SignUp(nameController.text, passwordController.text,
        phoneController.text, emailController.text);
  }

  @override
  void HideLoading() {
    DialogScreen.hideDialog(context);
  }

  @override
  void NavigateToHomeScreen() {
    // TODO: implement NavigateToHomeScreen
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

  @override
  void ShowLoading(String text) {
    // TODO: implement ShowLoading
    DialogScreen.showprogresDialog(context, "loading...");
  }

  @override
  void ShowMessage(String message,
      {String? posActionTitle,
      VoidCallback? posAction,
      String? negActionTitle,
      VoidCallback? negAction,
      bool isDissMissable = true}) {
    // TODO: implement ShowMessage
    DialogScreen.showmessage(context, message);
  }
}
