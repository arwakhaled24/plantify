import 'package:injectable/injectable.dart';
import '../api/chatbot/geminiApiManager.dart';
import '../dataSourceContract/chatBotDataSource.dart';
@Injectable(as: ChatBotDataSource)
class ChatBotDataSourceImpl extends ChatBotDataSource{
  GeminiApiManger apiManger;
  @factoryMethod
  ChatBotDataSourceImpl(this.apiManger);

  @override
  Future<dynamic> sendMessage(String message) async{
    // TODO: implement sendMessage
    var response=await apiManger.sendMessage(message);
    return response;
  }

  @override
  void startChat() {
    // TODO: implement startChat
    apiManger.startChat();
  }

}