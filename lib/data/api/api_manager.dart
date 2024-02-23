import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:plantify/data/model/request/Sign_in_req.dart';
import 'package:plantify/data/model/request/Sign_up_request.dart';
import '../model/respose/Signing_respond.dart';
import 'interceptor/sign_up_interceptor.dart';
class ApiManager{
  Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);
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

     static Future<SigningRespond> SignUp(String name, String password ,String phone, String email ) async{
 var uri = Uri.https(baseUrl , endpointSignUp,);
    var requestBody =SignUpRequest(displayName: name , email: email, phoneNumber: phone,password: password );

var response = await  http.post(uri , body: jsonEncode(requestBody.toJson()),headers:{
  "Content-Type":"application/json"
} );
 var signUpResponse = SigningRespond.fromJson(jsonDecode(response.body));
 return signUpResponse;

     }







}