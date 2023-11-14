import 'package:brokr/ui/widgets/stars_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewTileHorizontalWidget extends StatelessWidget {
  final String name;
  final String text;
  final String image;
  final String date;
  final String id;
  final double rating;
  final double imageSide = 35.0;

  bool? isSmall;

   ReviewTileHorizontalWidget(
      {super.key,
      required this.name,
      required this.text,
      required this.image,
      required this.date,
      required this.id,
      required this.rating,
      this.isSmall = false,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.context!.width * 0.65,
      margin: const EdgeInsets.all(5.0),
      padding: const EdgeInsets.all(12.5),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 1),
            blurRadius: 5,
          ),
        ],
        color: Colors.white,
        //   color: Colors.green,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            //  color: Colors.orange,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Container(
                      height: isSmall == false ? 40 :55,
                      width:isSmall == false ? 40 :55,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(
                                image,
                              ),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                       const  Text(
                           "Jimmy Castro",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontFamily: "Inter-Regular",
                           ),
                         ),
                         StarsWidget(rating: rating, size: 12),
                        ],
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Align(
                  alignment: Alignment.topRight,
                  child:   Text(
                    "12 Apr 2023",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontFamily: "Inter-Regular",
                        color: Colors.grey,
                        fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
        const  SizedBox(
            height: 5.0,
          ),
          Expanded(
            child: SizedBox(
              // color: Colors.blue,
              height: Get.context!.height * 0.085,
              child:   Text(
                text ,
                style:  TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey,
                  fontFamily: ThemeUtils.interRegular,
                 
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          )
        ],
      ),
    );
  }
}
