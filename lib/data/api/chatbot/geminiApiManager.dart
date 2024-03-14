
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
//AIzaSyBMA4nGxaIUtfdnCIkyntF5YjHR2IA4fu4
//
@singleton
class GeminiApiManger {
  static const _apiKey = 'AIzaSyABNSVZexlF-G3SjJ-nFsIfcFBrnmnBAwI';
    GenerativeModel? _model;
    ChatSession? _chat;
  var response;
  void startChat(){
      _model = GenerativeModel(
        model: 'gemini-pro',
        apiKey: _apiKey,
      );
      _chat = _model?.startChat();
  }


   Future<dynamic> sendMessage(String message) async {
    response = await _chat?.sendMessageStream(
       Content.text(message));
    return response;
  }

}
