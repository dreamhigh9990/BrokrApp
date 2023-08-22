import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/theme_utils.dart';
import '../../bottom_sheets/bottom_sheets_utils.dart';
import '../../widgets/normal_button.dart';
import 'confirmed_page.dart';

class CompleteProfile extends StatefulWidget {
  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  bool isEditPhoto = false;

  late File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
              top: Get.context!.height * 0.035,
              bottom: Get.context!.height * 0.035,
              left: Get.context!.width * 0.05,
              right: Get.context!.width * 0.05),
          child: NormalButton(
              text: "Complete",
              onTap: () {
                Get.offAllNamed(
                  CongratulationsPage.name,
                  arguments: 'number',
                );
              },
              backgroundColor: ThemeUtils.colorPurple),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Complete Profile",
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
        body: Padding(
            padding: EdgeInsets.only(
                top: Get.context!.height * 0.035,
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05),
            child: Container(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            var response =
                                await BottomSheetsUtils.buildBottomSheet(
                                    context: context,
                                    child: BottomSheetsUtils()
                                        .addCameraOrGallery(
                                            context: context,
                                            "Add your profile photo"),
                                    height: Get.context!.height * 0.3250,
                                    color: Colors.white,
                                    padding: const EdgeInsets.all(5.0));
                            print("//---/");
                            print(response);

                            if (response != null) {
                              file = response["files"];
                              isEditPhoto = true;
                              setState(() {});
                            }
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: Get.height * .08,
                            backgroundImage: isEditPhoto == false
                                ? Image.asset(
                                    "assets/icons/user-profile-avatar-svgrepo-com 1.png",
                                    fit: BoxFit.contain,
                                  ).image
                                : Image.file(
                                    file,
                                    fit: BoxFit.contain,
                                  ).image,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: CircleAvatar(
                                radius: Get.height * .025,
                                backgroundColor: ThemeUtils.colorPurple,
                                child: SvgPicture.asset(
                                    "assets/icons/camera.svg",
                                    height: 20,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: 60,
                          width: Get.context!.width,
                          child: InputDecorator(
                            decoration: ThemeUtils.inputDecoration(
                                fontWeight: FontWeight.normal,
                                isPadding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                labelText: "Name"),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder
                                    .none, // Eliminar el borde del TextField
                              ),
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 60,
                          width: Get.context!.width,
                          child: InputDecorator(
                            decoration: ThemeUtils.inputDecoration(
                                fontWeight: FontWeight.normal,
                                isPadding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0),
                                labelText: "Last Name"),
                            child: const TextField(
                              decoration: InputDecoration(
                                border: InputBorder
                                    .none, // Eliminar el borde del TextField
                              ),
                              textInputAction: TextInputAction.done,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            BottomSheetsUtils.buildBottomSheet(
                                context: context,
                                child: BottomSheetsUtils().addCalendar(),
                                height: Get.context!.height * 0.60,
                                color: Colors.white,
                                padding: const EdgeInsets.all(5.0));
                          },
                          child: SizedBox(
                            height: 60,
                            width: Get.context!.width,
                            child: InputDecorator(
                                decoration: ThemeUtils.inputDecoration(
                                    fontWeight: FontWeight.normal,
                                    labelText: "Birthday",
                                    isPadding: ThemeUtils.padding15),
                                child:  Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children:const [
                                    Text(
                                      "2023-03-01",
                                    ),
                                    Icon(Icons.calendar_today_outlined)
                                  ],
                                )),
                          ),
                        ),
                        // # code . . .
                      ]),
                ))));
  }
}


/*  */