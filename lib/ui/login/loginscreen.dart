import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plantify/ui/custom_widget/text_form_feild_widget.dart';
import 'package:plantify/ui/custom_widget/text_label.dart';
import 'package:plantify/ui/login/cubit/login_state.dart';
import 'package:plantify/ui/login/cubit/login_view_model.dart';
import 'package:plantify/ui/sign_up/sign_up.dart';
import 'package:plantify/ui/theme.dart';

import '../custom_widget/dialog_widget.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = "login screen";
  var formkey = GlobalKey<FormState>();
  var emailControler = TextEditingController();
  var passeordControler = TextEditingController();
  LogInViewModel viewModel = LogInViewModel();

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocListener<LogInViewModel,LogInViewStates>(
      bloc:viewModel ,

      listener: (context , state){
        if(state==ErrorState( errorMessagee: "something went wrong")){

          DialogScreen.showmessage(context, "something went wrong");
        }
        if(state==LoadingState()){
         DialogScreen.showprogresDialog(context, "loading...");
        }

        if(state==SuccssState){
          DialogScreen.showmessage(context, "User register successfully");
        }
      },
     listenWhen: (previous , current){
        if(previous is LoadingState){
          DialogScreen.hideDialog(context);
        }
        if(current is SuccssState||current is ErrorState|| current is LoadingState){
          return true ;
        }{
          return false;
        }
     },
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: Container(
      
           padding:EdgeInsets.all(20) ,
          child: Column(
            children: [
              SizedBox(height: hight*.06,),
              Center(
                child: Text("Sign in", style: TextStyle(fontSize: 33)),
              ),
              Center(
                child: Text(
                  "Hi Welcom back! ",
                  style: TextStyle(
                      color: AppTheme.lightText,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  key: formkey,
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
                          controler: emailControler, hintText: "enter your email ",
                        validator: (text){
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
                        validator: (text){},
                        controler: passeordControler,
                        hintText: "enter your password ",
                        isPassword: true,
                      ),
                      SizedBox(height: hight*.03,),
                      ElevatedButton(
                        onPressed: () {
                          viewModel.apiManager.sign_in(emailControler.text, passeordControler.text);

                          // Button press logic
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0, // Set elevation as needed
                          padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
      
                     backgroundColor: Colors.transparent
                        ),
                        child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFAEDC81), // Lighter color on one side
                                Color(0xFF6CC51D), // Regular color on the other side
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
                                fontSize: 18
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          
              ),
          
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont have an account ? ",
                    style: TextStyle(color: AppTheme.lightText),
                  ),
                  InkWell(
                    child: Text(
                      "Sign up ",
                      style: TextStyle(color: AppTheme.green_2),
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
}
