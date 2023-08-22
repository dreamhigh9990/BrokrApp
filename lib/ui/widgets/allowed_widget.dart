import 'package:flutter/material.dart';

class AllowedWidget extends StatelessWidget {
  final List<String> allowed;
  final List<String> notAllowed;

  const AllowedWidget(
      {super.key, required this.allowed, required this.notAllowed});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:const [
            Text('Allowed'),
            Text('Not Allowed'),
            SizedBox(
              width: 50,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: ListView.builder(
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemCount: allowed.length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(children: [
                   const Icon(Icons.check_circle_outline),
                    Text(allowed[index])
                  ]);
                },
              ),
            ),
            SizedBox(
                width: 100,
                child: ListView.builder(
                  physics:const  NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: notAllowed.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(children: [
                    const  Icon(Icons.cancel_outlined),
                      Text(notAllowed[index])
                    ]);
                  },
                )),
          const  SizedBox(
              width: 80,
            )
          ],
        ),
      ],
    );
  }
}
