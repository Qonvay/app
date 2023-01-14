// ignore_for_file: unnecessary_getters_setters, unused_element

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState extends ChangeNotifier {
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

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  LatLng? _pickupLocation;
  LatLng? get pickupLocation => _pickupLocation;
  set pickupLocation(LatLng? _value) {
    _pickupLocation = _value;
  }

  LatLng? _destinationLocation;
  LatLng? get destinationLocation => _destinationLocation;
  set destinationLocation(LatLng? _value) {
    _destinationLocation = _value;
  }

  double _buyMileage = 0.0;
  double get buyMileage => _buyMileage;
  set buyMileage(double _value) {
    _buyMileage = _value;
  }

  double _mileageBalance = 0;
  double get mileageBalance => _mileageBalance;
  set mileageBalance(double _value) {
    _mileageBalance = _value;
    prefs.setDouble('ff_mileageBalance', _value);
  }

  double _mileageCost = 0.0;
  double get mileageCost => _mileageCost;
  set mileageCost(double _value) {
    _mileageCost = _value;
  }

  double _ngnToKmCheck = 0.0;
  double get ngnToKmCheck => _ngnToKmCheck;
  set ngnToKmCheck(double _value) {
    _ngnToKmCheck = _value;
  }

  List<String> _receiverLocations = [];
  List<String> get receiverLocations => _receiverLocations;
  set receiverLocations(List<String> _value) {
    _receiverLocations = _value;
  }

  void addToReceiverLocations(String _value) {
    _receiverLocations.add(_value);
  }

  void removeFromReceiverLocations(String _value) {
    _receiverLocations.remove(_value);
  }

  String _destinationFullAddress = '';
  String get destinationFullAddress => _destinationFullAddress;
  set destinationFullAddress(String _value) {
    _destinationFullAddress = _value;
  }

  String _receiverName = '';
  String get receiverName => _receiverName;
  set receiverName(String _value) {
    _receiverName = _value;
  }

  int _receiverPhone = 0;
  int get receiverPhone => _receiverPhone;
  set receiverPhone(int _value) {
    _receiverPhone = _value;
  }

  bool _food = false;
  bool get food => _food;
  set food(bool _value) {
    _food = _value;
  }

  bool _clothing = false;
  bool get clothing => _clothing;
  set clothing(bool _value) {
    _clothing = _value;
  }

  bool _shoes = false;
  bool get shoes => _shoes;
  set shoes(bool _value) {
    _shoes = _value;
  }

  bool _electronics = false;
  bool get electronics => _electronics;
  set electronics(bool _value) {
    _electronics = _value;
  }

  bool _jewlaccess = false;
  bool get jewlaccess => _jewlaccess;
  set jewlaccess(bool _value) {
    _jewlaccess = _value;
  }

  bool _docs = false;
  bool get docs => _docs;
  set docs(bool _value) {
    _docs = _value;
  }

  bool _others = false;
  bool get others => _others;
  set others(bool _value) {
    _others = _value;
  }

  List<int> _bookNum = [];
  List<int> get bookNum => _bookNum;
  set bookNum(List<int> _value) {
    _bookNum = _value;
  }

  void addToBookNum(int _value) {
    _bookNum.add(_value);
  }

  void removeFromBookNum(int _value) {
    _bookNum.remove(_value);
  }

  String _milbaltemp = '';
  String get milbaltemp => _milbaltemp;
  set milbaltemp(String _value) {
    _milbaltemp = _value;
  }

  String _routeToRiderDistance = '';
  String get routeToRiderDistance => _routeToRiderDistance;
  set routeToRiderDistance(String _value) {
    _routeToRiderDistance = _value;
  }

  String _routeToRiderDuration = '';
  String get routeToRiderDuration => _routeToRiderDuration;
  set routeToRiderDuration(String _value) {
    _routeToRiderDuration = _value;
  }

  bool _bookingToggle = false;
  bool get bookingToggle => _bookingToggle;
  set bookingToggle(bool _value) {
    _bookingToggle = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
