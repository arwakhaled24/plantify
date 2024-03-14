
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/request/Sign_in_req.dart';
import '../model/request/Sign_up_request.dart';
import '../model/respose/Signing_respond.dart';

class ApiManager{
  //https://PlantifyApp.bsite.net/api/Account/Login
  //https://PlantifyApp.bsite.net/api/Account/Register
   static const  String baseUrl="PlantifyApp.bsite.net";
    static const String endpointSignIn = "/api/Account/Login";
static const String endpointSignUp="/api/Account/Register";
    static Future<SigningRespond> signIn(String email, String password)async{
       var uri = Uri.https(baseUrl,endpointSignIn);
       var requestbody = SignInReq(
         email: email,
         password: password,
       );
 var respose = await http.post(uri,body: jsonEncode(requestbody.toJson()),headers: {
   "Content-Type":"application/json"
 });
 var signInResponse= SigningRespond.fromJson(jsonDecode(respose.body));
 return signInResponse ;
     }
     static Future<SigningRespond> SignUp(String name , String email , String password , String phone ) async{
 var uri = Uri.https(baseUrl , endpointSignUp,);
    var requestbody =SignUpRequest(password: password,email:email,displayName: name,phoneNumber: phone );

var response = await  http.post(uri , body: jsonEncode(requestbody.toJson()),headers:{
  "Content-Type":"application/json"
} );
 var SignUpresponse = SigningRespond.fromJson(jsonDecode(response.body));
 return SignUpresponse;
     }
}