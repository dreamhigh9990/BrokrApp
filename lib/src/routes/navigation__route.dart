// ignore_for_file: constant_identifier_names

import 'package:brokr/src/pages/Listing/car/address_in.page.dart' as CarAddress;
import 'package:brokr/src/pages/Listing/car/car.page.dart';
import 'package:brokr/src/pages/Listing/car/car_done.page.dart';
import 'package:brokr/src/pages/Listing/car/info_vim.page.dart';
import 'package:brokr/src/pages/Listing/car/manual_vin.page.dart';
import 'package:brokr/src/pages/Listing/car/scan_vin.page.dart';
import 'package:brokr/src/pages/Listing/yacht/address_in.page.dart';
import 'package:brokr/src/pages/Listing/yacht/confirm_address.page.dart';
import 'package:brokr/src/pages/Listing/yacht/yacht.page.dart';
import 'package:brokr/src/pages/profile/profile.page.dart';
import 'package:flutter/material.dart';
import 'package:brokr/src/pages/Listing/car/confirm_address.page.dart'
    as CarConfirm;

import 'package:brokr/src/pages/Listing/building/confirm_address.page.dart'
    as BuildingConfirm;
import 'package:brokr/src/pages/Listing/building/address_in.page.dart' as BuildingAddress;
import 'package:brokr/src/pages/Listing/building/building.page.dart';
import 'package:brokr/src/pages/Listing/building/building_done.page.dart';

class NavigationRoute {
  static const String SCANVIN = "/scan-vin";
  static const String INFOVIN = '/info/vin';
  static const String CARDONE = '/car-done/';
  static const String MANUALVIN = "/manual-vin";
  static const String LISTINGCAR = "/listing/car";
  static const String LISTINGYACHT = "/listing/yacht";
  static const String LISTINGINTRO = '/listing-intro';
  static const String LISTINGSELECT = '/listing-select';
  static const String LISTINGCARADDRESS = "/listing/car/address";
  static const String LISTINYACHTADDRESS = "/listing/yacht/address";
  static const String LISTINGCARCONFIRMADDRESS = "/listing/car/confirm-address";
  static const String LISTINYACHTCONFIRMADDRESS = "/listing/yacht/confirm-address";

  static const String LISTINGBUILDING = "/listing/building";
  static const String BUILDINGDONE = '/building-done/';
  static const String LISTINGBUILDINGADDRESS = "/listing/building/address";
  static const String LISTINGBUILDINGCONFIRMADDRESS = "/listing/building/confirm-address";

  Map<String, Widget> get pages => _pages;

  final Map<String, Widget> _pages = {
    LISTINGCAR: CarPage(),
    CARDONE: CarDonePage(),
    INFOVIN: InfoVIMPage(),
    SCANVIN: ScanVinPage(),
    LISTINGYACHT: YachtPage(),
    MANUALVIN: ManualVinPage(),
    LISTINGSELECT: ProfilePage(),
    LISTINYACHTADDRESS: AddressInPage(),
    LISTINGCARADDRESS: CarAddress.AddressInPage(),
    LISTINYACHTCONFIRMADDRESS: ConfirmAddressPage(),
    LISTINGCARCONFIRMADDRESS: CarConfirm.ConfirmAddressPage(),

    LISTINGBUILDING:BuildingPage(),
    BUILDINGDONE: BuildingDonePage(),
    LISTINGBUILDINGADDRESS: BuildingAddress.AddressInPage(),
    LISTINGBUILDINGCONFIRMADDRESS: BuildingConfirm.ConfirmAddressPage(),
  };
}
