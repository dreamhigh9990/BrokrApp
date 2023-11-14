import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../widgets/normal_button.dart';
import 'widgets/header_bar_widget.dart';

class GuessWidget extends StatefulWidget {
  const GuessWidget({super.key});

  @override
  State<GuessWidget> createState() => _GuessWidgetState();
}

class _GuessWidgetState extends State<GuessWidget> {
  int countAdults = 0;
  int countInfants = 0;
  int countChildrens = 0;
  int countPets = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const HeaderBarWidget(title: "Who"),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            height: Get.context!.height * 0.85,
            padding: EdgeInsets.only(
                left: Get.context!.width * 0.05,
                right: Get.context!.width * 0.05,
                top: 10.0,
                bottom: 10.0),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  customRow("Adults", "Age 13+", countAdults, addAdult,
                      removeAdult, "assets/icons/adult.svg"),
                  customRow("Infants", "Under 2", countInfants, addInfants,
                      removeInfants, "assets/icons/children.svg"),
                  customRow("Children", "Age 2-12", countChildrens,
                      addChildren, removeChildren, "assets/icons/infant.svg"),
                  customRow("Pets", "Brining a service animal?", countPets,
                      addPet, removePets, "assets/icons/pet.svg"),
                 const Spacer(),
                  NormalButton(
                    backgroundColor: ThemeUtils.colorPurple,
                    text: 'Save',
                    onTap: () {},
                    cornersRadius: 8,
                  ),
                ]),
          )
        ],
      ),
    );
  }

  void addAdult() {
    countAdults++;
    setState(() {});
  }

  void removeAdult() {
    countAdults--;
    setState(() {});
  }

  void addInfants() {
    countInfants++;
    setState(() {});
  }

  void removeInfants() {
    countInfants--;
    setState(() {});
  }

  void addChildren() {
    countChildrens++;
    setState(() {});
  }

  void removeChildren() {
    countChildrens--;
    setState(() {});
  }

  void addPet() {
    countPets++;
    setState(() {});
  }

  void removePets() {
    countPets--;
    setState(() {});
  }

  Widget customRow(String title, String subtitle, int value, Function add,
      Function remove, String svg) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: SvgPicture.asset(
              svg,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
              flex: 4,
              child: Container(
                //  color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(subtitle),
                  ],
                ),
              )),
          Container(
            // color: Colors.blue,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    remove();
                  },
                  child: Container(
                      height: 25,
                      width: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ThemeUtils.colorPurple,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      )),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  value.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                InkWell(
                  onTap: () {
                    add();
                  },
                  child: Container(
                      height: 25,
                      width: 25,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ThemeUtils.colorPurple,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

    /*     */