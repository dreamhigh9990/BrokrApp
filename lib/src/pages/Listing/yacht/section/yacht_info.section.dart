import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';

class YachtInfoSection extends StateFullCustom {
  final ListingYachtBloc bloc;
  YachtInfoSection({
    Key? key,
    required this.bloc,
  }) : super(key: key);
  @override
  YachtInfoSectionState createState() => YachtInfoSectionState();
}

class YachtInfoSectionState extends State<YachtInfoSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: widget.responsive.hp(4)),
        margin: EdgeInsets.symmetric(horizontal: widget.responsive.wp(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Boat title",
              style: widget.fontSize.headline4(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: widget.responsive.hp(3)),
              child: const Text(
                "This is what renters will see when they look for boats in your area, a good title will help you stand out.",
              ),
            ),
            SizedBox(height: widget.responsive.hp(2)),
            InputCustomOutline(
              hintText: "Listing title",
              maxLength: 50,
              buildCounter: (context,
                  {required currentLength, required isFocused, maxLength}) {
                var total = maxLength! - currentLength;
                return Text("$total characters remaining");
              },
              onChanged: widget.bloc.addTitle,
            ),
            SizedBox(height: widget.responsive.hp(4)),
            Text(
              "Description",
              style: widget.fontSize.headline4(),
            ),
            SizedBox(height: widget.responsive.hp(1)),
            const Text(
              "Tell guests what makes your boat unique and why they would love to be on it.",
            ),
            SizedBox(height: widget.responsive.hp(3)),
            InputCustomOutline(
              hintText: "Description",
              maxLines: 8,
              onChanged: widget.bloc.addDescription,
            ),
          ],
        ),
      ),
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
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        hintText: hintText,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38)
        ),
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
