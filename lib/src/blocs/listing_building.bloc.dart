import 'dart:async';
import 'dart:io';

import 'package:brokr/src/blocs/listing_yacht.bloc.dart';
import 'package:brokr/src/pages/Listing/building/section/allowed.section.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

import 'package:brokr/src/blocs/listing_building_specifications.bloc.dart';

class ListingBuildingBloc {
  // Section 9
  final ListingBuildingSpecificationsBloc specificationsBloc;

  ListingBuildingBloc() : specificationsBloc = ListingBuildingSpecificationsBloc();


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

  //SECTION
  final _title = BehaviorSubject<String>();
  final _thingsToKnow = BehaviorSubject<String>();
  final _alloweds = BehaviorSubject<List<Allowed>>.seeded([]);
  final _acceptTripShortestTime = BehaviorSubject<int>.seeded(0);
  final _hosts = BehaviorSubject<List<Allowed>>.seeded([]);
  final _highlights = BehaviorSubject<List<Allowed>>.seeded([]);

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

  //SECTION
  Stream<String> get titleStream => _title.stream;
  Stream<String> get thingsToKnowStream => _thingsToKnow.stream;
  Stream<List<Allowed>> get allowedsStream => _alloweds.stream;
  Stream<int> get acceptTripShortestTimeStream => _acceptTripShortestTime.stream;
  Stream<List<Allowed>> get hostStream => _hosts.stream;
  Stream<List<Allowed>> get highlightStream => _highlights.stream;

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

  //SECTION
  Function(String) get addTitle => _title.sink.add;
  Function(String) get addThingsToKnow => _thingsToKnow.sink.add;
  Function(int) get addAcceptTripShortestTime => _acceptTripShortestTime.sink.add;

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

  Stream<bool> get validateSectionThree =>
      CombineLatestStream.combine2(_title, _description, (a, b) {
        return a.isNotEmpty && b.isNotEmpty;
      });

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

  void defineOptionAvailableBed(int option) {
    switch (option) {
      case 0:
        _avaiblable.sink.add(availableDaysFactory());
        break;
      case 1:
        _avaiblable.sink
            .add(AvailableDays(option: 1, days: availableDaysFactory().days));
        break;
      case 2:
        _avaiblable.sink
            .add(AvailableDays(option: 2, days: availableDaysFactory().days));
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
        return _hosts.transform(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(data.isNotEmpty)));
      case 1:
        return _highlights.transform(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(data.isNotEmpty)));
      case 2:
        return mapCoordsStream.transform(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(true)));
      case 3:
        return Future.value(true).asStream();
      case 4:
        return Future.value(true).asStream();
      case 5:
        return _features.transform(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(data.isNotEmpty)));
      case 6:
        return validateSecionFive;
      case 7:
        return validateSectionThree;
      case 8:
        return acceptTripShortestTimeStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data >= 0),
        ));
      case 9:
        return policyCancellationStream.transform(
            StreamTransformer.fromHandlers(
                handleData: (data, sink) => sink.add(true)));
      case 10:
        return thingsToKnowStream.transform<bool>(
            StreamTransformer.fromHandlers(
                handleData: (data, sink) => sink.add(data.isNotEmpty)));
      case 11:
        return _alloweds.transform<bool>(StreamTransformer.fromHandlers(
            handleData: (data, sink) => sink.add(data.isNotEmpty)));
      case 12:
        return availableStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(true),
        ));
      case 13:
        return prepareTripHourStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data > 0),
        ));
      case 14:
        return acceptTripTimeStream.transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data > 0),
        ));
      case 15:
        return acceptTripLongestTimeStream
            .transform(StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data >= 0),
        ));
      case 16:
        return const Stream.empty();
      default:
        return Stream.error("Error");
    }
  }

  Future pageChange() {
    return _page.listen((value) {}).asFuture();
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

  addHost(Allowed host) {
    _hosts.add([..._hosts.value, host]);
  }

  removeHost(Allowed host) {
    final hosts = _hosts.value;
    hosts.removeWhere((element) => element.name == host.name);
    _hosts.add(hosts);
  }

  addHighlight(Allowed highlight) {
    _highlights.add([..._highlights.value, highlight]);
  }

  removeHighlight(Allowed highlight) {
    final highlights = _highlights.value;
    highlights.removeWhere((element) => element.name == highlight.name);
    _highlights.add(highlights);
  }

  Building getValueForSubmit() {
    final building = Building(
      photos: _photos.value,
      cover: _cover.value.first,
      title: _title.value,
      description: _description.value,
      features: _features.value,
      thingsToKnow: _thingsToKnow.value,
      mapCoords: _mapCoords.value,
      policy: _policyCancellation.value,
    );
    return building;
  }

}


class Building {
  final List<File> photos;
  final File cover;
  final String title;
  final String description;
  final List<Allowed> features;
  final String thingsToKnow;
  final LatLng mapCoords;
  final int policy;

  Building({
    required this.description,
    required this.title,
    required this.cover,
    required this.photos,
    required this.features,
    required this.thingsToKnow,
    required this.mapCoords,
    required this.policy,
  });
}