import 'dart:async';
import 'dart:io';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:brokr/src/components/custom_widget_page/statefull_custom.dart';
import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
import 'package:brokr/src/routes/navigation__route.dart';
// import 'package:brokr/src/pages/Listing/ListingIntro.page.dart';
// import 'package:brokr/src/routes/navigation__route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_vision_2/flutter_mobile_vision_2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:permission_handler/permission_handler.dart';

class ScanVinPage extends StateFullCustom {
  static String name = '/scan-vin';
  ScanVinPage({super.key});

  @override
  State<ScanVinPage> createState() => _ScanVinPageState();
}

class _ScanVinPageState extends State<ScanVinPage> {
  CameraController? _cameraController;
  String barcode = "";

  bool _isPermissionGranted = false;
  final textRecognizer = TextRecognizer();

  late final Future<void> _future;
  final int _cameraOcr = FlutterMobileVision.CAMERA_BACK;
  final bool _autoFocusOcr = true;
  final bool _torchOcr = true;
  final bool _multipleOcr = true;
  final bool _waitTapOcr = true;
  final bool _showTextOcr = true;
  Size? _previewOcr;
  bool canScan = true;

  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _future = _requestCameraPermission();
    FlutterMobileVision.start().then((previewSizes) => setState(() {
          _previewOcr = previewSizes[_cameraOcr]![0];
        }));

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (canScan) {
        _scanImage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController?.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        return Stack(
          children: [
            // Show the camera feed behind everything
            if (_isPermissionGranted)
              FutureBuilder<List<CameraDescription>>(
                future: availableCameras(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _initCameraController(snapshot.data!);

                    return Center(
                      child: CameraPreview(
                        _cameraController!,
                        child: const Center(
                          child: Text("asas"),
                        ),
                      ),
                    );
                  } else {
                    return const LinearProgressIndicator();
                  }
                },
              ),
            Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: 19,
                  ),
                  color: widget.colorsTheme.primary,
                  onPressed: () => Get.back(),
                ),
              ),
              // Set the background to transparent so you can see the camera preview
              backgroundColor: _isPermissionGranted ? Colors.transparent : null,
              body: _isPermissionGranted
                  ? Column(
                      children: [
                        Expanded(
                          child: Container(),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: widget.responsive.wp(4),
                            vertical: widget.responsive.hp(2),
                          ),
                          child: GradientButton(
                            text: "Type VIN instead",
                            onPressed: () =>
                                Get.offNamed(NavigationRoute.MANUALVIN),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Container(
                        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                        child: const Text(
                          'Camera permission denied',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.transparent,
    //     elevation: 0,
    //     leading: IconButton(
    //       icon: const FaIcon(
    //         FontAwesomeIcons.chevronLeft,
    //         size: 19,
    //       ),
    //       color: widget.colorsTheme.primary,
    //       onPressed: () => Get.back(),
    //     ),
    //   ),
    //   body: Column(
    //     children: [
    //       const Expanded(
    //         child: Center(
    //           child: Text("data"),
    //         ),
    //       ),
    //       Padding(
    //         padding: EdgeInsets.symmetric(
    //             horizontal: widget.responsive.wp(4),
    //             vertical: widget.responsive.hp(2)),
    //         child: GradientButton(
    //           text: "Type VIN instead",
    //           onPressed: () => Get.offNamed(NavigationRoute.MANUALVIN),
    //         ),
    //       ),
    //     ],
    //   ),
    //   backgroundColor: Colors.grey.shade800,
    // );
  }

  Future scan() async {
    Size scanpreviewOcr = _previewOcr ?? FlutterMobileVision.PREVIEW;
    //...
    List<OcrText> texts = [];
    try {
      texts = await FlutterMobileVision.read(
        flash: false,
        autoFocus: _autoFocusOcr,
        multiple: _multipleOcr,
        waitTap: _waitTapOcr,
        //OPTIONAL: close camera after tap, even if there are no detection.
        //Camera would usually stay on, until there is a valid detection
        forceCloseCameraOnTap: true,
        showText: _showTextOcr,
        preview: Size(_previewOcr!.width, _previewOcr!.height),
        scanArea: Size(scanpreviewOcr.width, scanpreviewOcr.height),
        camera: _cameraOcr,
        fps: 2.0,
      );
      print(texts);
    } on Exception {
      texts.add(new OcrText('Failed to recognize text.'));
    }
  }

  Future<void> getVinInfo(String vinText) {
    return Future.error("error");
//     fetchVinInfo(http.Client(), vinText).then((VinInfo vinInfo) {
//       List<VinResults> vinResults = vinInfo.results;

// //                   for(var vinResult in vinResults  ){
// //                    this.makeTitle = vinResult.make;
// //                    this.modelTitle = vinResult.model;
// //                   }
//       //example vin : 3LN6L2JKXFR605807
//       print("vin results length is ${vinResults.length}");
//       setState(() {
//         if (vinResults.length > 0) {
//           VinResults result = vinResults[0];
//           this.makeTitle = result.make;
//           this.modelTitle = result.model;
//           print("this make is $makeTitle. this model is $modelTitle");
//           this.modelStrings.add(this.modelTitle);
//         }
//       });
//     });
//     return null;
  }

  Future<void> _scanImage() async {
    if (_cameraController == null) return;
    try {
      canScan = false;
      final pictureFile = await _cameraController!.takePicture();

      final file = File(pictureFile.path);

      final inputImage = InputImage.fromFile(file);
      final recognizedText = await textRecognizer.processImage(inputImage);
      int index = 0;
      recognizedText.blocks.forEach((element) {
        bool mobileValid =
            RegExp(r'^[14352JWSKY]{1}[A-Z]{1}[A-Z0-9]{1}$').hasMatch(element.text);
        print("valido =>>>>>>>>>>> $mobileValid");
        index += 1;
      });
      canScan = true;
    } catch (e) {
      canScan = true;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred when scanning text'),
        ),
      );
    }
  }

  Future<void> _requestCameraPermission() async {
    final status = await Permission.camera.request();
    _isPermissionGranted = status == PermissionStatus.granted;
  }

  void _startCamera() {
    if (_cameraController != null) {
      _cameraSelected(_cameraController!.description);
    }
  }

  void _stopCamera() {
    if (_cameraController != null) {
      _cameraController?.dispose();
    }
  }

  void _initCameraController(List<CameraDescription> cameras) {
    if (_cameraController != null) {
      return;
    }

    // Select the first rear camera.
    CameraDescription? camera;
    for (var i = 0; i < cameras.length; i++) {
      final CameraDescription current = cameras[i];
      if (current.lensDirection == CameraLensDirection.back) {
        camera = current;
        break;
      }
    }

    if (camera != null) {
      _cameraSelected(camera);
    }
  }

  Future<void> _cameraSelected(CameraDescription camera) async {
    _cameraController = CameraController(
      camera,
      ResolutionPreset.max,
      enableAudio: false,
    );

    await _cameraController!.initialize();

    if (!mounted) {
      return;
    }
    setState(() {});
  }
}
