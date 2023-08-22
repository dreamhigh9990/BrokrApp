import 'package:flutter/material.dart';

import 'tiles/tile_widget.dart';

class DashboardTile extends StatelessWidget {
  final String text;
  final IconData icon;

  const DashboardTile({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tile(
      height: 100,
      width: 100,
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: 70,
          ),
          Text(text),
        ],
      ),
    );
  }
}
