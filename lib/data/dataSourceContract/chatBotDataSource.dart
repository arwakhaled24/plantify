import 'package:google_generative_ai/google_generative_ai.dart';
abstract class ChatBotDataSource{
  Future<dynamic> sendMessage(String message);
  void startChat();
}