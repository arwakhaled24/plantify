import 'package:google_generative_ai/google_generative_ai.dart';

abstract class ChatBotRepository{
  Future<dynamic> sendMessage(String message);
  void startChat();


  }