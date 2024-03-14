import 'package:injectable/injectable.dart';
import '../../repositoryContract/chatBotRepository.dart';
import '../dataSourceContract/chatBotDataSource.dart';
@Injectable(as: ChatBotRepository)
class ChatBotRepositoryImp extends ChatBotRepository{
  ChatBotDataSource dataSource;
  @factoryMethod
  ChatBotRepositoryImp(this.dataSource);
  @override
  Future<dynamic> sendMessage(String message) async{
    // TODO: implement sendMessage
    var response=await dataSource.sendMessage(message);
    return response;
  }

  @override
  void startChat() {
    // TODO: implement startChat
    dataSource.startChat();
  }

}