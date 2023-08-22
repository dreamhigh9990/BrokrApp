// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../utils/theme_utils.dart';

class HeaderImageItemWidget extends StatefulWidget {
  bool? favorite;
  final String imageUrl;
  bool? isShow;
  HeaderImageItemWidget({
    super.key,
    required this.imageUrl,
    this.isShow = false,
    this.favorite,
  });

  @override
  State<HeaderImageItemWidget> createState() => _HeaderImageItemWidgetState();
}

class _HeaderImageItemWidgetState extends State<HeaderImageItemWidget> {
  int pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 0.1,
              viewportFraction: 1.0,
              onPageChanged: (index, __) {
                setState(() {
                  pageIndex = index + 1;
                });
              },
            ),
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: Get.context!.width,
                    child: CachedNetworkImage(
                      imageUrl: widget.imageUrl,
                      imageBuilder: (context, imageProvider) => Container(
                        width: Get.context!.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) => CardLoading(
                        width: MediaQuery.of(context).size.width,
                        height: Get.context!.height * 0.25,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Positioned(
          bottom: 10.0,
          left: Get.context!.width * 0.45,
          child: Container(
            width: 50,
            height: 25,
            color: Colors.black.withOpacity(0.42),
            alignment: Alignment.center,
            child: Text(
              "$pageIndex/5",
              style: TextStyle(fontSize: 14.sp, color: Colors.white),
            ),
          ),
        ),
        widget.isShow!
            ? Positioned(
                top: 0.0,
                child: Container(
                  //  color: Colors.orange,
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
                        onTap: () {
                          widget.favorite = !widget.favorite!;
                          setState(() {});
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              widget.favorite == false
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              color: widget.favorite == false
                                  ? Colors.black
                                  : ThemeUtils.colorPurple,
                            )),
                      ),
                    ],
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
