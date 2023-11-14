import 'package:brokr/ui/guest/fragments/booking_detail/boat_booking_detail.dart';
import 'package:brokr/ui/guest/fragments/booking_detail/stay_booking_detail.dart';

import 'package:brokr/ui/guest/pages/home/widgets/floating_action_button_widget.dart';
import 'package:brokr/ui/widgets/item_card.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../models/super_model.dart';
import '../../../fragments/booking_detail/car_booking_detail.dart';
import '../guest_home_controller.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/tab_buttoms_widget.dart';
import 'map_explora_fragment.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State createState() => _HomeFragment();
}

class _HomeFragment extends State<HomeFragment> {
  final GuestHomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GetBuilder<GuestHomeController>(
          id: "stack_home_fragment_guest",
          builder: (__) => Stack(
            children: [
              //mapa
              const MapExploreFragment(),
              GetBuilder<GuestHomeController>(
                id: "change_screen",
                builder: (__) {
                  if (controller.showMap.value == false) {
                    return GetBuilder<GuestHomeController>(
                      id: "list_elements",
                      builder: (__) => Container(
                        padding: ThemeUtils.paddingScaffoldx025,
                        margin: ThemeUtils.paddingScaffoldxTop20,
                        child: CustomScrollView(
                          slivers: [
                            SliverAppBar(
                              elevation: 0.0,
                              backgroundColor: Colors.transparent,
                              floating: true,
                              expandedHeight: 160.0,
                              pinned: false,
                              toolbarHeight: 160,
                              flexibleSpace: FlexibleSpaceBar(
                                collapseMode: CollapseMode.parallax,
                                titlePadding: const EdgeInsets.all(0.0),
                                centerTitle: false,
                                background: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      children: [
                                        SearchBarWidget(
                                          groupValue:
                                              controller.groupValue.value,
                                        ),
                                        const SizedBox(
                                          height: 20.0,
                                        ),
                                        TabButtomWidget(
                                          groupValue:
                                              controller.groupValue.value,
                                          function: (int value) {
                                            controller.groupValue.value = value;
                                            controller.updateListElements();
                                          },
                                        ),
                                      ],
                                    )),
                              ),
                            ),
                            SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => GestureDetector(
                                  onTap: () {
                                    SuperModel item = controller
                                            .list[controller.groupValue.value]
                                        [index];
                                    if (controller.groupValue.value == 0) {
                                      Get.to(CarBookingDetail(
                                        superModel: item,
                                      ));
                                      return;
                                    }
                                    if (controller.groupValue.value == 1) {
                                      Get.to(StayBookingDetail(
                                        superModel: item,
                                      ));
                                      return;
                                    }
                                    if (controller.groupValue.value == 2) {
                                      Get.to(BoatBookingDetail(
                                        superModel: item,
                                      ));
                                      return;
                                    }

                                    /*  
 */
                                    return;
                                  },
                                  child: ItemCard(
                                    margin: EdgeInsets.only(
                                      bottom: 20,
                                      left: ThemeUtils.borderShadowAppBar,
                                      right: ThemeUtils.borderShadowAppBar,
                                    ),
                                    superModel: controller
                                            .list[controller.groupValue.value]
                                        [index],
                                    changedFavorite: () {
                                      controller.updateWidget(
                                          controller.groupValue.value, index);
                                    },
                                  ),
                                ),
                                childCount: controller.list.length,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return GetBuilder<GuestHomeController>(
                      id: "list_elements",
                      builder: (__) => Container(
                        height: Get.context!.height,
                        margin: ThemeUtils.paddingScaffoldxTop20,
                        padding: ThemeUtils.paddingScaffoldx025,
                        child: Column(
                          children: [
                            SearchBarWidget(
                              groupValue: controller.groupValue.value,
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            TabButtomWidget(
                              groupValue: controller.groupValue.value,
                              function: (value) {
                                controller.groupValue.value = value;
                                controller.updateListElements();
                              },
                            ),
                            const Spacer(),
                            if (controller.itemSelected != null) ...{
                              Container(
                                height: Get.context!.height * 0.20,
                                margin: const EdgeInsets.only(bottom: 16),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: ItemCardMini(
                                    margin: EdgeInsets.only(
                                      left: ThemeUtils.borderShadowAppBar,
                                      right: ThemeUtils.borderShadowAppBar,
                                    ),
                                    superModel: controller.itemSelected!,
                                    changedFavorite: () {},
                                  ),
                                ),
                              )
                            }
                          ],
                        ),
                      ),
                    );
                  }
                },
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButtonCustom(
          buildFilters: () => controller.buildFilters(context),
        ));
  }
}
