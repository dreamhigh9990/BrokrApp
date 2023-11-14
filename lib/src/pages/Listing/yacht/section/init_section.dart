import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../components/custom_widget_page/stateless_custom.dart';

class InitSection extends StatelessCustom {
  final ListingYachtBloc bloc;

  InitSection({Key? key, required this.bloc}) : super(key: key);

  static const List<String> yearList = ['2022', '2021', '2020', '2019'];
  static const List<String> makeList = ["Ferretti"];
  static const List<String> locationType = <String>[
    'Marina slip',
    'Marina moorning',
    'Residence dock'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: responsive.hp(8)),
      width: double.infinity,
      height: 140,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: responsive.wp(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What boat do you have?",
              style: fontSize.headline4(),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black38),
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: EdgeInsets.only(top: responsive.hp(3)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder(
                    stream: bloc.yearStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return DropdownButtonWithoutBorderCustom(
                        items: yearList,
                        onChanged: bloc.addYear,
                        label: "Year",
                        value: snapshot.data,
                      );
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  StreamBuilder(
                    stream: bloc.makeStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return DropdownButtonWithoutBorderCustom(
                        items: makeList,
                        label: "Make",
                        onChanged: bloc.addMake,
                        value: snapshot.data,
                      );
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  StreamBuilder(
                    stream: bloc.modelStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return DropdownButtonWithoutBorderCustom(
                        items: const ["Model 1", "Model 2"],
                        label: "Model",
                        onChanged: bloc.addModel,
                        value: snapshot.data,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: responsive.hp(6)),
            Text(
              "Where you keep your boat?",
              style: fontSize.headline4(),
            ),
            SizedBox(height: responsive.hp(3)),
            DropdownButtonOutlineBorderCustom(
              items: locationType,
              onChanged: (value) => bloc.addLocationType(value!),
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownButtonOutlineBorderCustom extends StatelessWidget {
  const DropdownButtonOutlineBorderCustom({
    Key? key,
    required this.items,
    required this.onChanged,
  }) : super(key: key);

  final List<String> items;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: const Text("Location type"),
      items: items
          .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: onChanged,
      icon: Container(
        margin: const EdgeInsets.only(bottom: 0),
        child: const FaIcon(
          FontAwesomeIcons.chevronDown,
          size: 15,
        ),
      ),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.black38),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
        focusColor: Colors.black,
        fillColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
      ),
    );
  }
}

class DropdownButtonWithoutBorderCustom extends StatelessWidget {
  const DropdownButtonWithoutBorderCustom({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.label,
    this.value,
  }) : super(key: key);

  final List<String> items;
  final ValueChanged<String> onChanged;
  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: value,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        focusedBorder: InputBorder.none,
        label: Padding(
          padding: EdgeInsets.only(top: (value == null ? 2.0 : 8.0)),
          child: Text(label),
        ),
        labelStyle: const TextStyle(color: Colors.black45, fontSize: 16),
        // alignLabelWithHint: true,
      ),
      icon: Container(
        margin: const EdgeInsets.only(bottom: 23),
        child: const FaIcon(
          FontAwesomeIcons.chevronDown,
          size: 15,
        ),
      ),
      onChanged: (value) => onChanged(value!),
      items: items
          .map<DropdownMenuItem<String>>(
            (e) => DropdownMenuItem<String>(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
    );
  }
}
