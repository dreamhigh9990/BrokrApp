import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';
import 'package:brokr/src/pages/Listing/yacht/section/init_section.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List<String> years = <String>['2022', '2021', '2020', '2019'];
const List<String> makes = ["Ferretti"];

class SpecificationSection extends StatelessCustom {
  final ListingYachtBloc bloc;
  SpecificationSection({
    super.key,
    required this.bloc,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: responsive.hp(7)),
      margin: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.black38),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  StreamBuilder(
                    stream: bloc.yearStream,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return DropdownButtonWithoutBorderCustom(
                        items: years,
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
                        items: makes,
                        onChanged: bloc.addMake,
                        label: "Make",
                        value: snapshot.data,
                      );
                    },
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  _buildTextField(
                    "Length (ft)",
                    bloc.specificationsBloc.lengthStream,
                    (p0) => bloc.specificationsBloc.addLength(p0),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  _buildTextField(
                    "Beam",
                    bloc.specificationsBloc.beamStream,
                    (p0) => bloc.specificationsBloc.addBeam(p0),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  _buildStreamDropdown(
                      "Type",
                      bloc.specificationsBloc.typeStream,
                      makes,
                      bloc.specificationsBloc.addType),
                  const Divider(
                    height: 1,
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  _buildStreamDropdown(
                    "Category",
                    bloc.specificationsBloc.categoryStream,
                    makes,
                    bloc.specificationsBloc.addCategory,
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  _buildTextField(
                    "Depth",
                    bloc.specificationsBloc.depthStream,
                    (p0) => bloc.specificationsBloc.addDepth(p0),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.black38,
                    thickness: 1,
                  ),
                  _buildTextField(
                    "Speed",
                    bloc.specificationsBloc.speedStream,
                    bloc.specificationsBloc.addSpeed,
                  ),
                ],
              ),
            ),
            SizedBox(height: responsive.hp(7)),
            _buildIncrementDecrement(
              bloc.specificationsBloc.badroomsStream,
              "Badrooms",
              bloc.specificationsBloc.addBadrooms,
            ),
            _buildIncrementDecrement(
              bloc.specificationsBloc.bedroomsStream,
              "Bedrooms",
              bloc.specificationsBloc.addBedrooms,
            ),
            _buildIncrementDecrement(
              bloc.specificationsBloc.bedsStream,
              "Beds",
              bloc.specificationsBloc.addBeds,
            ),
            _buildIncrementDecrement(
              bloc.specificationsBloc.passengerStream,
              "Passenger capacity",
              bloc.specificationsBloc.addPassenger,
              limit: 13,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIncrementDecrement(
      Stream<int> stream, String label, Function(int) add,
      {limit}) {
    return StreamBuilder(
      stream: stream,
      initialData: 0,
      builder: (_, AsyncSnapshot<int> snapshot) {
        return IncrementDecrement(
          name: label,
          value: snapshot.data ?? 0,
          onChanged: add,
          limit: limit,
        );
      },
    );
  }

  Widget _buildStreamDropdown(String label, Stream stream, List<String> items,
      Function(String) onChanged) {
    return StreamBuilder(
      stream: stream,
      builder: (_, snapshot) {
        return DropdownButtonWithoutBorderCustom(
          items: items,
          onChanged: onChanged,
          label: label,
          value: snapshot.data,
        );
      },
    );
  }

  Widget _buildTextField(
      String label, Stream stream, Function(String) onChanged) {
    return StreamBuilder(
      stream: stream,
      builder: (_, AsyncSnapshot snapshot) {
        return TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
            label: Padding(
              padding: EdgeInsets.only(top: snapshot.hasData ? 8.0 : 5.0),
              child: Text(
                label,
                style: const TextStyle(color: Colors.black45, fontSize: 16),
              ),
            ),
          ),
          onChanged: (value) => onChanged(value),
          initialValue: snapshot.data,
        );
      },
    );
  }
}

class IncrementDecrement extends StateFullCustom {
  final String name;
  final int? limit;
  final int value;
  final Function(int) onChanged;
  IncrementDecrement(
      {super.key,
      this.limit,
      required this.name,
      required this.value,
      required this.onChanged});

  @override
  State<IncrementDecrement> createState() => _IncrementDecrementState();
}

class _IncrementDecrementState extends State<IncrementDecrement> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.responsive.hp(4.8)),
      child: Row(
        children: [
          Expanded(
            child: Text(widget.name, style: widget.fontSize.bodyText1()),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: widget.value == 0
                    ? null
                    : () {
                        widget.onChanged(widget.value - 1);
                      },
                child: AnimatedOpacity(
                  opacity: widget.value == 0 ? 0.2 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    decoration: BoxDecoration(
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(40.0)),
                    child: const FaIcon(
                      FontAwesomeIcons.minus,
                      size: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(width: widget.responsive.wp(3)),
              Text(
                "${widget.value}",
                style: widget.fontSize.bodyText1(),
              ),
              SizedBox(width: widget.responsive.wp(3)),
              GestureDetector(
                onTap: widget.limit != widget.value
                    ? () {
                        widget.onChanged(widget.value + 1);
                      }
                    : null,
                child: AnimatedOpacity(
                  opacity: widget.limit != widget.value ? 1 : 0.2,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5.0,
                      vertical: 5.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.plus,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
