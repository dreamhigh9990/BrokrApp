import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeUtils {

  static String interRegular = "Inter-Regular";

  static Color colorTripsGrey = const Color(0xFF676A6F);
  static Color colorPurple = const Color(0xFF6366F1);
  static Color colorPink = const Color(0xFFFF3A7E);
  static Color colorBlue = const Color(0xFF1877F2);
  static Color colorSwitch = const Color(0xFFD3D3D3);

  static Color colorbottomBar = const Color(0xFF9E9E9E);

  static Color titleFilter = const Color(0xFF505050);
  static Color colorGrey = const Color(0xFFB6B8BD);

  static Color primaryColor = const Color(0xFF508FF7);
  static Color secondaryColor = const Color(0xFF8B2FE0);
  static Color tertiaryColor = const Color(0xFF696A69);
  static Color greyColor = const Color(0xFF61646B);
  static Color bgButtonAccount = const Color(0xFFF8F8F8);
  static Color dropDownButtonColor = const Color(0xFFEFEFF0);
  static Color inputBorderColor = Colors.black.withOpacity(0.4);
  static Color inputFocusedColor = Colors.black;



 static Divider dividerGrey =  Divider(
                  color: Colors.grey,
                  endIndent: 0.0,
                  height: 0.0,
                );




  static InputDecoration inputDecoration(
      {required String labelText,
      required EdgeInsets? isPadding,
      FontWeight? fontWeight = FontWeight.bold}) {
    return InputDecoration(
        labelText: labelText,
        contentPadding: isPadding,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(
            color: Colors.black.withOpacity(.5),
            width: 1.5,
          ),
        ),
        labelStyle: TextStyle(
            fontWeight: fontWeight,
            color: const Color(0xFF61646B),
            fontFamily: ThemeUtils.interRegular));
  }

  static EdgeInsets paddingLeftAndRight =
      const EdgeInsets.only(left: 20.0, right: 20.0);

  static EdgeInsets paddingScaffoldx025 = EdgeInsets.only(
      left: Get.context!.width * 0.025, right: Get.context!.width * 0.025);
  static EdgeInsets paddingScaffoldx05 = EdgeInsets.only(
      left: Get.context!.width * 0.05, right: Get.context!.width * 0.05);

  static EdgeInsets paddingScaffoldx035 = EdgeInsets.only(
      left: Get.context!.width * 0.035, right: Get.context!.width * 0.035);

  static EdgeInsets padding15 = const EdgeInsets.only(left: 15, right: 15);

  static EdgeInsets paddingScaffoldxTop10 = const EdgeInsets.only(top: 10);
  static EdgeInsets paddingScaffoldxTop20 = const EdgeInsets.only(top: 20);

  static EdgeInsets paddingScaffoldx095 = EdgeInsets.only(
      left: Get.context!.width * 0.0025,
      right: Get.context!.width * 0.0025,
      top: Get.context!.height * 0.01);

  static double borderShadowAppBar = Get.context!.width * 0.015;

  final String styleMap = '''[
    {
        "featureType": "administrative",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#686868"
            }
        ]
    },
    {
        "featureType": "landscape",
        "elementType": "all",
        "stylers": [
            {
                "color": "#f2f2f2"
            }
        ]
    },
    {
        "featureType": "poi",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "all",
        "stylers": [
            {
                "saturation": -100
            },
            {
                "lightness": 45
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "lightness": "-22"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "saturation": "11"
            },
            {
                "lightness": "-51"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.text",
        "stylers": [
            {
                "saturation": "3"
            },
            {
                "lightness": "-56"
            },
            {
                "weight": "2.20"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "lightness": "-52"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "weight": "6.13"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "labels.icon",
        "stylers": [
            {
                "lightness": "-10"
            },
            {
                "gamma": "0.94"
            },
            {
                "weight": "1.24"
            },
            {
                "saturation": "-100"
            },
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": "-16"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "saturation": "-41"
            },
            {
                "lightness": "-41"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "weight": "5.46"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "labels.icon",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "weight": "0.72"
            },
            {
                "lightness": "-16"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "lightness": "-37"
            }
        ]
    },
    {
        "featureType": "transit",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "off"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#b7e4f4"
            },
            {
                "visibility": "on"
            }
        ]
    }
]''';
}
