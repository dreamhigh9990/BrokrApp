import 'package:brokr/ui/guest/pages/home/fragments/trips/car/widgets/chat_page.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:share_plus/share_plus.dart';

import '../../../../../../../utils/theme_utils.dart';

import '../../../guest_home_controller.dart';

import 'widgets/details_locale_page.dart';
import 'widgets/help_page.dart';

class DetailPageCar extends StatelessWidget {
  final GuestHomeController guestHomeController = Get.find();
  bool favorite = false;
  DetailPageCar({super.key});

  String urlCar =
      "https://www.diariomotor.com/imagenes/2015/03/jaguar-xf-2015-09-1440px.jpg";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              leading: Container(),
              leadingWidth: 0.0,
              flexibleSpace: appBarCar(urlCar, favorite),
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(
                  Get.context!.height * 0.255,
                ),
                child: Column(
                  children: [
                    TabBar(
                      padding: EdgeInsets.zero,
                      indicatorColor: ThemeUtils.colorPurple,
                      labelColor: ThemeUtils.colorPurple,
                      unselectedLabelColor: ThemeUtils.colorTripsGrey,
                      dividerColor: Colors.grey,
                      tabs: const [
                        Tab(text: 'Details'),
                        Tab(text: 'Message'),
                        Tab(text: 'Help'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: Stack(
              children: [
                //body
                TabBarView(
                  children: [
                   DetailsLocalePage(),
                    ChatPageTrip(),
                    HelpPage(),
                  ],
                ),
                //BOTOMM BAR
              ],
            )));
  }
}

Widget appBarCar(String urlCar, bool favorite) {
  return Container(
      height: Get.context!.height * 0.30,
      width: Get.context!.width,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(
          urlCar,
        ),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: [
          Container(
            width: Get.context!.width,
            height: Get.context!.height * 0.1,
            padding: ThemeUtils.paddingScaffoldx05,
            margin: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(left: 7.5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ),
                      )),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    await Share.share(
                        'Check out this 📃 Listing on Brokr!  https://brokr.com/listing/001',
                        subject:
                            'Check out this 📃 Listing on Brokr!  https://brokr.com/listing/001');
                  },
                  child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.file_upload_outlined,
                        color: Colors.black,
                      )),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        favorite == false
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: favorite == false
                            ? Colors.black
                            : ThemeUtils.colorPurple,
                      )),
                ),
              ],
            ),
          )
        ],
      ));
}
