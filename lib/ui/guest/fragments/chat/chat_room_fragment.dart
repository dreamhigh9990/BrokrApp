// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import '../../../../controllers/chat_controller.dart';
import '../../../../models/message_model.dart';
import '../../../widgets/chat_widgets/message_bubble_widget.dart';
import '../../../widgets/chat_widgets/new_message_widget.dart';

class ChatRoomFragment extends StatefulWidget {
  static String name = '/chat-room-page';

  const ChatRoomFragment({super.key});

  @override
  _ChatRoomFragmentState createState() => _ChatRoomFragmentState();
}

class _ChatRoomFragmentState extends State<ChatRoomFragment> {
  final controller = Get.put(ChatController());

  var args = Get.arguments;
  var id = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          iconTheme: const IconThemeData(color: Colors.black),
          title: args != null
              ? Text(
                  'Chat ${args.title}',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                )
              : const Text('Chat'),
        ),
        body: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: controller
                    .getMessagesByChatRoom(args != null ? args.id : 'nop'),
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) =>
                    MessageBubble(message: message),
              ),
            ),
            //CAJA DE MENSAJES
            NewMessageWidget(
              onSubmitted: (text) {
                final message = Message(
                  id: args != null ? args.id : '1',
                  text: text,
                  date: DateTime.now(),
                  isSentByMe: true,
                );

                setState(() => controller.addMessage(message));
              },
            ),
          ],
        ),
      );
}
