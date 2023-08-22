// ignore_for_file: library_private_types_in_public_api

import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../models/super_model.dart';
import '../../../../widgets/bottom_bar_widget.dart';
import '../../../fragments/trips/booked_fragment.dart';
import '../../../fragments/trips/history_fragment.dart';
import '../../../fragments/trips/pending_fragment.dart';
import '../guest_home_controller.dart';
import '../widgets/tab_buttoms_widget.dart';

class TripsFragment extends StatefulWidget {
  const TripsFragment({super.key});

  @override
  _TripsFragmentState createState() => _TripsFragmentState();
}

class _TripsFragmentState extends State<TripsFragment> {
  final GuestHomeController guestHomeController = Get.find();
  List<List<SuperModel>> list = [];

  int groupValue = 0;

  @override
  void initState() {
    list.add(SuperModel.getCars());
    list.add(SuperModel.getStay());
    list.add(SuperModel.getYacht());
    list.add(SuperModel.getBoat());
    super.initState();
  }

  void updateWidgets(int value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  leading: Container(),
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    "Trips",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                  backgroundColor: Colors.white,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(108),
                    child: Column(
                      children: [
                        //ThemeUtils.dividerGrey,

                        TabButtomWidget(
                          groupValue: groupValue,
                          function: updateWidgets,
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
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
                            Tab(text: 'Booked'),
                            Tab(text: 'Pending'),
                            Tab(text: 'History'),
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
                        BookedFragment(list: list, groupValue: groupValue),
                        PendingFragment(list: list, groupValue: groupValue),
                        HistoryFragment(list: list, groupValue: groupValue),
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
                ))),
      );
}
