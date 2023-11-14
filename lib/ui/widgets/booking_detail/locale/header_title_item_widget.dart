import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/theme_utils.dart';
import '../../stars_widget.dart';

class HeaderTitleItemWidget extends StatelessWidget {
  final String title;
  final String owner;
  final String address;
  final String description;
  final double rating;
  final double bath;

  bool? showPrice;

  HeaderTitleItemWidget({
    super.key,
    required this.title,
    required this.owner,
    required this.address,
    required this.description,
    required this.rating,
    required this.bath,
    this.showPrice = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: showPrice! == true
          ? Get.context!.height * 0.1250
          : Get.context!.height * 0.06,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  StarsWidgetRight(rating: rating, size: 12),
                  const SizedBox(width: 8),
                  Container(
                    height: 15.0,
                    width: 2.5,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  SvgPicture.asset(
                    'assets/icons/super_host_icon.svg',
                    height: 10,
                  ),
                  AutoSizeText(
                    " Host Name Lastname",
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          fontSize: 14,
                          color: const Color(0xFF646464),
                        ),
                  ),
                ],
              ),
              if (showPrice!) ...{
                const SizedBox(
                  width: 5.0,
                ),
                FittedBox(
                  fit: BoxFit.cover,
                  child: RichText(
                    text: const TextSpan(
                      text: '138\$/',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Day',
                            style: TextStyle(
                                color: Color(0xFF646464), fontSize: 14)),
                      ],
                    ),
                  ),
                ),
              }
            ],
          ),
          AutoSizeText(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          if (showPrice!) ...{
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Icon(Icons.location_on_sharp,
                  color: Color(0xFF646464), size: 15),
              const SizedBox(
                width: 2.5,
              ),
              AutoSizeText(
                address,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
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
                    color: Color(0xFF646464), shape: BoxShape.circle),
              ),
              const SizedBox(
                width: 10.0,
              ),
              const AutoSizeText(
                "11.6 mi",
                style: TextStyle(
                  color: Color(0xFF646464),
                ),
              ),
            ]),
          },
          if (showPrice!) ...{ThemeUtils.dividerGrey}
        ],
      ),
    );
  }
}
