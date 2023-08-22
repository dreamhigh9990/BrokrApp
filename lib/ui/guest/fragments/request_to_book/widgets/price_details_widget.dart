import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/text_align_left_widget.dart';

class PriceDetailsCarWidget extends StatelessWidget {
  const PriceDetailsCarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 5.0,
        ),
        TextAlignLeft(
          title: "Price Details",
          fontsize: 16,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: const [
            Text(
              "\$900.00 x 3 days",
              style: TextStyle(fontSize: 12.0),
            ),
            Spacer(),
            Text("\$2,700.00", style: TextStyle(fontSize: 12.0))
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: const [
            Text(
              "Delivery",
              style: TextStyle(fontSize: 12.0),
            ),
            Spacer(),
            Text("\$100.00", style: TextStyle(fontSize: 12.0))
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: const [
            Text(
              "Service fee",
              style: TextStyle(fontSize: 12.0),
            ),
            Spacer(),
            Text("\$140.00", style: TextStyle(fontSize: 12.0))
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: const [
            Text(
              "Sale Tax",
              style: TextStyle(fontSize: 12.0),
            ),
            Spacer(),
            Text("\$205.00", style: TextStyle(fontSize: 12.0))
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Included miles 300",
                  style: TextStyle(fontSize: 12.0),
                ),
                Text(
                  "You’ll be charged (\$5) for each extra mile over the amount included",
                  style: TextStyle(fontSize: 06.sp),
                )
              ],
            ),
            const Spacer(),
            const Text("FREE", style: TextStyle(fontSize: 12.0))
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        ThemeUtils.dividerGrey,
        const SizedBox(
          height: 15.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
         const   Text(
              "Total (USD)",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          const  Spacer(),
              Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "\$3,145.80",
                  style: TextStyle(fontSize: 12.0),
                ),
           const     SizedBox(height: 5.0,),
                Text(
                  "More info",
                  style: TextStyle(fontSize: 12.sp,color: Colors.black,fontWeight: FontWeight.bold,decoration: TextDecoration.underline),
                )
              ],
            ),

          
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}

class PriceDetailsStayWidget extends StatelessWidget {
  const PriceDetailsStayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20.0,
        ),
        TextAlignLeft(
          title: "Price Details",
          fontsize: 16,
        ),
        const SizedBox(
          height: 20.0,
        ),
        Row(
          children: const [
            Text(
              "\$4,500.00 x 3 days",
              style: TextStyle(fontSize: 12.0),
            ),
            Spacer(),
            Text("\$2,700.00", style: TextStyle(fontSize: 12.0))
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: const [
            Text(
              "Cleaning fee",
              style: TextStyle(fontSize: 12.0),
            ),
            Spacer(),
            Text("\$100.00", style: TextStyle(fontSize: 12.0))
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: const [
            Text(
              "Brokr fee",
              style: TextStyle(fontSize: 12.0),
            ),
            Spacer(),
            Text("\$140.00", style: TextStyle(fontSize: 12.0))
          ],
        ),
        const SizedBox(
          height: 15.0,
        ),
        Row(
          children: const [
            Text(
              "Occupancy taxes and fees",
              style: TextStyle(fontSize: 12.0),
            ),
            Spacer(),
            Text("\$1,910.00", style: TextStyle(fontSize: 12.0))
          ],
        ),
        const SizedBox(
          height: 30.0,
        ),
        Row(
          children: const [
            Text(
              "Total (USD)",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text("\$3,142.80",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold))
          ],
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
