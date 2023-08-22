// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import '../../../../../../controllers/chat_controller.dart';
import '../../../../../../models/message_model.dart';

import 'new_message_widget.dart';
import 'appbar_chat_widget.dart';
import 'chat_input_card.dart';
import 'chat_output_card.dart';

class ChatRoomFragment extends StatefulWidget {
  static String name = '/chat-room-page';

  const ChatRoomFragment({super.key});

  @override
  _ChatRoomFragmentState createState() => _ChatRoomFragmentState();
}

class _ChatRoomFragmentState extends State<ChatRoomFragment> {

  String image ="https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
  final controller = Get.put(ChatController());

  var args = Get.arguments;
  var id = 1;

  @override
  Widget build(BuildContext context) => Scaffold(
         appBar: 
         
         
         ChatAppBar(
        imageCode: image,
        userName: "Eduardo Gonzalez",
        userEmail: "Online",
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
                groupHeaderBuilder: (Message message) => Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
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
                itemBuilder: (context, Message message) => message.isSentByMe
                    ? ChatOutputCard(
                        text: message.text,
                         date: "16.04",
                        urlPhoto:
                            image)
                    : ChatInputCard(
                        text: message.text,
                        date: "16.04",
                        urlPhoto:
                            image,
                        name: 'Eduardo Gonzalez',
                      ),
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

              
              },
            ),
          ],
        ),
      );
}
