// ignore_for_file: must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/ui/guest/fragments/booking_detail/boat_booking_detail.dart';
import 'package:brokr/ui/guest/fragments/booking_detail/stay_booking_detail.dart';
import 'package:brokr/ui/guest/pages/config_pages/loading_page.dart';
import 'package:brokr/ui/widgets/item_card.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../../models/super_model.dart';
import '../../../../bottom_sheets/bottom_sheets_guest.dart';
import '../../../../widgets/bottom_bar_widget.dart';
import '../../../fragments/booking_detail/car_booking_detail.dart';
import '../guest_home_controller.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/tab_buttoms_widget.dart';
import 'map_explora_fragment.dart';

class HomeFragment extends StatelessWidget {
  final GuestHomeController guestHomeController = Get.find();
  final draggableController = DraggableScrollableController();
  double _percent = 1.0;
  double opacity = 1.0;
  bool isShrunk = false;
  final double maxChildSize = 0.9;
  final double minChildSize = 0.1;
  double currentChildSize = 0.9;
  var keyMapExploreFragment = GlobalKey<MapExploreFragment>();

  HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: GetBuilder<GuestHomeController>(
                id: "update_permission",
                builder: (__) => guestHomeController.isLocationFetched == false
                    ? const LoadingPage()
                    : MapFragment(
                        key: keyMapExploreFragment,
                      ))),
        Positioned.fill(
          child: NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              guestHomeController.itemSelected = null;
              guestHomeController.updateWidgetGlobal("item_select");
              _percent = 2 * notification.extent - 0.8;
              if (_percent <= 0.1) {
                opacity = 0.0;
                guestHomeController.offBottomBar();
              } else {
                opacity = _percent;
                guestHomeController.onBottomBar();
              }
              if (_percent == 0.8) {
                opacity = 1.0;
              }

              guestHomeController.updateWidgetGlobal("animation_home");
              guestHomeController.updateWidgetGlobal("title_header");
              guestHomeController.updateWidgetGlobal("bottom_bar");

              return true;
            },
            child: DraggableScrollableSheet(
              controller: draggableController,
              maxChildSize: maxChildSize,
              minChildSize: minChildSize,
              initialChildSize: currentChildSize,
              builder: (_, scrollLocale) {
                guestHomeController.scrollListView = scrollLocale;
                return Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Colors.white,
                  child: GetBuilder<GuestHomeController>(
                    id: "list_elements",
                    builder: (__) => ListView.builder(
                      padding: EdgeInsets.only(
                          bottom: 40,
                          left: Get.context!.width * 0.05,
                          right: Get.context!.width * 0.05),
                      controller: guestHomeController.scrollListView,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: 40,
                                    color: Colors.grey[300],
                                    height: 2,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              GetBuilder<GuestHomeController>(
                                id: "title_header",
                                builder: (___) => Opacity(
                                  opacity: opacity == 0.0 ? 1.0 : 0.0,
                                  child: Center(
                                    child: Text(
                                      '${guestHomeController.list[guestHomeController.groupValue.value].length} ${guestHomeController.simpleString}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                            ],
                          );
                        } else {
                          return GestureDetector(
                            onTap: () {
                              SuperModel item = guestHomeController.list[
                                  guestHomeController.groupValue.value][index];
                              if (guestHomeController.groupValue.value == 0) {
                                Get.to(CarBookingDetail(
                                  superModel: item,
                                ));
                                return;
                              }
                              if (guestHomeController.groupValue.value == 1) {
                                Get.to(StayBookingDetail(
                                  superModel: item,
                                ));
                                return;
                              }
                              if (guestHomeController.groupValue.value == 2) {
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
                              superModel: guestHomeController.list[
                                  guestHomeController.groupValue.value][index],
                              changedFavorite: () async {
                                var response = await GuestBottomSheests
                                    .buildshowGeneralDialog(
                                        context: context,
                                        widgetChild: guestHomeController
                                            .bottomSheests
                                            .saveItem(
                                                item: guestHomeController.list[
                                                    guestHomeController
                                                        .groupValue
                                                        .value][index]),
                                        height: Get.context!.height * 0.55);

                                if (response != null) {
                                  print("RESPONSE ${response} ");
                                  SuperModel value =
                                      response["item"] as SuperModel;
                                      value.isFavourite = true;
                                  value.favoriteTitle =
                                      response["name_list"] as String;
                                  guestHomeController.favorites.add(value);
                                }
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Positioned(
          right: 20,
          top: 20,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: Colors.white,
            minWidth: 50,
            height: 50,
            elevation: 0.0,
            padding: EdgeInsets.zero,
            onPressed: () {
              guestHomeController.mapController!.animateCamera(
                CameraUpdate.newLatLngZoom(
                  LatLng(
                    guestHomeController.currentPosition!.latitude,
                    guestHomeController.currentPosition!.longitude,
                  ),
                  15.0,
                ),
              );
            },
            child: SvgPicture.asset(
              "assets/icons/location-svgrepo-com.svg",
              height: 30,
              width: 30,
            ),
          ),
        ),
        GetBuilder<GuestHomeController>(
          id: "item_select",
          builder: (___) {
            if (guestHomeController.itemSelected != null) {
              return Positioned(
                left: Get.context!.width * 0.015,
                right: Get.context!.width * 0.015,
                bottom: Get.context!.height * 0.10,
                child: Container(
                  height: Get.context!.height * 0.20,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: ItemCardMini(
                      onCancel: () {
                        keyMapExploreFragment.currentState!.onMarkerTapped(
                            int.parse(guestHomeController.itemSelected!.id!));
                        guestHomeController.itemSelected = null;
                        guestHomeController.updateWidgetGlobal("item_select");
                      },
                      isShowCancel: true,
                      margin: EdgeInsets.only(
                        left: ThemeUtils.borderShadowAppBar,
                        right: ThemeUtils.borderShadowAppBar,
                      ),
                      superModel: guestHomeController.itemSelected!,
                      changedFavorite: () {},
                    ),
                  ),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
        GetBuilder<GuestHomeController>(
          id: "animation_home",
          builder: (__) => Positioned(
            left: 0,
            right: 0,
            top: -170 * (1 - _percent),
            child: Opacity(
              opacity: opacity,
              child: _SearchDestination(),
            ),
          ),
        ),
        GetBuilder<GuestHomeController>(
          id: "animation_home",
          builder: (__) => AnimatedPositioned(
            left: Get.context!.width * 0.25,
            bottom: _percent <= 0.1 ? -50.0 : 100.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 750),
            child: FloatingActiButtonWidget(
              updateElements: () {
                print("_percent $_percent");
                guestHomeController.updateWidgetGlobal("title_header");
              },
              scrollListView: guestHomeController.scrollListView,
              draggableController: draggableController,
              currentChildSize: currentChildSize,
              minChildSize: minChildSize,
            ),
          ),
        ),
        GetBuilder<GuestHomeController>(
            id: 'bottom_bar',
            builder: (controller) => AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  bottom: -80 * (1 - _percent),
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
    );
  }

  Widget listScroll() {
    return ListView.builder(
        primary: false,
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: guestHomeController
            .list[guestHomeController.groupValue.value].length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              SuperModel item = guestHomeController
                  .list[guestHomeController.groupValue.value][index];
              if (guestHomeController.groupValue.value == 0) {
                Get.to(CarBookingDetail(
                  superModel: item,
                ));
                return;
              }
              if (guestHomeController.groupValue.value == 1) {
                Get.to(StayBookingDetail(
                  superModel: item,
                ));
                return;
              }
              if (guestHomeController.groupValue.value == 2) {
                Get.to(BoatBookingDetail(
                  superModel: item,
                ));
                return;
              }

              return;
            },
            child: ItemCard(
              margin: EdgeInsets.only(
                bottom: 20,
                left: ThemeUtils.borderShadowAppBar,
                right: ThemeUtils.borderShadowAppBar,
              ),
              superModel: guestHomeController
                  .list[guestHomeController.groupValue.value][index],
              changedFavorite: () {
                guestHomeController.updateWidget(
                    guestHomeController.groupValue.value, index);
              },
            ),
          );
        });
  }
}

class FloatingActiButtonWidget extends StatelessWidget {
  final Function updateElements;
  final DraggableScrollableController draggableController;
  double currentChildSize;
  final double minChildSize;
  final GuestHomeController controller = Get.find();
  final ScrollController scrollListView;

  FloatingActiButtonWidget(
      {super.key,
      required this.updateElements,
      required this.currentChildSize,
      required this.minChildSize,
      required this.draggableController,
      required this.scrollListView});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: ThemeUtils.colorPurple,
        borderRadius: const BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: Get.context!.width * 0.25,
            child: InkWell(
              onTap: () {
                scrollListView.jumpTo(0.0);

                draggableController.animateTo(
                  minChildSize,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeOutBack,
                );
                updateElements();
                //
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/map_icon.svg',
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  AutoSizeText(
                    "Map",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            width: 2.0,
            color: Colors.white,
          ),
          Container(
            height: 50,
            width: Get.context!.width * 0.25,
            child: InkWell(
              onTap: () {
                controller.buildFilters(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/filter_icon.svg',
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10),
                  AutoSizeText(
                    'Filter',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchDestination extends StatelessWidget {
  final GuestHomeController guestHomeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GuestHomeController>(
      id: "list_elements",
      builder: (__) => Material(
        elevation: 10,
        child: Container(
          height: Get.context!.height * 0.225,
          padding: ThemeUtils.paddingScaffoldx025,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               SizedBox(
                height: Get.context!.height * 0.05,
              ),
              SearchBarWidget(
                groupValue: guestHomeController.groupValue.value,
              ),
              const SizedBox(
                height: 20.0,
              ),
              TabButtomWidget(
                groupValue: guestHomeController.groupValue.value,
                function: (int value) {
                  guestHomeController.groupValue.value = value;
                  guestHomeController.updateListElements();
                  changedString();
                  guestHomeController.updateWidgetGlobal("title_header");
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void changedString() {
    if (guestHomeController.groupValue.value == 0) {
      guestHomeController.simpleString = "Cars";
    } else if (guestHomeController.groupValue.value == 1) {
      guestHomeController.simpleString = "Stays";
    } else {
      guestHomeController.simpleString = "Boats";
    }
  }
}
