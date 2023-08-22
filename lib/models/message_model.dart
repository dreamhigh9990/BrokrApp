class Message {
  final String id;
  final String text;
  final DateTime date;
  final bool isSentByMe;

  const Message({
    required this.id,
    required this.text,
    required this.date,
    required this.isSentByMe,
  });
}
