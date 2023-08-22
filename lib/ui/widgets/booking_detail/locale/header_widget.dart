// ignore_for_file: must_be_immutable

import 'package:brokr/utils/theme_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import 'header_image_item_widget.dart';

class HeaderSliverWidget extends StatefulWidget {
  final String imageUrl;
  bool isShrink = false;

  HeaderSliverWidget({
    Key? key,
    required this.imageUrl,
    this.isShrink = false,
  }) : super(key: key);

  @override
  State<HeaderSliverWidget> createState() => _HeaderSliverWidgetState();
}

class _HeaderSliverWidgetState extends State<HeaderSliverWidget> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SliverAppBar(
      expandedHeight: size.height * 0.35,
      stretch: true,
      pinned: true,
      leading: widget.isShrink
          ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios),
            )
          : Container(),
      title: widget.isShrink
          ? Text(
              "Title Full Listing Card Item",
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            )
          : null,
      backgroundColor: ThemeUtils.colorPurple,
      flexibleSpace: FlexibleSpaceBar(
          collapseMode: CollapseMode.parallax,
          stretchModes: const [
            StretchMode.zoomBackground,
          ],
          background: HeaderImageItemWidget(
              favorite: favorite, imageUrl: widget.imageUrl, isShow: true)),
      actions: widget.isShrink
          ? [
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 12),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Share.share(
                            'Check out this 📃 Listing on Brokr!  https://brokr.com/listing/001',
                            subject:
                                'Check out this 📃 Listing on Brokr!  https://brokr.com/listing/001');
                      },
                      child: const Icon(
                        Icons.file_upload_outlined,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        favorite = !favorite;
                        setState(() {});
                      },
                      child: Icon(
                        favorite == false
                            ? Icons.favorite_border
                            : Icons.favorite,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                  ],
                ),
              ),
            ]
          : null,
    );
  }
}
