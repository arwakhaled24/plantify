import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
class ChatBotConfigProvider extends ChangeNotifier{
  List<Content> history;
  bool loading;
  ChatBotConfigProvider({required this.loading,required this.history});
  final ScrollController scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  final FocusNode textFieldFocus = FocusNode();


  // void clearText() {
  //   textController.clear();
  //   textFieldFocus.requestFocus();
  // }
  void scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCirc,
      ),
    );
  }


}