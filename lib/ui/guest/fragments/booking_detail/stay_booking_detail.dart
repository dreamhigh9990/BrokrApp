import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/crew_member_model.dart';
import '../../../../models/policy_model.dart';
import '../../../../models/super_model.dart';
import '../../../widgets/booking_detail/stay_booking_widget.dart';
import '../../../widgets/tiles/amenities_tile_widget.dart';
import '../../../widgets/tiles/characteristics_widget.dart';
import '../../../widgets/tiles/review_tile_widget.dart';

class StayBookingDetail extends StatefulWidget {
  final SuperModel superModel;
  const StayBookingDetail({super.key, required this.superModel});

  @override
  State createState() => _StayBookingDetail();
}

class _StayBookingDetail extends State<StayBookingDetail> {
  int groupValue = 0;
  PolicyModel policy = PolicyModel('Friendly', 'legalStuff',
      'assets/icons/search_icon.svg', 'Oct 20, 2022', true);
  List<String> allowed = const ['Pets'];
  List<String> notAllowed = const ['Smoking'];

  CrewMember crew = const CrewMember('Pepe', 50, 4.5, 'Oct 2022',
      'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200');
  List<AmenitiesTieWidget> sampleAmenities = [
    AmenitiesTieWidget(
        amenitie: '1200 ft sq',
        iconPath: 'assets/icons/icon_1200ftsq.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        amenitie: '2 Bedrooms',
        iconPath: 'assets/icons/icon_two_bedrooms.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        amenitie: '3 Bed',
        iconPath: 'assets/icons/icon_three_bed.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        amenitie: '2 Bathrooms',
        iconPath: 'assets/icons/bathrooms.svg',
        height: 25,
        width: 25,
        color: Colors.black),
  ];

  List<AmenitiesTieWidget> sleepAmenities = [
    AmenitiesTieWidget(
        amenitie: '2 Kings Bed',
        iconPath: 'assets/icons/two_bed.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        amenitie: '1 Single Bed',
        iconPath: 'assets/icons/one_bed.svg',
        height: 25,
        width: 25,
        color: Colors.black),
  ];

  List<CharactersticsWidget> sampleCharacteristics = const [
    CharactersticsWidget(
      amenitie: 'Air Conditioning',
      iconPath: "assets/stayfeatures/airconditioning.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Back Yard',
      value: "0",
      iconPath: "assets/stayfeatures/backyard.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Balcony',
      value: "0",
      iconPath: "assets/stayfeatures/balcony.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Barbecue',
      value: "0",
      iconPath: "assets/stayfeatures/barbecue.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Dryer',
      value: "0",
      iconPath: "assets/stayfeatures/dryer.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Coffee Maker',
      value: "0",
      iconPath: "assets/stayfeatures/coffeemaker.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Freezer',
      value: "0",
      iconPath: "assets/stayfeatures/freezer.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Fridge',
      value: "0",
      iconPath: "assets/stayfeatures/fridge.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Breakfast',
      value: "0",
      iconPath: "assets/stayfeatures/breakfast.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Chimney',
      value: "0",
      iconPath: "assets/stayfeatures/chimney.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Cigarette',
      value: "0",
      iconPath: "assets/stayfeatures/cigarette.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Cradle',
      iconPath: "assets/stayfeatures/cradle.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Dishwasher',
      value: "0",
      iconPath: "assets/stayfeatures/dishwasher.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Electric Car Charger',
      value: "0",
      iconPath: "assets/stayfeatures/electriccarcharger.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Garden',
      iconPath: "assets/stayfeatures/garden.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Gym',
      value: "0",
      iconPath: "assets/stayfeatures/gym.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Movie Teather',
      value: "0",
      iconPath: "assets/stayfeatures/movie.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Hair Dryer',
      value: "0",
      iconPath: "assets/stayfeatures/hairdryer.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Heating',
      value: "0",
      iconPath: "assets/stayfeatures/heating.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Hot Iron',
      value: "0",
      iconPath: "assets/stayfeatures/hotiron.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Hot Shower',
      value: "0",
      iconPath: "assets/carfeatures/usb.svg",
    ),
    CharactersticsWidget(
      amenitie: 'Indoor Fireplace',
      iconPath: "assets/stayfeatures/Indoorfireplace.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Jacuzzi',
      iconPath: "assets/stayfeatures/jacuzzi.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Kitchen',
      iconPath: "assets/stayfeatures/kitchen.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Microwave',
      iconPath: "assets/stayfeatures/microwave.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'NoCigarette',
      iconPath: "assets/stayfeatures/nocigarette.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Outdoor Shower',
      iconPath: "assets/stayfeatures/outdoorshower.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Oven',
      iconPath: "assets/stayfeatures/oven.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Parking Lot',
      iconPath: "assets/stayfeatures/parkinglot.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Pool',
      iconPath: "assets/stayfeatures/pool.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Sunroof',
      iconPath: "assets/stayfeatures/poolTable.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Beachfront',
      iconPath: "assets/stayfeatures/seaview.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Smoke Detector',
      iconPath: "assets/stayfeatures/smokedetector.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Monoxide Detector',
      iconPath: "assets/stayfeatures/smokedetector.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Terrace',
      iconPath: "assets/stayfeatures/terrace.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Theater At Home',
      iconPath: "assets/stayfeatures/theaterathome.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Tv',
      iconPath: "assets/stayfeatures/tv.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Washing Mmachine',
      iconPath: "assets/stayfeatures/washingmachine.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Wifi',
      iconPath: "assets/stayfeatures/wifi.svg",
      value: "0",
    ),
    CharactersticsWidget(
      amenitie: 'Workplace',
      iconPath: "assets/stayfeatures/workplace.svg",
      value: "0",
    ),
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
  onPressContinue() {}
  messageHost() {}

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.context!.height,
      width: double.infinity,
      child: SingleChildScrollView(
        child: StayBookingWidget(
          sleepAmenities: sleepAmenities,
          superModel: widget.superModel,
          title: widget.superModel.name!,
          address: widget.superModel.address!,
          image: widget.superModel.image!,
          owner: "Luis",
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
          sampleAmenities: sampleAmenities,
          characteristics: sampleCharacteristics,
          reviews: sampleReviews,
          onPressContinue: () {
            onPressContinue();
          },
          messageHost: () {
            messageHost();
          },
        ),
      ),
    ));
  }
}
