import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../../di/di.dart';
import 'package:provider/provider.dart';

import 'chatBotViewModel.dart';
import 'message_tile.dart';
class ChatBotTab extends StatelessWidget {
  static String routeName='ChatScreen';
  //late ScrollController _scrollController;
  //late TextEditingController _textController;
  //late FocusNode _textFieldFocus;
  ChatBotViewModel viewModel=getIt.get<ChatBotViewModel>();
  @override
  Widget build(BuildContext context) {
    final viewModel=Provider.of<ChatBotViewModel>(context);
    //viewModel.startChat();
    return Provider<ChatBotViewModel>(
      create: (_) => viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 30,
                width: 30,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/chatbot.png"),
                ),
              ),
              const Text('Plantify bot'),
            ],
          ),
        ),
        body: Stack(
          children: [
            ListView.separated(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 90),
              itemCount: viewModel.history.reversed.length,
              controller: viewModel.scrollController,
              reverse: true,
              itemBuilder: (context, index) {
                var content = viewModel.history.reversed.toList()[index];
                var text = content.parts
                    .whereType<TextPart>()
                    .map<String>((e) => e.text)
                    .join('');
                return MessageTile(
                  sendByMe: content.role == 'user',
                  message: text,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 15,
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(color: Colors.grey.shade200))),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 55,
                        child: TextField(
                          cursorColor: Color(0xff73C827),
                          controller: viewModel.textController,
                          autofocus: true,
                          focusNode: viewModel.textFieldFocus,
                          decoration: InputDecoration(
                              hintText: 'Ask me anything...',
                              hintStyle: const TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () async{
                        await viewModel.
                        sendMessage(viewModel.textController.text,context);
                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xff73C827),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(1, 1),
                                  blurRadius: 3,
                                  spreadRadius: 3,
                                  color: Colors.black.withOpacity(0.05))
                            ]),
                        child: viewModel.Loading
                            ? const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                          ),
                        )
                            : const Icon(
                          Icons.send_rounded,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

