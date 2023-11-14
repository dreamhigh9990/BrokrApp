import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';

class CustomCheckbox extends StatelessCustom {
  final bool value;
  final ValueChanged<bool?> onChanged;
  CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            gradient: value == true
                ? const LinearGradient(
                    colors: [Color(0xffFFB134), Color(0xffFF3A7E)],
                  )
                : null,
          ),
          padding: const EdgeInsets.all(2),
          child: Container(
            color: colorsTheme.surface,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: colorsTheme.primary,
              checkColor: const Color(0xffFF3A7E),
            ),
          ),
        ),
      ],
    );
  }
}
