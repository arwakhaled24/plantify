import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:injectable/injectable.dart';
import 'package:plantify/ui/tabs/ChatBotTab/showErrorWidget.dart';

import '../../../provider/chatBotConfigProvider.dart';
import '../../../repositoryContract/chatBotRepository.dart';
@injectable
class ChatBotViewModel extends ChangeNotifier{
  ChatBotRepository repository;
  ChatBotConfigProvider _provider=ChatBotConfigProvider(loading: false,history:[]);
  bool get Loading => _provider.loading;
  List<Content> get history => _provider.history;
  ScrollController get scrollController => _provider.scrollController;
  TextEditingController get textController => _provider.textController;
  FocusNode get textFieldFocus => _provider.textFieldFocus;
  @factoryMethod
  ChatBotViewModel(this.repository){
    startChat();
  }

  void startChat(){
    repository.startChat();
    _provider.history.add(Content('model', [TextPart("Hi, how can I help you")]));
    notifyListeners();
  }
  Future<void> sendMessage(String message, BuildContext context) async {
    _provider.history.add(Content('user', [TextPart(message)]));
    int historyIndex =_provider.history.length;
    _provider.loading = true;
    _provider.textController.clear();
    _provider.textFieldFocus.unfocus();
    _provider.scrollDown();
    notifyListeners();
    List<Part> parts = [];
    try{
      var response = await repository.sendMessage(message);
      await for (var item in response) {
        var text = item.text;
        if (text == null) {
          //showErrorDialog('No response from API.');
        } else {
          _provider.loading = false;
          parts.add(TextPart(text));
            if ((_provider.history.length - 1) == historyIndex) {
              _provider.history.removeAt(historyIndex);
            }
          _provider.history.insert(historyIndex, Content('model', parts));
            notifyListeners();
        }
      }
    }catch (e, t) {
      print(e);
      print(t);
      showError(e.toString(),context);
      _provider.loading = false;
      notifyListeners();
    }
    //return _provider.history;
  }
  void showError(String message,BuildContext context) {
    ShowErrorWidget.showErrorDialog(context,message); // Call the actual showErrorDialog function
    notifyListeners(); // Notify listeners about the change
  }
}
