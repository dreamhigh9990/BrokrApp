import 'dart:io';
import 'dart:async';

import 'package:brokr/src/blocs/listing_yacht_specifications.bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../pages/Listing/yacht/section/allowed.section.dart';

class CompositionValue<T> {
  final bool a;
  final T b;
  CompositionValue({required this.a, required this.b});
}

class Day {
  final bool active;
  final double from;
  final double? until;

  Day({
    required this.active,
    required this.from,
    required this.until,
  });
}

class AvailableDays {
  final int option;
  final Map<String, Day> days;

  AvailableDays({
    required this.option,
    required this.days,
  });
}

AvailableDays availableDaysFactory() {
  return AvailableDays(option: 0, days: {
    "Monday": Day(active: true, from: 0, until: 0),
    "Tuesday": Day(active: true, from: 0, until: 0),
    "Wednesday": Day(active: true, from: 0, until: 0),
    "Thursday": Day(active: true, from: 0, until: 0),
    "Friday": Day(active: true, from: 0, until: 0),
    "Saturday": Day(active: true, from: 0, until: 0),
    "Sunday": Day(active: true, from: 0, until: 0),
  });
}

class ListingYachtBloc {
  // Section 9
  final ListingYachtSpecificationsBloc specificationsBloc;

  ListingYachtBloc() : specificationsBloc = ListingYachtSpecificationsBloc();

  late List<Stream<bool>> listValidate = [];

  final _page = BehaviorSubject<int>();

  //SECTION 1
  final _year = BehaviorSubject<String>();
  final _make = BehaviorSubject<String>();
  final _model = BehaviorSubject<String>();
  final _locationType = BehaviorSubject<String>();

  //SECTION 2
  final _mapCoords = BehaviorSubject<LatLng>();

  //SECTION 3
  final _title = BehaviorSubject<String>();
  final _description = BehaviorSubject<String>();

  //SECTION 4
  final _policyCancelation = BehaviorSubject<int>.seeded(0);

  //SECTION 5
  final _thingsToKnow = BehaviorSubject<String>();

  // SECTION 6
  final _alloweds = BehaviorSubject<List<Allowed>>.seeded([]);

  // SECTION 7
  final _features = BehaviorSubject<List<Allowed>>.seeded([]);

  //SECTION 8
  final _cover = BehaviorSubject<List<File>>();
  final _photos = BehaviorSubject<List<File>>.seeded([]);

  //SECTION 10
  final _avaiblable =
      BehaviorSubject<AvailableDays>.seeded(availableDaysFactory());

  final _duration = BehaviorSubject<String>();
  final _multiBooking = BehaviorSubject<bool>.seeded(true);
  final _timeDelayBooking = BehaviorSubject<int>.seeded(0);

  //international trip
  final _internationalTrip = BehaviorSubject<bool>.seeded(true);
  final _destinations = BehaviorSubject<List<String>>.seeded([]);
  final _destination = BehaviorSubject<String>.seeded("");
  final _timeITrip = BehaviorSubject<int>.seeded(0);

  Stream<int> get pageStream => _page.stream;

  //SECTION 1
  Stream<String> get yearStream => _year.stream;
  Stream<String> get makeStream => _make.stream;
  Stream<String> get locationTypeStream => _locationType.stream;
  Stream<String> get modelStream => _model.stream;

  //SECTION 2
  Stream<LatLng> get mapCoordsStream => _mapCoords.stream;

  //SECTION 3
  Stream<String> get titleStream => _title.stream;
  Stream<String> get descriptionStream => _description.stream;

  //SECTION 4
  Stream<int> get policyCancelationStream => _policyCancelation.stream;

  //SECTION 5
  Stream<String> get thingsToKnowStream => _thingsToKnow.stream;

  //SECTION 6
  Stream<List<Allowed>> get allowedsStream => _alloweds.stream;

  //SECTION 7
  Stream<List<Allowed>> get featureStream => _features.stream;

  //SECTION 8
  Stream<AvailableDays> get availableStream => _avaiblable.stream;

  Stream<String> get durationStream => _duration.stream;
  Stream<bool> get multiBookingStream => _multiBooking.stream;
  Stream<int> get timeDelayBookingStream => _timeDelayBooking.stream;
  Stream<List<File>> get photosStream => _photos.stream;
  Stream<List<File>> get coverStream => _cover.stream;

  //international trip
  Stream<bool> get internationalTripStream => _internationalTrip.stream;
  Stream<List<String>> get timePrepareITripStream => _destinations.stream;
  Stream<String> get destinationStream => _destination.stream;
  Stream<int> get timeITripStream => _timeITrip.stream;

  Function(int) get addPage => _page.sink.add;

  //SECTION 1
  void Function(String) get addYear => _year.sink.add;
  void Function(String) get addMake => _make.sink.add;
  void Function(String) get addModel => _model.sink.add;
  void Function(String) get addLocationType => _locationType.sink.add;

  //SECTION 2
  Function(LatLng) get addMapCoords => _mapCoords.sink.add;
  LatLng? get getCoords => _mapCoords.hasValue ? _mapCoords.value : null;

  //SECTION 3
  Function(String) get addTitle => _title.sink.add;
  Function(String) get addDescription => _description.sink.add;

  // SECTION 4
  Function(int) get addPolicyCancelation => _policyCancelation.sink.add;

  // SECTION 5
  Function(String) get addThingsToKnow => _thingsToKnow.sink.add;

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

  Function(String) get addDuration => _duration.sink.add;
  Function(bool) get addMultiBooking => _multiBooking.sink.add;
  Function(int) get addtimeDelayBooking => _timeDelayBooking.sink.add;
  Function(List<File>) get addCover => _cover.sink.add;

  //international trip
  Function(bool) get addInternationalTrip => _internationalTrip.sink.add;
  Function(List<String>) get addTimePrepareITrip => _destinations.sink.add;
  Function(String) get addDestination => _destination.sink.add;
  Function(int) get addTimeITrip => _timeITrip.sink.add;

  Stream<bool> get validateSectionOne => CombineLatestStream.combine4(
          locationTypeStream, yearStream, makeStream, modelStream,
          (a, b, c, d) {
        return true;
      });

  Stream<bool> get validateSectionThree =>
      CombineLatestStream.combine2(_title, _description, (a, b) {
        return a.isNotEmpty && b.isNotEmpty;
      });

  Stream<bool> get validateSecionEight => CombineLatestStream.combine2(
      photosStream, coverStream, (a, b) => a.isNotEmpty && b.isNotEmpty);

  Stream<bool> get validateSectionNine => CombineLatestStream.combine8(
          yearStream,
          makeStream,
          specificationsBloc.beamStream,
          specificationsBloc.lengthStream,
          specificationsBloc.typeStream,
          specificationsBloc.categoryStream,
          specificationsBloc.depthStream,
          specificationsBloc.speedStream, (a, b, c, d, e, f, g, h) {
        return c.isNotEmpty &&
            d.isNotEmpty &&
            e.isNotEmpty &&
            f.isNotEmpty &&
            g.isNotEmpty &&
            h.isNotEmpty;
      });

  Stream<bool> getValidation(int page) {
    switch (page) {
      case 0:
        return validateSectionOne;
      case 1:
        return mapCoordsStream.transform<bool>(
            StreamTransformer.fromHandlers(handleData: (data, sink) {
          sink.add(true);
        }));
      case 2:
        return validateSectionThree;
      case 3:
        return policyCancelationStream.transform<bool>(
            StreamTransformer.fromHandlers(
                handleData: (data, sink) => sink.add(true)));
      case 4:
        return thingsToKnowStream.transform<bool>(
            StreamTransformer.fromHandlers(
                handleData: (data, sink) => sink.add(data.isNotEmpty)));
      case 5:
        return _alloweds.transform<bool>(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(data.isNotEmpty)));
      case 6:
        return _features.transform(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(data.isNotEmpty)));
      case 7:
        return validateSecionEight;
      case 8:
        return validateSectionNine;
      case 9:
        return availableStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(true),
        ));
      case 10:
        return durationStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data.isNotEmpty),
        ));
      case 11:
        return mergeMultiBooking.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(true),
        ));
      case 12:
        return mergeInternationalTrip.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(true),
        ));
      case 13:
        return timeITripStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(true),
        ));
      case 14:
        return timeITripStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(true),
        ));
      case 15:
        return Future.value(true).asStream();
      default:
        return Stream.error("error");
    }
  }

  Stream<CompositionValue<int>> get mergeMultiBooking =>
      CombineLatestStream.combine2(_multiBooking, _timeDelayBooking, (a, b) {
        return CompositionValue(a: a, b: b);
      });

  Stream<CompositionValue<List<String>>> get mergeInternationalTrip =>
      CombineLatestStream.combine2(_internationalTrip, _destinations, (a, b) {
        return CompositionValue(a: a, b: b);
      });

  addPhotos(List<File> photos) {
    _photos.sink.add([..._photos.value, ...photos]);
  }

  Future pageChange() {
    return _page.listen((value) {}).asFuture();
  }

  removePhotos(int index) {
    final photos = _photos.value;
    photos.removeAt((index));
    _photos.add(photos);
  }

  pushDestination() {
    _destinations.sink.add([..._destinations.value, _destination.value]);
  }

  removeDestination(int index) {
    final d = _destinations.value;
    d.removeAt(index);
    _destinations.sink.add(d);
  }

  addAllowed(Allowed allowed) {
    _alloweds.add([..._alloweds.value, allowed]);
  }

  removeAllowed(Allowed allowed) {
    final a = _alloweds.value;
    a.removeWhere((element) => element.name == allowed.name);
    _alloweds.add(a);
  }

  addFeature(Allowed feature) {
    _features.add([..._features.value, feature]);
  }

  removeFeature(Allowed feature) {
    final features = _features.value;
    features.removeWhere((element) => element.name == feature.name);
    _features.add(features);
  }

  Yacht getValueForSubmit() {
    final yacht = Yacht(
      photos: _photos.value,
      cover: _cover.value.first,
      title: _title.value,
      description: _description.value,
      features: _features.value,
      thingsToKnow: _thingsToKnow.value,
      mapCoords: _mapCoords.value,
      policy: _policyCancelation.value,
      year: _year.value,
      make: _make.value,
      length: specificationsBloc.length,
      capacity: specificationsBloc.capacity,
      bathrooms: specificationsBloc.badrooms,
    );
    return yacht;
  }
}

class Yacht {
  final List<File> photos;
  final File cover;
  final String title;
  final String description;
  final List<Allowed> features;
  final String thingsToKnow;
  final LatLng mapCoords;
  final int policy;
  final String year;
  final String make;
  final String length;
  final int capacity;
  final int bathrooms;

  Yacht({
    required this.description,
    required this.title,
    required this.cover,
    required this.photos,
    required this.features,
    required this.thingsToKnow,
    required this.mapCoords,
    required this.policy,
    required this.year,
    required this.make,
    required this.length,
    required this.capacity,
    required this.bathrooms,
  });
}
