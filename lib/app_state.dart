import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _mileageBalance = prefs.getDouble('ff_mileageBalance') ?? _mileageBalance;
  }

  late SharedPreferences prefs;

  LatLng? pickupLocation;

  LatLng? destinationLocation;

  double buyMileage = 0.0;

  double _mileageBalance = 0;
  double get mileageBalance => _mileageBalance;
  set mileageBalance(double _value) {
    _mileageBalance = _value;
    prefs.setDouble('ff_mileageBalance', _value);
  }

  double mileageCost = 0.0;

  double ngnToKmCheck = 0.0;

  List<String> receiverLocations = [];

  String destinationFullAddress = '';

  String receiverName = '';

  int receiverPhone = 0;

  bool food = false;

  bool clothing = false;

  bool shoes = false;

  bool electronics = false;

  bool jewlaccess = false;

  bool docs = false;

  bool others = false;

  List<int> bookNum = [];

  String milbaltemp = '';
}

// ignore: unused_element
LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
