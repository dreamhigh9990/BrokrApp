import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../utils/theme_utils.dart';

class NewMessageWidget extends StatefulWidget {
  final ValueChanged<String> onSubmitted;

  const NewMessageWidget({
    Key? key,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  State<NewMessageWidget> createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => SizedBox(
      height: Get.context!.height * 0.10,
      
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ThemeUtils.dividerGrey,
          Container(
                  padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
              ),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.camera_alt_outlined,
                  color: Color(0xFF48484C),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: widget.onSubmitted,
                    decoration: InputDecoration(
                    
                      filled: true,
                      hintText: 'Write a message',
                      hintStyle: TextStyle(fontSize: 14.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
   borderSide: BorderSide.none,
                      ),
                      suffixIcon:
                          const Icon(Icons.send, color: Color(0xFF48484C)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ));
}
