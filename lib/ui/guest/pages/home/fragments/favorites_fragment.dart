import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:brokr/ui/widgets/appbar_widget.dart';
import 'package:brokr/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../models/super_model.dart';
import '../../../../../utils/theme_utils.dart';

class FavoritesFragment extends StatelessWidget {
  final GuestHomeController guestHomeController = Get.find();
  FavoritesFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomBar(
        title: 'Favorite',
        showLeading: false,
      ),
      body: ListView.builder(
        itemCount: guestHomeController.list[0].length,
        itemBuilder: (_, index) {
       
          SuperModel item = guestHomeController.list[0][index];

          return Container(
            margin: const EdgeInsets.only(bottom: 5.0, top: 5.0),
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, 2),
                  blurRadius: 25,
                ),
              ],
            ),
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
