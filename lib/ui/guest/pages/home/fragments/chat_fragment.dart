// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../controllers/chat_controller.dart';
import '../../../../../utils/theme_utils.dart';
import '../../../../widgets/bottom_bar_widget.dart';
import '../guest_home_controller.dart';
import 'inbox/contact_tile_widget.dart';
import 'chat/chat_room_fragment.dart';
import 'inbox/notifications_widget.dart';

class ChatFragment extends StatelessWidget {
    final GuestHomeController guestHomeController = Get.find();
  final controller = Get.put(ChatController());

  ChatFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Inbox",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
            ),
          ),
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(58),
            child: Column(
              children: [
                ThemeUtils.dividerGrey,
                const SizedBox(
                  height: 5.0,
                ),
                TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  indicatorColor: ThemeUtils.colorPurple,
                  labelColor: ThemeUtils.colorPurple,
                  unselectedLabelColor: ThemeUtils.colorTripsGrey,
                  dividerColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'Message'),
                    Tab(text: 'Notifications'),
                  ],
                ),
                ThemeUtils.dividerGrey,
              ],
            ),
          ),
        ),
        body: Stack(

          children: [
            TabBarView(
          children: [
            ListView.separated(
              itemCount: controller.chatrooms.length,
              separatorBuilder: (context, index) => ThemeUtils.dividerGrey,
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
            ListView.builder(
            padding: EdgeInsets.zero,
            
              itemCount: 3,
             
              itemBuilder: (BuildContext context, int index) {
                return const NotificationWidget();
              },
            ),
          ],
        ),

          GetBuilder<GuestHomeController>(
                        id: 'bottom_bar',
                        builder: (controller) => AnimatedPositioned(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              bottom: guestHomeController.percent <= 0.1
                                  ? -50.0
                                  : 0.0,
                              child: BottomBarWidget(
                                labels: guestHomeController.labelFragments,
                                iconsPath: guestHomeController.iconFragments,
                                index: guestHomeController.index,
                                countNotifications:
                                    guestHomeController.countNewNotifications,
                                onTabItemSelected: (int value) {
                                  guestHomeController.updatePage(value);
                                },
                              ),
                            )),
                            
       
          ],
        )
      ),
    );
  }
}
