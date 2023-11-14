// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/theme_utils.dart';

class HeaderImageItemWidget extends StatelessWidget {
  final String imageUrl;
  bool? isShow;
  HeaderImageItemWidget({
    super.key,
    required this.imageUrl,
    this.isShow = false,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius:
                        const BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10.0)),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            placeholder: (context, url) => CardLoading(
              width: MediaQuery.of(context).size.width,
              height: 250,
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          isShow!
              ? Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  padding: ThemeUtils.paddingScaffoldx05,
                  child: Row(
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
                      const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.file_upload_outlined,
                            color: Colors.black,
                          )),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          )),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
