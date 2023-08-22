import 'package:flutter/material.dart';

class ChatAvatar extends StatelessWidget {
  const ChatAvatar({
    super.key,
    required this.urlPhoto,
    this.colorStatus = Colors.green,
  });

  final String urlPhoto;
  final Color colorStatus;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          foregroundImage: NetworkImage(urlPhoto),
          radius: 22.5,
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            radius: 7.0,
            child: CircleAvatar(
              foregroundColor: colorStatus,
              backgroundColor: colorStatus,
              radius: 5.0,
            ),
          ),
        ),
      ],
    );
  }
}
