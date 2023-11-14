import 'package:auto_size_text/auto_size_text.dart';
import 'package:brokr/models/super_model.dart';
import 'package:brokr/ui/widgets/normal_button.dart';
import 'package:brokr/ui/widgets/stars_widget.dart';
import 'package:brokr/utils/theme_utils.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ItemCard extends StatelessWidget {
  final bool isSmall;
  final Function changedFavorite;
  final SuperModel superModel;
  final EdgeInsetsGeometry? margin;
  const ItemCard({
    super.key,
    this.margin,
    this.isSmall = false,
    required this.superModel,
    required this.changedFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context!.height * 0.3950,
      width: Get.context!.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15.0)),
      margin: margin,
      child: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                  width: Get.context!.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15.0)),
                      color: Colors.white,
                      image: DecorationImage(
                          image: NetworkImage(
                            superModel.image!,
                          ),
                          fit: BoxFit.cover)),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.context!.width * 0.035,
                        vertical: Get.context!.height * 0.025),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (superModel.topHost) ...{
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Row(children: [
                              Container(
                                height: 5.0,
                                width: 5.0,
                                color: const Color(0xFF2ECFA5),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const Text(
                                "Top Host",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                            ]),
                          ),
                        } else ...{
                          Container(),
                        },
                        GestureDetector(
                          onTap: () {
                            changedFavorite();
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(5),
                            child: superModel.isFavourite == false
                                ? const Icon(
                                    Icons.favorite_border_outlined,
                                    color: Colors.grey,
                                  )
                                : const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ))),
          Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.context!.width * 0.035,
                ),
                child: Column(children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        // color: Colors.blue,
                        child: Row(children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                //  color: Colors.red,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star_rate_rounded,
                                            color: Color(0xFFFFB134),
                                            size: 18,
                                          ),
                                          const Icon(
                                            Icons.star_rate_rounded,
                                            color: Color(0xFFFFB134),
                                            size: 18,
                                          ),
                                          const Icon(
                                            Icons.star_rate_rounded,
                                            color: Color(0xFFFFB134),
                                            size: 18,
                                          ),
                                          const Icon(
                                            Icons.star_rate_rounded,
                                            color: Color(0xFFFFB134),
                                            size: 18,
                                          ),
                                          const Icon(
                                            Icons.star_rate_rounded,
                                            color: Color(0xFFFFB134),
                                            size: 18,
                                          ),
                                          Text(
                                            '(4.5)',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xFF646464),
                                                ),
                                          ),
                                          const SizedBox(width: 8),
                                          Container(
                                            height: 15.0,
                                            width: 2.5,
                                            color: Colors.black,
                                          ),
                                          const SizedBox(width: 8),
                                          SvgPicture.asset(
                                            'assets/icons/super_host_icon.svg',
                                            height: 12,
                                          ),
                                          Text(
                                            " ${superModel.hostName!}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium!
                                                .copyWith(
                                                  fontSize: 14,
                                                  color:
                                                      const Color(0xFF646464),
                                                ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        superModel.name!,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                                fontSize: isSmall ? 14 : 16),
                                      ),
                                    ]),
                              )),
                          if (superModel.isDeal)
                            Expanded(
                                child: Container(
                              //color: Colors.orange,
                              child: Container(
                                alignment: Alignment.center,
                                height: isSmall ? 40 : 45,
                                width: isSmall ? 40 : 45,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: ThemeUtils.colorPurple,
                                  /*            image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/circle_orange.png',
                                  ),
                                )
                                 */
                                ),
                                child: Text(
                                  'DEAL',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                          color: Colors.white,
                                          fontSize: isSmall ? 12 : 14),
                                ),
                              ),
                            )),
                        ]),
                      )),
                  Expanded(
                      child: Container(
                    alignment: Alignment.topCenter,
                    //color: Colors.green,
                    child: Row(children: [
                      Expanded(
                          flex: 4,
                          child: Container(
                            //       color: Colors.blue,
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(Icons.location_on_sharp,
                                      color: Color(0xFF646464), size: 15),
                                  const SizedBox(
                                    width: 2.5,
                                  ),
                                  Text(
                                    superModel.address!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall!
                                        .copyWith(
                                          fontSize: isSmall ? 10 : 12,
                                          color: const Color(0xFF646464),
                                        ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Container(
                                    height: 5.0,
                                    width: 5.0,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFF646464),
                                        shape: BoxShape.circle),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const Text(
                                    "11.6 mi",
                                    style: TextStyle(
                                      color: Color(0xFF646464),
                                    ),
                                  ),
                                ]),
                          )),
                      Expanded(
                          child: Container(
                        //  color: Colors.orange,
                        child: RichText(
                          text: const TextSpan(
                            text: '138\$/',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Day',
                                  style: TextStyle(
                                    color: Color(0xFF646464),
                                  )),
                            ],
                          ),
                        ),
                      ))
                    ]),
                  ))
                ]),
              ))
        ],
      ),
    );
  }
}

class ItemCardMini extends StatelessWidget {
  final Function changedFavorite;
  final SuperModel superModel;
  final EdgeInsetsGeometry? margin;

  ItemCardMini({
    super.key,
    this.margin,
    required this.superModel,
    required this.changedFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context!.height * 0.20,
      width: Get.context!.width,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(189, 19, 19, 0.098),
          offset: Offset(0, 2),
          blurRadius: 25,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      margin: margin,
      child: Row(
        children: [
          SizedBox(
              height: Get.context!.height * 0.20,
              width: Get.context!.width * 0.4250,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(Get.context!.height * 0.01),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        superModel.image!,
                        fit: BoxFit.cover,
                        height: Get.context!.height * 0.30,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(Get.context!.height * 0.015),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (superModel.topHost) ...{
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4.0)),
                            child: Row(children: [
                              Container(
                                height: 5.0,
                                width: 5.0,
                                color: const Color(0xFF2ECFA5),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              const AutoSizeText(
                                "Top Host",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                            ]),
                          ),
                        } else ...{
                          Container(),
                        },
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(5),
                          child: superModel.isFavourite == false
                              ? const Icon(
                                  Icons.favorite_border_outlined,
                                  color: Colors.grey,
                                )
                              : const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 3,
              child: Container(
                // color: Colors.green,
                padding: EdgeInsets.symmetric(
                    horizontal: Get.context!.width * 0.01,
                    vertical: Get.context!.height * 0.015),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StarsWidgetRight(
                            rating: 4,
                            size: 10,
                            fontSize: 6,
                          ),
                          Container(
                            height: 15.0,
                            width: 1.0,
                            color: Colors.black,
                          ),
                          SvgPicture.asset(
                            'assets/icons/super_host_icon.svg',
                            height: 12,
                          ),
                          AutoSizeText(
                            "Host Name",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontSize: 6,
                                  color: const Color(0xFF646464),
                                ),
                          ),
                        ],
                      ),
                      if (superModel.isDeal == false)
                        const SizedBox(
                          height: 5.0,
                        ),
                      AutoSizeText(
                        superModel.name!,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 12),
                      ),
                      if (superModel.isDeal == false)
                        const SizedBox(
                          height: 5.0,
                        ),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(Icons.location_on_sharp,
                                color: Color(0xFF646464), size: 15),
                            const SizedBox(
                              width: 2.5,
                            ),
                            AutoSizeText(
                              superModel.address!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 10,
                                    color: const Color(0xFF646464),
                                  ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Container(
                              height: 5.0,
                              width: 5.0,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF646464),
                                  shape: BoxShape.circle),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            const Text(
                              "11.6 mi",
                              style: TextStyle(
                                color: Color(0xFF646464),
                              ),
                            ),
                          ]),
                      if (superModel.isDeal)
                        Container(
                          alignment: Alignment.centerRight,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ThemeUtils.colorPurple,
                            ),
                            child: AutoSizeText(
                              'DEAL',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ),
                      if (superModel.isDeal == false) const Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: const TextSpan(
                            text: '138\$/',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Day',
                                  style: TextStyle(
                                    color: Color(0xFF646464),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ]),
              ))
        ],
      ),
    );
  }
}

class ItemCardMiniWidget extends StatelessWidget {
  final String title;
  final String address;
  final double rating;
  final String image;
  final double price;
  final double price2;
  final bool isFavourite;

  final BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));
  final EdgeInsetsGeometry? margin;
  final bool isSmall;

  const ItemCardMiniWidget({
    super.key,
    required this.title,
    required this.address,
    required this.rating,
    required this.image,
    required this.price,
    required this.price2,
    required this.isFavourite,
    this.margin,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(1, 2),
            blurRadius: 5,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Column(children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.network(
            "https://imageio.forbes.com/specials-images/imageserve/6064c6802c761b99a89d1f21/0x0.jpg?format=jpg&crop=2375,1336,x0,y120,safe&width=1200",
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        )),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Text(
                "Luxury Villa 5bed/6bath waterfront",
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: true ? 14 : 16),
              ),
              const SizedBox(height: 4),
              Text(
                "Miami Beach Florida, United States",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontSize: true ? 10 : 12,
                      color: ThemeUtils.greyColor,
                    ),
              ),
              const SizedBox(
                height: 5.0,
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "\$2500/Hour",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
            ],
          ),
        ))
      ]),
    );
    ;
  }
}

class ItemCardTrip extends StatelessWidget {
  final Function changedFavorite;
  final SuperModel superModel;
  final EdgeInsetsGeometry? margin;
  final String title;
  final String titleButton;

  bool? isBoat;

  ItemCardTrip({
    super.key,
    this.margin,
    required this.superModel,
    required this.changedFavorite,
    required this.title,
    required this.titleButton,
    this.isBoat = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.context!.height * 0.20,
      width: Get.context!.width,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(189, 19, 19, 0.098),
          offset: Offset(0, 2),
          blurRadius: 25,
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
      margin: margin,
      child: Row(
        children: [
          Container(
            height: Get.context!.height * 0.20,
            width: Get.context!.width * 0.4250,
            padding: EdgeInsets.all(Get.context!.height * 0.01),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                superModel.image!,
                fit: BoxFit.cover,
                height: Get.context!.height * 0.30,
              ),
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                // color: Colors.green,
                padding: EdgeInsets.symmetric(
                    horizontal: Get.context!.width * 0.01,
                    vertical: Get.context!.height * 0.015),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AutoSizeText(
                        "Title Full Listing Card Item",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        //color: Colors.green,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            StarsWidgetRight(
                              rating: 4,
                              size: 08,
                              fontSize: 8,
                            ),
                           const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 10,
                              width: 1.0,
                              color: Colors.black,
                            ),
                          const  SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              'assets/icons/super_host_icon.svg',
                              height: 12,
                            ),
                           const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Host Name",
                              style: TextStyle(
                                  color: ThemeUtils.colorTripsGrey,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      if(isBoat== false)...{
                         Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sat, Oct 08, 10:30 AM",
                            style: TextStyle(
                                color: ThemeUtils.colorTripsGrey, fontSize: 6),
                          ),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: ThemeUtils.colorTripsGrey,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(
                            "Sat, Oct 08, 10:30 AM",
                            style: TextStyle(
                                color: ThemeUtils.colorTripsGrey, fontSize: 6),
                          ),
                        ],
                      ),
                      }else if(isBoat== true)...{

                         Text(
                            "Sat, Oct 08 | 2 Hours | 12:00 AM",
                            style: TextStyle(
                                color: ThemeUtils.colorTripsGrey, fontSize: 6),
                          ),
                      },
                     
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 7.5,
                            height: 7.5,
                            decoration: BoxDecoration(
                              color: ThemeUtils.colorPurple,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            title,
                            style: TextStyle(
                                color: ThemeUtils.colorTripsGrey, fontSize: 8),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      const Spacer(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const AutoSizeText(
                            "\$137",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          NormalButton(
                              height: 25,
                              width: Get.context!.width * 0.30,
                              cornersRadius: 25,
                              text: titleButton,
                              textSize: 12,
                              onTap: () {},
                              backgroundColor: ThemeUtils.colorPurple),
                        ],
                      )
                    ]),
              ))
        ],
      ),
    );
  }
}
