import 'package:animate_do/animate_do.dart';
import 'package:brokr/locator_services/locator_services.dart';
import 'package:brokr/src/blocs/listing_car.bloc.dart';
import 'package:brokr/src/blocs/listing_building.bloc.dart';
import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/routes/navigation__route.dart';
import 'package:brokr/src/services/geolocator.service.dart';
import 'package:brokr/src/services/pool.services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSection extends StateFullCustom {
  final ListingBuildingBloc bloc;

  MapSection({super.key, required this.bloc});

  @override
  State<MapSection> createState() => _MapSectionState();
}

class _MapSectionState extends State<MapSection> {
  CameraPosition _initialPosition =
      const CameraPosition(target: LatLng(26.8206, 30.8025), zoom: 17);
  late GeolocatorService _geolocatorService;
  bool animateMarker = false;

  @override
  void initState() {
    _geolocatorService = LocatorServices.I<PoolServices>().geolocatorService;
    _geolocatorService.requestPermission();
    if (_geolocatorService.havePermission) {
      final positionSelected = widget.bloc.getCoords;
      _initialPosition = CameraPosition(
          target: LatLng(
            positionSelected?.latitude ??
                _geolocatorService.currentPosition.latitude,
            positionSelected?.longitude ??
                _geolocatorService.currentPosition.longitude,
          ),
          zoom: 17);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((_, p1) {
        return SizedBox(
          height: p1.maxHeight,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                child: GoogleMap(
                  initialCameraPosition: _initialPosition,
                  onCameraMove: (position) {
                    widget.bloc.addMapCoords(position.target);
                  },
                  onCameraIdle: () {
                    setState(() {
                      animateMarker = true;
                    });
                  },
                  onCameraMoveStarted: () {
                    setState(() {
                      animateMarker = false;
                    });
                  },
                ),
              ),
              Positioned(
                top: widget.responsive.hp(3),
                child: GestureDetector(
                  onTap: () => Get.toNamed(NavigationRoute.LISTINGBUILDINGADDRESS),
                  child: Container(
                    decoration: BoxDecoration(
                      color: widget.colorsTheme.surface,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(1, 2),
                          blurRadius: 2.0,
                          blurStyle: BlurStyle.outer,
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                      left: widget.responsive.wp(6.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: widget.responsive.wp(4),
                      vertical: 15,
                    ),
                    width: widget.responsive.wp(88),
                    child: Row(
                      children: [
                        const FaIcon(FontAwesomeIcons.locationDot),
                        SizedBox(
                          width: widget.responsive.wp(3),
                        ),
                        Text(
                          "Enter address",
                          style: widget.fontSize.subtitle1(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: SlideInDown(
                  from: 15,
                  animate: animateMarker,
                  duration: const Duration(milliseconds: 120),
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.locationPin,
                          size: 40,
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 9),
                          child: const FaIcon(
                            FontAwesomeIcons.ship,
                            color: Colors.white,
                            size: 16,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
