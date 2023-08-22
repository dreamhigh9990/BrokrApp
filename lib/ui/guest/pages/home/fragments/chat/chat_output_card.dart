import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chat_avatar.dart';

class ChatOutputCard extends StatelessWidget {
  const ChatOutputCard({
    super.key,
    required this.text,
    required this.date,
    required this.urlPhoto,
  });

  final String text;
  final String date;
  final String urlPhoto;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Spacer(),
          _ChatTextCard(
            text: text,
            date: date,
          ),
          const SizedBox(width: 10.0),
          ChatAvatar(urlPhoto: urlPhoto),
        ],
      ),
    );
  }
}

class _ChatTextCard extends StatelessWidget {
  const _ChatTextCard({
    required this.text,
    required this.date,
  });

  final String text;
  final String date;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(10.0);

    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration:  BoxDecoration(
        color: ThemeUtils.colorPurple,
        borderRadius:const BorderRadius.only(
          bottomLeft: Radius.circular(19.0),
          topLeft:Radius.circular(9.0),
          topRight: Radius.circular(9.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            maxLines: null,
            style:  TextStyle(
              color: Colors.white,
              fontSize: 14.0.sp,
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              date,
              textAlign: TextAlign.right,
              style:  TextStyle(
                color: Colors.white,
                fontSize: 12.0.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
