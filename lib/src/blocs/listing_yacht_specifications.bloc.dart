import 'package:rxdart/rxdart.dart';

class ListingYachtSpecificationsBloc {
  final _beam = BehaviorSubject<String>();
  final _type = BehaviorSubject<String>();
  final _speed = BehaviorSubject<String>();
  final _depth = BehaviorSubject<String>();
  final _length = BehaviorSubject<String>();
  final _category = BehaviorSubject<String>();

  final _beds = BehaviorSubject<int>.seeded(0);
  final _badrooms = BehaviorSubject<int>.seeded(0);
  final _bedrooms = BehaviorSubject<int>.seeded(0);
  final _passenger = BehaviorSubject<int>.seeded(0);

  String get length => _length.value;
  int get capacity => _passenger.value;
  int get badrooms => _badrooms.value;

  Stream<String> get beamStream => _beam.stream;
  Stream<String> get typeStream => _type.stream;
  Stream<String> get speedStream => _speed.stream;
  Stream<String> get depthStream => _depth.stream;
  Stream<String> get lengthStream => _length.stream;
  Stream<String> get categoryStream => _category.stream;

  Stream<int> get bedsStream => _beds.stream;
  Stream<int> get badroomsStream => _badrooms.stream;
  Stream<int> get bedroomsStream => _bedrooms.stream;
  Stream<int> get passengerStream => _passenger.stream;

  Function(String) get addType => _type.sink.add;
  Function(String) get addBeam => _beam.sink.add;
  Function(String) get addSpeed => _speed.sink.add;
  Function(String) get addDepth => _depth.sink.add;
  Function(String) get addLength => _length.sink.add;
  Function(String) get addCategory => _category.sink.add;

  Function(int) get addBeds => _beds.sink.add;
  Function(int) get addBadrooms => _badrooms.sink.add;
  Function(int) get addBedrooms => _bedrooms.sink.add;
  Function(int) get addPassenger => _passenger.sink.add;
}
