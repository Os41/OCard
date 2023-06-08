import 'dart:typed_data';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui' as ui;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';
import '../../../Models/user.dart';
import '../../../constants.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../Widgets/MaterialButton.dart';
import '../../../Widgets/TextViwe.dart';

class MyQrCode extends StatefulWidget {
  final UserData? userData;
  const MyQrCode({Key? key, this.userData}) : super(key: key);

  @override
  State<MyQrCode> createState() => _MyQrCodeState();
}

class _MyQrCodeState extends State<MyQrCode> {
  ScreenshotController screenshotController = ScreenshotController();
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double screenHeight = size.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom -
        90;

    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    width: double.infinity,
                    height: screenHeight * 0.12,
                    decoration: const BoxDecoration(
                        color: Color(secondaryColor),
                        borderRadius: BorderRadius.all(Radius.circular(35))),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      height: 70,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: double.infinity,
                              alignment: Alignment.center,
                              child: const Text(
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  myQrCode),
                            ),
                            IconButton(
                                onPressed: () => {Navigator.pop(context)},
                                iconSize: 30,
                                icon: const Icon(Icons.arrow_forward_rounded,
                                    color: Colors.white)),
                          ]),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 150,
                  height: 150.0,
                  child: Image(
                    image: AssetImage(widget.userData!.image),
                    width: 120,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 60,
                  child: TextApp(
                    lable: widget.userData!.fullName,
                  ),
                ),
                Screenshot(
                  controller: screenshotController,
                  child: Center(
                    child: QrImageView(
                      data: widget.userData!.email,
                      version: QrVersions.auto,
                      size: 250,
                      gapless: false,
                      errorCorrectionLevel: QrErrorCorrectLevel.Q,
                      embeddedImage: const AssetImage('assets/images/logo/logo-big.png'),
                      embeddedImageStyle: const QrEmbeddedImageStyle(
                        size: Size(80, 80),
                      ),
                    ),
                  ),
                ),
                //
                Container(
                  padding: const EdgeInsets.only(top: 20),
                  child: ButtonApp(
                    label: 'Save To camera roll',
                    onSaveButtonPressed: () {
                      _saveScreen;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    final info = statuses[Permission.storage].toString();
    _toastInfo(info);
  }

  _saveScreen() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      _toastInfo(result.toString());
    }
  }

  _toastInfo(String info) {
    Fluttertoast.showToast(msg: info, toastLength: Toast.LENGTH_LONG);
  }
}
