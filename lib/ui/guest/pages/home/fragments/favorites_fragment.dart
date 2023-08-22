import 'package:brokr/ui/guest/pages/home/guest_home_controller.dart';
import 'package:brokr/ui/widgets/appbar_widget.dart';
import 'package:brokr/ui/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../models/super_model.dart';
import '../../../../../utils/theme_utils.dart';
import '../../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../../widgets/bottom_bar_widget.dart';

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
        body: Stack(
          children: [
            GetBuilder<GuestHomeController>(
              id: 'favorites',
              builder: (__) => guestHomeController.favorites.isNotEmpty
                  ? ListView.builder(
                      padding: const EdgeInsets.only(top: 10.0),
                      itemCount: guestHomeController.favorites.length,
                      itemBuilder: (_, index) {
                        SuperModel item = guestHomeController.favorites[index];

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: Get.context!.width * 0.035,
                                right: Get.context!.width * 0.035,
                              ),
                              child: Text(item.favoriteTitle!,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                left: Get.context!.width * 0.020,
                                right: Get.context!.width * 0.020,
                              ),
                              margin:
                                  const EdgeInsets.only(bottom: 5.0, top: 5.0),
                              width: MediaQuery.of(context).size.width,
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
                                delete: true,
                                margin: EdgeInsets.only(
                                  left: ThemeUtils.borderShadowAppBar,
                                  right: ThemeUtils.borderShadowAppBar,
                                ),
                                superModel: item,
                                changedFavorite: () {},
                                onCancel: () async {
                                        var response = await GuestBottomSheests
                                    .buildshowGeneralDialog(
                                        context: context,
                                        widgetChild: guestHomeController
                                            .bottomSheests
                                            .removeItem(
                                                item: guestHomeController.list[
                                                    guestHomeController
                                                        .groupValue
                                                        .value][index],
                                                        
                                                        remove: ()async{
                                                            guestHomeController.favorites.removeAt(index);
                                  guestHomeController
                                      .updateWidgetGlobal("favorites");
                                                        }
                                                        ),
                                        height: Get.context!.height * 0.45);
                                  print("!hola");
                               /*   */
                                },
                              ),
                            )
                          ],
                        );
                      },
                    )
                  : SizedBox(
                      height: Get.context!.height,
                      width: Get.context!.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/favorites.svg"),
                          Text(
                            "No favorites yet",
                            style: TextStyle(
                                fontSize: 18.sp,
                                color: const Color(0xFF48484C),
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
            ),
            GetBuilder<GuestHomeController>(
                id: 'bottom_bar',
                builder: (controller) => AnimatedPositioned(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      bottom: guestHomeController.percent <= 0.1 ? -50.0 : 0.0,
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
        ));
  }
}
