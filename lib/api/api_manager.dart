import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:plantify/data/model/request/Sign_in_req.dart';
import 'package:plantify/data/model/respond/Sign_in_respond.dart';

import 'interceptor/sign_up_interceptor.dart';
class ApiManager{
  Client client = InterceptedClient.build(interceptors: [
    LoggingInterceptor(),
  ]);
  //https://PlantifyApp.bsite.net/api/Account/Login
   static const  String base_url="PlantifyApp.bsite.net";
     String endpoint = "/api/Account/Login";
    Future<SignInRespond> sign_in(String email, String password)async{
       var uri = Uri.https(base_url,endpoint);
       var requestbody = SignInReq(
         email: email,
         password: password,
       );
 var respond = await http.post(uri,body: requestbody.toJson());
 var signInResponse= SignInRespond.fromJson(jsonDecode(respond.body));
 return signInResponse ;

     }



}