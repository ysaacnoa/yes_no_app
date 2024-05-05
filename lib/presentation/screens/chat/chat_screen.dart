
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/bot_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

String url = 'https://media-lim1-1.cdn.whatsapp.net/v/t61.24694-24/396406287_1069769067367976_4332099852710276674_n.jpg?ccb=11-4&oh=01_Q5AaINiLR5B1fegnugXc9oKI_Wh4iAYK46YrXD5c4ykBn6km&oe=6644431F&_nc_sid=e6ed6c&_nc_cat=111';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: const _ChatBar( title: 'Ysaac\'s Future', padding: 4,),
      body: _ChatView(),
    );
  }
}

class _ChatBar extends StatelessWidget implements PreferredSizeWidget{

  final String title;
  final double padding;

  const _ChatBar({
    required this.title,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: CircleAvatar(
          backgroundImage: NetworkImage(url),
        ),
      ),
      title: Text(title),
    );   
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
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
                  return message.fromWho == FromWho.bot
                    ? BotMessageBubble(message: message,)
                    : MyMessageBubble(message: message,);
                },
              ) 
            ),
            // const MessageFieldBox()
            MessageFieldBox( 
              //onValue: (value) => chatProvider.sendMessage(value), 
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}