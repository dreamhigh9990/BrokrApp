import 'package:equatable/equatable.dart';

class ChatRoomModel extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final List<String> participants;
  final String image;
  final String time;

  const ChatRoomModel({
    required this.id,
    required this.title,
    required this.participants,
    required this.subtitle,
    required this.image,
    required this.time,
  });

  @override
  List<Object?> get props => [id, title, participants, subtitle, image, time];
}
