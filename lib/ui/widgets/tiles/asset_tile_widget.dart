import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetTile extends StatelessWidget {
  final String owner;
  final String title;
  final String startDate;
  final String endDate;
  final String status;
  final String imagePath;

  const AssetTile({
    Key? key,
    required this.owner,
    required this.title,
    required this.status,
    required this.imagePath,
    required this.startDate,
    required this.endDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey, width: 0.5),
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                owner,
                style: TextStyle(
                  color: ThemeUtils.greyColor,
                  fontSize: 12,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                startDate,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.29),
                  fontSize: 10,
                ),
              ),
              Text(
                endDate,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.29),
                  fontSize: 10,
                ),
              ),
              MaterialButton(
                elevation: 0.0,
                minWidth: MediaQuery.of(context).size.width * 0.40,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    side: const BorderSide(color: Colors.grey)),
                onPressed: () {},
                child: Text(
                  status,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
