import 'package:brokr/models/listing_model.dart';

class BookingModel {
  final String bookingId;
  final ListingModel listing;
  final String buyer;
  int guests;
  String startDate;
  String endDate;
  int hours;
  double hourPrice;
  double gratuity;
  double brokrFee;
  double tax;
  double total;
  double promoDiscount;
  bool isPromoPercent;
  String paymentMethod;
  bool isVerified;
  bool isCancelled;

  BookingModel(
      {required this.bookingId,
      required this.listing,
      required this.buyer,
      this.isCancelled = false,
      this.isVerified = false,
      this.guests = 0,
      this.startDate = '',
      this.endDate = '',
      this.hours = 0,
      this.hourPrice = 0.0,
      this.gratuity = 0.0,
      this.brokrFee = 0.0,
      this.tax = 0.0,
      this.total = 0.0,
      this.promoDiscount = 0.0,
      this.isPromoPercent = false,
      this.paymentMethod = ''});
}
