import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/super_model.dart';
import '../../../../utils/theme_utils.dart';
import '../../../guest/pages/home/guest_home_controller.dart';
import '../../item_card.dart';

class SimilarsWidget extends StatelessWidget {
  final GuestHomeController guestHomeController = Get.find();

  final int position;

  SimilarsWidget({super.key, required this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: Get.context!.height * 0.20,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: guestHomeController.list[0].length,
        itemBuilder: (_, index) {
          SuperModel item = guestHomeController.list[position][index];

          return Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(color: Colors.white),
            child: ItemCardMini(
              margin: EdgeInsets.only(
                left: ThemeUtils.borderShadowAppBar,
                right: ThemeUtils.borderShadowAppBar,
              ),
              superModel: item,
              changedFavorite: () {},
            ),
          );
        },
      ),
    );
  }
}
