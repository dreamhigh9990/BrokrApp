// ignore_for_file: library_private_types_in_public_api

import 'package:brokr/ui/guest/fragments/chat/chat_room_fragment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../controllers/chat_controller.dart';
import '../../../../widgets/appbar_widget.dart';
import '../../../../widgets/tiles/contact_tile_widget.dart';

class ChatFragment extends StatefulWidget {
  const ChatFragment({super.key});

  @override
  _ChatFragmentState createState() => _ChatFragmentState();
}

class _ChatFragmentState extends State<ChatFragment> {
  final controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const CustomBar(
          showLeading: false,
          title: 'Inbox',
        ),
        body: ListView.builder(
          itemCount: controller.chatrooms.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Get.toNamed(ChatRoomFragment.name,
                    arguments: controller.chatrooms[index]);
              },
              child: ContactTile(chat: controller.chatrooms[index]),
            );
          },
        ),
      );
}
