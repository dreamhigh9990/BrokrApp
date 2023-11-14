import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';

class CustomOutlineInputField extends StatelessCustom {
  final String label;
  final Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  CustomOutlineInputField({
    super.key,
    required this.label,
    this.onChanged,
    this.prefixIcon,
    this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,     
        suffixIcon: suffixIcon,   
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(10.0),
        ),
        labelStyle: const TextStyle(color: Colors.black),
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black38),
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
      ),
    );
  }
}
