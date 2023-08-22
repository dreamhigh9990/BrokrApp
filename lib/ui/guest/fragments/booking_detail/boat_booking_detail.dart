import 'package:brokr/models/super_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/crew_member_model.dart';
import '../../../../models/policy_model.dart';
import '../../../widgets/booking_detail/boat_booking_widget.dart';
import '../../../widgets/tiles/amenities_tile_widget.dart';
import '../../../widgets/tiles/characteristics_widget.dart';
import '../../../widgets/tiles/review_tile_widget.dart';
import '../request_to_book/boat_request_book_page.dart';
import 'widgets/bottom_bar_widget.dart';

class BoatBookingDetail extends StatefulWidget {
  final SuperModel superModel;
  const BoatBookingDetail({super.key, required this.superModel});

  @override
  State createState() => _BoatBookingDetail();
}

class _BoatBookingDetail extends State<BoatBookingDetail> {
  int groupValue = 0;
  PolicyModel policy = PolicyModel('Friendly', 'legalStuff',
      'assets/icons/search_icon.svg', 'Oct 20, 2022', true);
  List<String> allowed = const ['Pets'];
  List<String> notAllowed = const ['Smoking'];

  CrewMember crew = const CrewMember('Pepe', 50, 4.5, 'Oct 2022',
      'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200');
  List<AmenitiesTieWidget> sampleAmenities = [
    AmenitiesTieWidget(
        fontSizeText: 10,
        amenitie: '36 ft',
        iconPath: 'assets/specifications_boats/length.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        amenitie: '2021',
        fontSizeText: 10,
        iconPath: 'assets/specifications_boats/year.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        fontSizeText: 10,
        amenitie: 'AQUILA YACHTS',
        iconPath: 'assets/specifications_boats/make.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        fontSizeText: 10,
        amenitie: '36',
        iconPath: 'assets/specifications_boats/model.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        fontSizeText: 10,
        amenitie: '12 Passengers ',
        iconPath: 'assets/specifications_boats/capacity.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        amenitie: 'Catamaran ',
        fontSizeText: 10,
        iconPath: 'assets/specifications_boats/type.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        fontSizeText: 10,
        amenitie: '3 Staterooms',
        iconPath: 'assets/specifications_boats/rooms.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        fontSizeText: 10,
        amenitie: '2 Bed count',
        iconPath: 'assets/specifications_boats/beds.svg',
        height: 25,
        width: 25,
        color: Colors.black),
  ];

  List<CharactersticsWidget> sampleCharacteristics = const [
    CharactersticsWidget(
      amenitie: 'Jacuzzy',
      iconPath: "assets/boatfeatures/jacuzzy.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Red Wine',
      iconPath: "assets/boatfeatures/red_wine.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'WiFi',
      iconPath: "assets/boatfeatures/wifi.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Pets',
      iconPath: "assets/boatfeatures/pets.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Swimming',
      iconPath: "assets/boatfeatures/swim.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Alcohol',
      iconPath: "assets/boatfeatures/alcohol.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Bed Count',
      iconPath: "assets/boatfeatures/bed.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Shoes',
      iconPath: "assets/boatfeatures/shoes.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Fishing',
      iconPath: "assets/boatfeatures/fishing.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Snorkeling Gear',
      iconPath: "assets/boatfeatures/snork.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Jet Ski',
      iconPath: "assets/boatfeatures/jetski.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Fish Finder',
      iconPath: "assets/boatfeatures/fish.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Paddleboards',
      iconPath: "assets/boatfeatures/paddleboards.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Fishing Gear',
      iconPath: "assets/boatfeatures/fishing_gear.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Rod Holders',
      iconPath: "assets/boatfeatures/rod_holders.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Anchor',
      iconPath: "assets/boatfeatures/anchor.svg",
      value: "0",
    )
  ];

  List<ReviewTileHorizontalWidget> sampleReviews = [
    ReviewTileHorizontalWidget(
        name: 'Raymond',
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam sagittis placerat varius est et vestibulum. varius est et vestibulum.',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
        date: 'Oct 20, 2022',
        id: '123',
        rating: 3.5),
    ReviewTileHorizontalWidget(
        name: 'Demos',
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam sagittis placerat varius est et vestibulum. varius est et vestibulum.',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
        date: 'Oct 20, 2022',
        id: '123',
        rating: 3.5),
  ];
  //// nav to checkout

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
          height: Get.context!.height,
          width: Get.context!.width,
          child: BoatBookingWidget(
            owner: "Luis",
            superModel: widget.superModel,
            title: widget.superModel.name!,
            address: widget.superModel.address!,
            image: widget.superModel.image!,
            rating: 4.5,
            price: 7490,
            price2: 7899,
            isFavourite: true,
            margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            bath: 4,
            bed: 4,
            description: "asdsadsads",
            startDate: 'Sat, Oct 08, 10:30 AM',
            endDate: 'Sat, Oct 08, 10:30 AM',
            guests: 15,
            policy: policy,
            crew: crew,
            allowed: allowed,
            notAllowed: notAllowed,
            amenities: sampleAmenities,
            characteristics: sampleCharacteristics,
            reviews: sampleReviews,
            onPressContinue: () {},
            messageHost: () {},
          ),
        ),
        bottomNavigationBar: DetailBottomBarWidget(
          onPressed: () {
            Get.to(BoatRequestBookPage(
              superModel: widget.superModel,
              address: "Miami, FL",
              bath: 20.0,
              description: "No Description",
              owner: "Luis Gonzalez",
              rating: 4,
              title: "Jaguar XF 2015",
            ));
          },
        ));
  }
}
