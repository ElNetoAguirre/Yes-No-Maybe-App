import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:yes_no_maybe_app/domain/entities/message.dart";
import "package:yes_no_maybe_app/presentation/providers/chat_provider.dart";
import "package:yes_no_maybe_app/presentation/widgets/chat/her_message_bubble.dart";
import "package:yes_no_maybe_app/presentation/widgets/chat/my_message_bubble.dart";
import "package:yes_no_maybe_app/presentation/widgets/shared/message_field_box.dart";

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://publicdomainvectors.org/photos/Female-Avatar-5.png"
            ),
            // backgroundImage: NetworkImage(
            //   "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/HAL9000.svg/1024px-HAL9000.svg.png"
            // ),
          ),
        ),
        title: const Text("Mi Niña Linda ❤"),
        // title: const Text("El Neto 😎"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messageList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messageList[index];

                  return (message.fromWho == FromWho.hers)
                    ? HerMessageBubble(message: message,)
                    : MyMessageBubble(message: message,);
                  }
                )
              ),

            // Caja de Texto de mensajes
            MessageFieldBox(
              onValue: chatProvider.sendMessage,
              // onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
