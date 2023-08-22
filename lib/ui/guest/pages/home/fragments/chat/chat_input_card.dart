import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_avatar.dart';

class ChatInputCard extends StatelessWidget {
  const ChatInputCard({
    super.key,
    required this.name,
    required this.text,
    required this.date,
    required this.urlPhoto,
  });

  final String name;
  final String text;
  final String date;
  final String urlPhoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.only(left: 20.0),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          _ChatTextCard(
            name: name,
            text: text,
            date: date,
          ),
          Transform.translate(
            offset: const Offset(-20.0, 20.0),
            child: ChatAvatar(urlPhoto: urlPhoto),
          ),
        ],
      ),
    );
  }
}

class _ChatTextCard extends StatelessWidget {
  const _ChatTextCard({
    required this.name,
    required this.text,
    required this.date,
  });

  final String name;
  final String text;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(10.0),
          topLeft: Radius.circular(10.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: ThemeUtils.colorPurple,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            text,
            style: const TextStyle(
              color: Color(0xFF1B1A57),
              fontSize: 14.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              date,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
