import '../../../../components/custom_widget_page/stateless_custom.dart';

class ConfirmAddressSection extends StatelessCustom {
  static const List<String> yearList = <String>['2022', '2021', '2020', '2019'];
  ConfirmAddressSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: responsive.hp(10)),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
          margin: EdgeInsets.symmetric(
            horizontal: responsive.wp(5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const InputCustom(label: "Street"),
              const Divider(height: 1, thickness: 1, color: Colors.black),
              const InputCustom(label: "City"),
              Row(
                children: [
                  const Expanded(
                    child: InputCustom(label: "State"),
                  ),
                  _buildLine(),
                  const Expanded(
                    child: InputCustom(label: "Zip code"),
                  ),
                ],
              ),
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  // labelText: "Country/Region",
                  label: Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text("Country/Region"),
                  ),
                  floatingLabelStyle: TextStyle(color: Colors.black),
                ),
                isExpanded: true,
                onChanged: (value) {},
                items: yearList
                    .map<DropdownMenuItem<String>>(
                      (e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
              const InputCustom(label: "Marina name"),
              Row(
                children: [
                  const Expanded(
                    child: InputCustom(label: "Slip number"),
                  ),
                  _buildLine(),
                  const Expanded(
                    child: InputCustom(label: "Dock/Pier"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildLine() {
    return Container(
      width: 1,
      height: 44.0,
      decoration: const BoxDecoration(color: Colors.black),
    );
  }
}

class InputCustom extends StatelessWidget {
  final String label;
  const InputCustom({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        hintText: label,
        focusedBorder: InputBorder.none,
      ),
    );
  }
}
