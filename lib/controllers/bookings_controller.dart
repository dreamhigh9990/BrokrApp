import 'package:brokr/models/booking_model.dart';
import 'package:brokr/models/listing_model.dart';
import 'package:get/get.dart';

class BookingsController {
  final _loadedListings = <ListingModel>[].obs;
  final _bookings = <BookingModel>[].obs;

  addListing(ListingModel list) {
    _loadedListings.addIf(!_loadedListings.contains(list), list);
  }

  addBooking(BookingModel book) {
    if (_bookings.isEmpty) {
      _bookings.add(book);
    } else {
      for (var element in _bookings) {
        if (element.bookingId != book.bookingId) {
          _bookings.add(book);
        } else {
          _bookings.remove(element);
          _bookings.add(book);
        }
      }
    }
  }
}
