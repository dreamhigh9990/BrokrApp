import 'package:brokr/src/blocs/listing_car.bloc.dart';
import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';

class CarInfoSection extends StateFullCustom {
  final ListingCarBloc bloc;
  CarInfoSection({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  @override
  CarInfoSectionState createState() => CarInfoSectionState();
}

class CarInfoSectionState extends State<CarInfoSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: widget.responsive.hp(5)),
        margin: EdgeInsets.symmetric(horizontal: widget.responsive.wp(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description",
              style: widget.fontSize.headline5(),
            ),
            SizedBox(height: widget.responsive.hp(1)),
            const Text(
              "Tell guests what makes your yacht unique and why they would love to be on it.",
            ),
            SizedBox(height: widget.responsive.hp(3)),
            InputCustomOutline(
              hintText: "Description",
              maxLines: 8,
              onChanged: widget.bloc.addDescription,
            ),
            SizedBox(height: widget.responsive.hp(6)),
            Text(
              "Licence plate",
              style: widget.fontSize.headline5(),
            ),
            SizedBox(height: widget.responsive.hp(2)),
            const Text(
              "Your license olate information won’t be publicly visible",
            ),
            SizedBox(height: widget.responsive.hp(2)),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  _buildTextField(
                      "Enter your license plate number", widget.bloc.addLicenceNumber),
                  const Divider(thickness: 1, height: 1, color: Colors.black38),
                  _buildTextField(
                    "State/Province",
                    widget.bloc.addState,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField _buildTextField(String label, Function(String) onChanged) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelStyle: const TextStyle(color: Colors.black),
        focusedBorder: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        // label: Padding(
        //   padding: const EdgeInsets.only(top: 8.0),
        //   child: Text(
        //     label,
        //     style: const TextStyle(color: Colors.black45, fontSize: 14),
        //   ),
        // ),
        hintText: label,
        hintStyle: const TextStyle(color: Colors.black45, fontSize: 14),
        alignLabelWithHint: true,
      ),
      onChanged: (value) => onChanged(value),
    );
  }
}

class InputCustomOutline extends StatelessWidget {
  final String? label;
  final int? maxLength;
  final InputCounterWidgetBuilder? buildCounter;
  final int? maxLines;
  final String? hintText;
  final Function(String)? onChanged;

  const InputCustomOutline({
    Key? key,
    this.label,
    this.maxLength,
    this.buildCounter,
    this.maxLines = 1,
    this.hintText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(),
        label: label != null
            ? Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Text(label!),
              )
            : null,
        floatingLabelStyle: const TextStyle(color: Colors.black),
      ),
      maxLines: maxLines,
      maxLength: maxLength,
      buildCounter: buildCounter,
    );
  }
}
