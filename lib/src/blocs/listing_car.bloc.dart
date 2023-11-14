import 'dart:async';
import 'dart:io';

import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/pages/Listing/yacht/section/allowed.section.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

class ListingCarBloc {
  final _page = BehaviorSubject<int>();

  // SECTION 1
  final _make = BehaviorSubject<String>();
  final _model = BehaviorSubject<String>();
  final _year = BehaviorSubject<String>();

  //SECTION 2
  final _mapCoords = BehaviorSubject<LatLng>();

  //SECTION 3
  final _description = BehaviorSubject<String>();
  final _state = BehaviorSubject<String>();
  final _licenceNumber = BehaviorSubject<String>();

  //SECTION 4
  final _policyCancellation = BehaviorSubject<int>.seeded(0);

  // SECTION 5
  final _features = BehaviorSubject<List<Allowed>>.seeded([]);

  // SECTION 6
  final _cover = BehaviorSubject<List<File>>();
  final _photos = BehaviorSubject<List<File>>.seeded([]);

  //SECTION 7
  final _avaiblable =
      BehaviorSubject<AvailableDays>.seeded(availableDaysFactory());

  //SECTION 8
  final _prepareTripHour = BehaviorSubject<int>.seeded(3);

  //SECTION 9
  final _acceptTripTime = BehaviorSubject<int>.seeded(24);

  //SECTION 10
  final _acceptTripLongestTime = BehaviorSubject<int>.seeded(0);

  Stream<int> get pageStream => _page.stream;

  // SECTION 1
  Stream<String> get makeStream => _make.stream;
  Stream<String> get yearStream => _year.stream;
  Stream<String> get modelStream => _model.stream;

  //SECTION 2
  Stream<LatLng> get mapCoordsStream => _mapCoords.stream;

  //SECTION 3
  Stream<String> get stateStream => _state.stream;
  Stream<String> get descriptionStream => _description.stream;
  Stream<String> get licenceNumberStream => _licenceNumber.stream;

  //SECTION 4
  Stream<int> get policyCancellationStream => _policyCancellation.stream;

  //SECTION 4
  Stream<List<Allowed>> get featureStream => _features.stream;

  //SECTIN 5
  Stream<List<File>> get photosStream => _photos.stream;
  Stream<List<File>> get coverStream => _cover.stream;

  //SECTION 6
  Stream<AvailableDays> get availableStream => _avaiblable.stream;

  //SECTION 7
  Stream<int> get prepareTripHourStream => _prepareTripHour.stream;

  //SECTION 8
  Stream<int> get acceptTripTimeStream => _acceptTripTime.stream;

  //SECTION 9
  Stream<int> get acceptTripLongestTimeStream => _acceptTripLongestTime.stream;

  Function(int) get addPage => _page.sink.add;

  //SECTION 1
  Function(String) get addMake => _make.sink.add;
  Function(String) get addYear => _year.sink.add;
  Function(String) get addModel => _model.sink.add;

  //SECTION 2
  Function(LatLng) get addMapCoords => _mapCoords.sink.add;
  LatLng? get getCoords => _mapCoords.hasValue ? _mapCoords.value : null;

  //SECTION 3
  Function(String) get addState => _state.sink.add;
  Function(String) get addDescription => _description.sink.add;
  Function(String) get addLicenceNumber => _licenceNumber.sink.add;

  //SECTION 4
  Function(int) get addPolicyCancellation => _policyCancellation.sink.add;

  //SECTION 5
  addPhotos(List<File> photos) {
    _photos.sink.add([..._photos.value, ...photos]);
  }

  //SECTION 7
  Function(int) get addPrepareTripHour => _prepareTripHour.sink.add;

  //SECTION 8
  Function(int) get addAcceptTripTime => _acceptTripTime.sink.add;

  //SECTION 9
  Function(int) get addAcceptTripLongestTime => _acceptTripLongestTime.sink.add;

  removePhotos(int index) {
    final photos = _photos.value;
    photos.removeAt((index));
    _photos.add(photos);
  }

  Function(List<File>) get addCover => _cover.sink.add;

  Stream<bool> get validateSectionOne => CombineLatestStream.combine3(
      makeStream,
      modelStream,
      yearStream,
      (a, b, c) => a.isNotEmpty && b.isNotEmpty && c.isNotEmpty);

  Stream<bool> get validateSectionThree => CombineLatestStream.combine3(
      descriptionStream,
      licenceNumberStream,
      stateStream,
      (a, b, c) => a.isNotEmpty && b.isNotEmpty && c.isNotEmpty);

  Stream<bool> get validateSecionFive => CombineLatestStream.combine2(
      photosStream, coverStream, (a, b) => a.isNotEmpty && b.isNotEmpty);

  void defineOptionAvailableDay(int option) {
    switch (option) {
      case 0:
        _avaiblable.sink.add(availableDaysFactory());
        break;
      case 1:
        _avaiblable.sink
            .add(AvailableDays(option: 1, days: availableDaysFactory().days));
        break;
    }
  }

  void addDayConfig(Day day, String key) {
    final availableConfig = _avaiblable.value;
    availableConfig.days[key] = day;
    _avaiblable.sink.add(availableConfig);
  }

  Stream<bool> getValidation(int page) {
    switch (page) {
      case 0:
        return validateSectionOne;
      case 1:
        return mapCoordsStream.transform(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(true)));
      case 2:
        return validateSectionThree;
      case 3:
        return policyCancellationStream.transform(
            StreamTransformer.fromHandlers(
                handleData: (data, sink) => sink.add(true)));
      case 4:
        return _features.transform(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(data.isNotEmpty)));
      case 5:
        return validateSecionFive;
      case 6:
        return availableStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(true),
        ));
      case 7:
        return prepareTripHourStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data > 0),
        ));
      case 8:
        return acceptTripTimeStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data > 0),
        ));
      case 9:
        return acceptTripLongestTimeStream
            .transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data >= 0),
        ));
      case 10:
        return const Stream.empty();
      default:
        return Stream.error("Error");
    }
  }

  addFeature(Allowed feature) {
    _features.add([..._features.value, feature]);
  }

  removeFeature(Allowed feature) {
    final features = _features.value;
    features.removeWhere((element) => element.name == feature.name);
    _features.add(features);
  }

  Car getValueForSubmit() {
    final yacht = Car(
      photos: _photos.value,
      cover: _cover.value.first,
      description: _description.value,
      features: _features.value,
      mapCoords: _mapCoords.value,
      policy: _policyCancellation.value,
      year: _year.value,
      make: _make.value,
    );
    return yacht;
  }

}


class Car {
  final List<File> photos;
  final File cover;
  final String description;
  final List<Allowed> features;
  final LatLng mapCoords;
  final int policy;
  final String year;
  final String make;

  Car({
    required this.description,
    required this.cover,
    required this.photos,
    required this.features,
    required this.mapCoords,
    required this.policy,
    required this.year,
    required this.make,
  });
}