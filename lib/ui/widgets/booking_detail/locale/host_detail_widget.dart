import 'package:brokr/ui/widgets/booking_detail/locale/about_the_host_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../models/super_model.dart';
import '../../../../utils/theme_utils.dart';
import '../../item_card.dart';
import '../../normal_button.dart';
import '../../text_align_left_widget.dart';
import '../../tiles/review_tile_widget.dart';

class HostDetailWidget extends StatelessWidget {
  List<ReviewTileHorizontalWidget> reviews = [
    ReviewTileHorizontalWidget(
        name: 'Raymond',
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam sagittis placerat varius est et vestibulum. varius est et vestibulum.',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
        date: 'Oct 20, 2022',
        id: '123',
        isSmall: true,
        rating: 3.5),
    ReviewTileHorizontalWidget(
      name: 'Luis Ordoñez',
      text:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam sagittis placerat varius est et vestibulum. varius est et vestibulum.',
      image:
          'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
      date: 'Oct 20, 2022',
      id: '123',
      rating: 3.5,
      isSmall: true,
    ),
  ];

  HostDetailWidget({super.key});

/* 
 */

  @override
  Widget build(BuildContext context) {
    var list = SuperModel.getCars();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About Host",
          style: TextStyle(
              fontFamily: ThemeUtils.interRegular,
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              Get.back();
            }),
      ),
      body: ListView(
          padding: EdgeInsets.only(
              top: Get.context!.height * 0.025,
              bottom: Get.context!.height * 0.025,
              left: Get.context!.width * 0.05,
              right: Get.context!.width * 0.05),
          shrinkWrap: true,
          children: [
            superHeaderHostDetail(),
            const SizedBox(
              height: 15.0,
            ),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextAlignLeft(title: "Verified Info", fontsize: 16),
            ListTile(
              title: Text(
                "Phone Number",
                style: TextStyle(
                    color: ThemeUtils.titleFilter,
                    fontSize: 14,
                    fontFamily: ThemeUtils.interRegular),
              ),
              trailing:
                  SvgPicture.asset("assets/icons/confirm.svg", height: 25),
              contentPadding: const EdgeInsets.all(0.0),
              minLeadingWidth: 0.0,
              minVerticalPadding: 0.0,
            ),
            ListTile(
              title: Text(
                "Email Address",
                style: TextStyle(
                    color: ThemeUtils.titleFilter,
                    fontSize: 14,
                    fontFamily: ThemeUtils.interRegular),
              ),
              trailing:
                  SvgPicture.asset("assets/icons/confirm.svg", height: 25),
              contentPadding: const EdgeInsets.all(0.0),
              minLeadingWidth: 0.0,
              minVerticalPadding: 0.0,
            ),
            const Divider(
              color: Colors.grey,
            ),
            TextAlignLeft(title: "Listings", fontsize: 16),
            const SizedBox(
              height: 15.0,
            ),
            ListView.builder(
              padding: const EdgeInsets.all(0.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: reviews.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return ItemCardMini(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    left: ThemeUtils.borderShadowAppBar,
                    right: ThemeUtils.borderShadowAppBar,
                  ),
                  superModel: list[index],
                  changedFavorite: () {},
                );
              },
            ),
            NormalButton(
              width: Get.context!.width * 0.95,
              backgroundColor: ThemeUtils.colorPurple,
              weight: FontWeight.normal,
              text: 'View All Listings',
              onTap: () {},
              cornersRadius: 10,
            ),
            const SizedBox(
              height: 10.0,
            ),
            TextAlignLeft(title: "Comments & Reviews", fontsize: 16),
            const SizedBox(
              height: 10.0,
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(0.0),
              shrinkWrap: true,
              itemCount: reviews.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {},
                    child: Container(height: 170, child: reviews[index]));
              },
            ),
            const SizedBox(
              height: 10.0,
            ),
            NormalButton(
              width: Get.context!.width * 0.95,
              backgroundColor: ThemeUtils.colorPurple,
              weight: FontWeight.normal,
              text: 'View All Comments & Reviews',
              onTap: () {},
              cornersRadius: 10,
            ),
          ]),
    );
  }

  static Widget superHeaderHostDetail(
      {EdgeInsets? padding, double? firstRadius, double? secondRadius}) {
    padding ??= EdgeInsets.only(
        left: Get.context!.width * 0.4, right: Get.context!.width * 0.4);

    firstRadius ??= Get.height * .08;
    secondRadius ??= Get.height * .025;

    return InkWell(
      onTap: () {
        print("test");

        Get.to(HostDetailWidget());
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: firstRadius,
              backgroundImage: Image.network(
                "https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                fit: BoxFit.contain,
              ).image,
              child: Align(
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  radius: secondRadius,
                  backgroundColor: ThemeUtils.colorPurple,
                  child: SvgPicture.asset("assets/icons/super_host_icon.svg",
                      height: 25, color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Center(
            child: Text(
              "Luis Ordoñez",
              style: TextStyle(
                  fontFamily: ThemeUtils.interRegular,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 2.5,
          ),
          Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_rounded,
                  color: ThemeUtils.colorPurple,
                ),
                Text(
                  "0.0",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Text(
              "50 Trips  .  Joined Apr 2022",
              style: TextStyle(
                  fontFamily: ThemeUtils.interRegular,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}
