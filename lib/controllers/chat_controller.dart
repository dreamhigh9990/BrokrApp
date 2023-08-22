import 'package:brokr/models/message_model.dart';
import 'package:get/get.dart';

import '../models/chat_room_model.dart';

class ChatController extends GetxController {
  late ChatRoomModel chatRoom;
  late List<Message> messageList;

  final messages = <Message>[
    Message(
      id: '1',
      text: 'Yes sure!',
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      id: '1',
      text: 'Do you have time tomorrow?',
      date: DateTime.now().subtract(const Duration(minutes: 2)),
      isSentByMe: true,
    ),
    Message(
      id: '1',
      text: 'Hello!',
      date: DateTime.now().subtract(const Duration(minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      id: '1',
      text: 'Hi',
      date: DateTime.now().subtract(const Duration(minutes: 4)),
      isSentByMe: true,
    ),
    Message(
      id: '1',
      text: 'Okay, I will text you later.',
      date: DateTime.now().subtract(const Duration(days: 1, minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      id: '1',
      text: 'Yes, I did',
      date: DateTime.now().subtract(const Duration(days: 1, minutes: 2)),
      isSentByMe: true,
    ),
    Message(
      id: '1',
      text: 'Did you get the groceries?',
      date: DateTime.now().subtract(const Duration(days: 1, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      id: '1',
      text: 'Coming back home',
      date: DateTime.now().subtract(const Duration(days: 1, minutes: 4)),
      isSentByMe: true,
    ),
    Message(
      id: '1',
      text: 'Where are you now?',
      date: DateTime.now().subtract(const Duration(days: 1, minutes: 5)),
      isSentByMe: false,
    ),
    Message(
      id: '2',
      text: 'Hello',
      date: DateTime.now().subtract(const Duration(days: 1, minutes: 6)),
      isSentByMe: true,
    ),
    Message(
      id: '2',
      text: 'Hey',
      date: DateTime.now().subtract(const Duration(days: 1, minutes: 7)),
      isSentByMe: false,
    ),
    Message(
      id: '2',
      text: 'Yes, see you soon',
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      id: '2',
      text: 'Are you feeling better now?',
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 2)),
      isSentByMe: true,
    ),
    Message(
      id: '2',
      text: 'Yes',
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 3)),
      isSentByMe: false,
    ),
    Message(
      id: '2',
      text: 'Hey, Are you on your way back?',
      date: DateTime.now().subtract(const Duration(days: 3, minutes: 4)),
      isSentByMe: true,
    ),
    Message(
      id: '1',
      text: 'Happy Birthday!',
      date: DateTime.now().subtract(const Duration(days: 4, minutes: 1)),
      isSentByMe: true,
    ),
  ].obs;

  final chatrooms = <ChatRoomModel>[
    const ChatRoomModel(
        id: '1',
        title: "Gaviota Team",
        participants: ["Ray", "Pepe", "Luis"],
        subtitle: "Hi how have you been?",
        image:
            "https://images.unsplash.com/flagged/photo-1566127992631-137a642a90f4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8&auto=format&fit=crop&w=900&q=60",
        time: "14:44"),
    const ChatRoomModel(
        id: '2',
        title: "Ray",
        participants: ["Ray", "Pepe"],
        subtitle: "Sample Text",
        image:
            "https://img.freepik.com/free-photo/handsome-young-businessman-suit_273609-6513.jpg",
        time: "15:15")
  ].obs;

  addSingleChatRoom(String id, String title, List<String> participants,
      String subtitle, String image, String time) {
    chatRoom = ChatRoomModel(
        id: id,
        title: title,
        participants: participants,
        subtitle: subtitle,
        image: image,
        time: time);

    for (ChatRoomModel i in chatrooms) {
      if (i.id == id) {
        chatrooms.remove(i);
      }
      chatrooms.add(chatRoom);
    }
  }

  getMessagesByChatRoom(String id) {
    messageList = <Message>[];
    if (identical(id, 'nop')) {
      return messageList;
    }

    messageList.clear();
    for (var element in messages) {
      if (identical(element.id, id)) {
        messageList.add(element);
      }
    }
    return messageList;
  }

  addMessage(Message m) {
    messages.add(m);
  }

  clearChatRooms() {
    chatrooms.clear();
  }

  deleteChatRoom(int id) {
    for (ChatRoomModel i in chatrooms) {
      // ignore: unrelated_type_equality_checks
      if (i.id == id) {
        chatrooms.remove(i);
      }
    }
  }
}
