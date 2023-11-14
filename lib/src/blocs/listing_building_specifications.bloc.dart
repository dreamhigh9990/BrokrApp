import 'package:rxdart/rxdart.dart';

class ListingBuildingSpecificationsBloc {
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


  final _kingsizebed = BehaviorSubject<int>.seeded(0);
  final _doublebed = BehaviorSubject<int>.seeded(0);
  final _queensizebed = BehaviorSubject<int>.seeded(0);
  final _singlebed = BehaviorSubject<int>.seeded(0);
  final _twinbed = BehaviorSubject<int>.seeded(0);
  final _couchsofa = BehaviorSubject<int>.seeded(0);
  final _bunkbed = BehaviorSubject<int>.seeded(0);
  final _singlebedsofa = BehaviorSubject<int>.seeded(0);
  final _doublebedsofa = BehaviorSubject<int>.seeded(0);

  Stream<int> get kingsizebedStream => _kingsizebed.stream;
  Stream<int> get doublebedStream => _doublebed.stream;
  Stream<int> get queensizebedStream => _queensizebed.stream;
  Stream<int> get singlebedStream => _singlebed.stream;
  Stream<int> get twinbedStream => _twinbed.stream;
  Stream<int> get couchsofaStream => _couchsofa.stream;
  Stream<int> get bunkbedStream => _bunkbed.stream;
  Stream<int> get singlebedsofaStream => _singlebedsofa.stream;
  Stream<int> get doublebedsofaStream => _doublebedsofa.stream;

  Function(int) get addKingsizebed => _kingsizebed.sink.add;
  Function(int) get addDoublebed => _doublebed.sink.add;
  Function(int) get addQueensizebed => _queensizebed.sink.add;
  Function(int) get addSinglebed => _singlebed.sink.add;
  Function(int) get addTwinbed => _twinbed.sink.add;
  Function(int) get addCouchsofa => _couchsofa.sink.add;
  Function(int) get addBunkbed => _bunkbed.sink.add;
  Function(int) get addSinglebedsofa => _singlebedsofa.sink.add;
  Function(int) get addDoublebedsofa => _doublebedsofa.sink.add;


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
