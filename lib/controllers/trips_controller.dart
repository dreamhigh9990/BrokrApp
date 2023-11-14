import 'package:brokr/models/booking_model.dart';
import 'package:get/get.dart';

enum TypeAsset { car, yacht, boat, stay }

enum BookingType { booked, history, requests }

class TripsController extends GetxController {
  final bookedYachtAssetsList = <BookingModel>[].obs;
  final historyYachtAssetsList = <BookingModel>[].obs;
  final requestsYachtAssetsList = <BookingModel>[].obs;

  final bookedCarAssetsList = <BookingModel>[].obs;
  final historyCarAssetsList = <BookingModel>[].obs;
  final requestsCarAssetsList = <BookingModel>[].obs;

  final bookedStayAssetsList = <BookingModel>[].obs;
  final historyStayAssetsList = <BookingModel>[].obs;
  final requestsStayAssetsList = <BookingModel>[].obs;

  final bookedBoatAssetsList = <BookingModel>[].obs;
  final historyBoatAssetsList = <BookingModel>[].obs;
  final requestsBoatAssetsList = <BookingModel>[].obs;

  getAssetsList(TypeAsset asset, BookingType book) {}
}
