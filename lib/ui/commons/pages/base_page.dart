import 'package:flutter/material.dart';
import '../../widgets/progress_page.dart';


class BasePage extends StatefulWidget {
  final Widget child;
  const BasePage({Key? key, required this.child}) : super(key: key);
  @override
  State createState() => _BasePage();
}

class _BasePage extends State<BasePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        ProgressPage(),
      ],
    );
  }
}
