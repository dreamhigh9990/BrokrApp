


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../controllers/chat_controller.dart';
import '../../../../../../../../models/message_model.dart';
import '../../../chat/chat_input_card.dart';
import '../../../chat/chat_output_card.dart';
import '../../../chat/new_message_widget.dart';


class ChatPageTrip extends StatelessWidget {

    String image =
      "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500";
   static ChatController controller = Get.put(ChatController());

  var args = controller.chatrooms[0];
  var id = 1;

   ChatPageTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return     Column(
                      children: [
                        Expanded(
                          child: GroupedListView<Message, DateTime>(
                            padding: const EdgeInsets.all(8),
                            reverse: true,
                            order: GroupedListOrder.DESC,
                            useStickyGroupSeparators: true,
                            floatingHeader: true,
                            elements: controller.getMessagesByChatRoom(
                                args != null ? args.id : 'nop'),
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
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            itemBuilder: (context, Message message) =>
                                message.isSentByMe
                                    ? ChatOutputCard(
                                        text: message.text,
                                        date: "16.04",
                                        urlPhoto: image)
                                    : ChatInputCard(
                                        text: message.text,
                                        date: "16.04",
                                        urlPhoto: image,
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
                    );
  }
}