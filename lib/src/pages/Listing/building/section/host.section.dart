import 'package:brokr/src/blocs/listing_building.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:brokr/src/pages/Listing/building/section/allowed.section.dart';
import 'package:brokr/src/components/custom_widget_page/stateless_custom.dart';

class BuildingHostSection extends StatelessCustom {
  final ListingBuildingBloc bloc;

  BuildingHostSection({Key? key, required this.bloc}) : super(key: key);

  final List<Allowed> allowedList = [
    Allowed(icon: FontAwesomeIcons.house, name: "House"),
    Allowed(icon: FontAwesomeIcons.building, name: "Apartment"),
    Allowed(icon: FontAwesomeIcons.store, name: "Mansion"),
    Allowed(icon: FontAwesomeIcons.hotel, name: "Tonwhouse"),
  ];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Allowed>>(
      stream: bloc.hostStream,
      initialData: [],
      builder: (BuildContext context, AsyncSnapshot<List<Allowed>> snapshot) {
        return Container(
          padding: EdgeInsets.only(top: responsive.hp(3)),
          margin: EdgeInsets.symmetric(horizontal: responsive.wp(5)),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(2),
                  vertical: responsive.hp(3),
                ),
                sliver: SliverGrid.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(allowedList.length, (index) {
                    final active = (snapshot.data
                            ?.map<String>((e) => e.name)
                            .contains(allowedList[index].name)) ??
                        false;
                    return IconCard(
                      value: active,
                      allowed: allowedList[index],
                      onSelected: ((bool status) {
                        status
                            ? bloc.addHost(allowedList[index])
                            : bloc.removeHost(allowedList[index]);
                      }),
                    );
                  }),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: responsive.hp(6)),
                    Text(
                      "How big is your place?",
                      style: fontSize.headline5(),
                    ),
                    SizedBox(height: responsive.hp(4)),
                    InputCustomOutline(
                      hintText: "Enter square feet",
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}



class IconCardLarge extends StateFullCustom {
  IconCardLarge({
    Key? key,
    required this.allowed,
    this.onSelected,
    required this.value,
  }) : super(key: key);
  @override
  IconCardLargeState createState() => IconCardLargeState();

  final Function(bool)? onSelected;
  final Allowed allowed;
  final bool value;
}

class IconCardLargeState extends State<IconCardLarge> {
  // bool active = false;

  @override
  void initState() {
    // setState(() {
    //   active = widget.value;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.onSelected != null) {
          widget.onSelected!(!widget.value);
        }
      },
      child: Card(
        color: widget.value ? widget.colorsTheme.secondary : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              
              gradient: widget.value
                  ? LinearGradient(
                      colors: [
                        widget.colorsTheme.primary,
                        widget.colorsTheme.secondary,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.topRight,
                      transform: const GradientRotation(05),
                    )
                  : null),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(
                widget.allowed.icon,
                size: 18,
                color: widget.value ? Colors.white : Colors.black45,
              ),
              SizedBox(
                width: widget.responsive.hp(1),
              ),
              Text(
                widget.allowed.name,
                style: TextStyle(
                  color: widget.value ? Colors.white : Colors.black,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
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