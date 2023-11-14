import 'package:brokr/models/super_model.dart';
import 'package:flutter/material.dart';
import '../../../../models/crew_member_model.dart';
import '../../../../models/policy_model.dart';
import '../../../widgets/booking_detail/car_booking_widget.dart';
import '../../../widgets/tiles/amenities_tile_widget.dart';
import '../../../widgets/tiles/characteristics_widget.dart';
import '../../../widgets/tiles/review_tile_widget.dart';

class CarBookingDetail extends StatefulWidget {
  final SuperModel superModel;
  const CarBookingDetail({super.key, required this.superModel});

  @override
  State createState() => _CarBookingDetail();
}

class _CarBookingDetail extends State<CarBookingDetail> {
  int groupValue = 0;
  PolicyModel policy = PolicyModel('Friendly', 'legalStuff',
      'assets/icons/search_icon.svg', 'Oct 20, 2022', true);
  List<String> allowed = const ['Pets'];
  List<String> notAllowed = const ['Smoking'];

  CrewMember crew = const CrewMember('Pepe', 50, 4.5, 'Oct 2022',
      'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200');
  List<AmenitiesTieWidget> sampleAmenities = [
    AmenitiesTieWidget(
        amenitie: 'Gas Tipe',
        iconPath: 'assets/carfeatures/gasstation.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        amenitie: 'gastank mpg',
    iconPath: 'assets/carfeatures/gastankmpg.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        amenitie: 'Car dor',
     iconPath: 'assets/carfeatures/cardoor.svg',
        height: 25,
        width: 25,
        color: Colors.black),
    AmenitiesTieWidget(
        amenitie: '2 Seats',
       iconPath: 'assets/carfeatures/childseatsecurity.svg',
        height: 25,
        width: 25,
        color: Colors.black),
  ];



  List<ReviewTileHorizontalWidget> sampleReviews =  [
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
        name: 'Luis Ordoñez',
        text:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam sagittis placerat varius est et vestibulum. varius est et vestibulum.',
        image:
            'https://imageio.forbes.com/specials-images/imageserve/5d35eacaf1176b0008974b54/0x0.jpg?format=jpg&crop=4560,2565,x790,y784,safe&width=1200',
        date: 'Oct 20, 2022',
        id: '123',
        rating: 3.5),
  ];

  List<CharactersticsWidget> sampleCharacteristics = const [
    CharactersticsWidget(
    
        amenitie: 'Wheelchair Accesible',
        iconPath: "assets/carfeatures/wheelchair.svg",
        value: "0",
       ),
    CharactersticsWidget(
        amenitie: 'All Wheel Drive',
          value: "0.0",
        iconPath: "assets/carfeatures/allwheeldrive.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Android Auto',
          value: "0.0",
        iconPath: "assets/carfeatures/androidauto.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Apple Car Play',
          value: "0.0",
        iconPath: "assets/carfeatures/applecarplay.svg",
       ),
    CharactersticsWidget(
        amenitie: 'AUX Input',
        iconPath: "assets/carfeatures/auximput.svg",
          value: "0.0",
        ),
    CharactersticsWidget(
        amenitie: 'Backup Camera',
        iconPath: "assets/carfeatures/backupcamera.svg",
          value: "0.0",
        ),
    CharactersticsWidget(
        amenitie: 'Bike Rack',
        iconPath: "assets/carfeatures/bikerack.svg",
          value: "0.0",
        ),
    CharactersticsWidget(
        amenitie: 'Blind Spot Warning',
          value: "0.0",
        iconPath: "assets/carfeatures/blindspotwarning.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Bluetooth',
          value: "0.0",
        iconPath: "assets/carfeatures/bluetooth.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Child Seat',
          value: "0.0",
        iconPath: "assets/carfeatures/childseatsecurity.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Convertible',
          value: "0.0",
        iconPath: "assets/carfeatures/convertible.svg",
        ),
    CharactersticsWidget(
        amenitie: 'GPS',
          value: "0.0",
        iconPath: "assets/carfeatures/gps.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Heated Seats',  value: "0.0",
        iconPath: "assets/carfeatures/heatedseats.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Ventilated Seat',  value: "0.0",
        iconPath: "assets/carfeatures/ventilatedseat.svg",
       ),
    CharactersticsWidget(
        amenitie: 'Pet Friendly',  value: "0.0",
        iconPath: "assets/carfeatures/petfriendly.svg",
       ),
    CharactersticsWidget(
        amenitie: 'Ski Rack',  value: "0.0",
        iconPath: "assets/carfeatures/skirack.svg",
      ),
    CharactersticsWidget(
        amenitie: 'Snow Tires Or Chains',  value: "0.0",
        iconPath: "assets/carfeatures/snowtires.svg",
       ),
    CharactersticsWidget(
        amenitie: 'Sunroof',
        iconPath: "assets/carfeatures/sunroof.svg",
        value: "0.0",
        ),
    CharactersticsWidget(
        amenitie: 'Toll Pass',
            value: "0.0",
        iconPath: "assets/carfeatures/tollpass.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Usb Charger',
          value: "0.0",
        iconPath: "assets/carfeatures/usbcharger.svg",
       ),
    CharactersticsWidget(
        amenitie: 'Usb',
        iconPath: "assets/carfeatures/usb.svg",
          value: "0.0",
        ),
    CharactersticsWidget(
        amenitie: 'Automatic Transmission',
          value: "0.0",
        iconPath: "assets/carfeatures/gearshiftcarautomatic.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Manual Transmission',
          value: "0.0",
        iconPath: "assets/carfeatures/gearshiftcar.svg",
        ),
    CharactersticsWidget(
        amenitie: 'Keyless Entry',
        value: "0.0",
        iconPath: "assets/carfeatures/keylessentry.svg",
       ),
  ];

  //// nav to checkout
  onPressContinue() {}
  messageHost() {}

  @override
  void initState() {
    //code

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: CarBookingWidget(
            superModel: widget.superModel,
            title: widget.superModel.name!,
            address: widget.superModel.address!,
            image: widget.superModel.image!,
            owner: "Luis",
            rating: 4.5,
            price: 7490,
            price2: 7899,
            isFavourite: true,
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
            sampleCharacteristics: sampleCharacteristics,
            reviews: sampleReviews,
            onPressContinue: () {
              onPressContinue();
            },
            messageHost: () {
              messageHost();
            },
          ),
        ),
      ),
    );
  }
}
