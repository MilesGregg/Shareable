import 'package:Shareable/qr/QrScannerOverlayShape.dart';
import 'package:Shareable/qr/twitter_qr_scanner.dart';
import 'package:Shareable/screens/home/checkboxpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_scan/barcode_scan.dart';
//import 'package:twitter_qr_scanner/twitter_qr_scanner.dart';
//import 'package:twitter_qr_scanner/QrScannerOverlayShape.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

/*
child: Icon(Icons.qr_code_scanner_rounded),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => QRExample()));
            }, 
*/

class _HomePage extends State<HomePage> {
  String result = "Scan";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  Future getCurrentUser() async {
    return await FirebaseAuth.instance.currentUser();
  }

  Future<String> getCurrentUID() async {
    return (await FirebaseAuth.instance.currentUser()).uid;
  }

  void getUserName() async {
    FirebaseUser mCurrentUser = await getCurrentUser();
    print(mCurrentUser.displayName.toString());
    print("hi");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Something"), 
      ),
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "Button 1",
              onPressed: () {
                getUserName();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => CheckBoxPage())); // was qr example
              },
              child: Icon(Icons.qr_code_scanner_rounded),
            ),
            FloatingActionButton(
              heroTag: "Button 2",
              child: Icon(Icons.camera_alt),
              onPressed: _scanQR,
            )
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class QRExample extends StatefulWidget {
  QRExample({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _QRExampleState createState() => _QRExampleState();
}

class _QRExampleState extends State<QRExample> {
  GlobalKey qrKey = GlobalKey();
  QRViewController controller;
  String qrText = "Spencer is really fat and play a lot of call of duty everyday. aklfjlakaklfjlakaklfjlakaklfjlakaklfjlakaklfjlakaklfjlakaklfjlakaklfjlakaklfjlakaklfjlakaklfjlakaklfjlak IHAVENOBUTTHOLE@GMAIL.com";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        /*appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white
          )
        ),*/
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          child: Icon(Icons.cancel_sharp),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Center(
          child: Container(
              alignment: Alignment.center,
              decoration: ShapeDecoration(
              shape: QrScannerOverlayShape(
                borderRadius: 16,
                borderColor: Colors.white,
                borderLength: 120,
                borderWidth: 10,
                cutOutSize: 250),
              ),
              child: Container(
              width: 240,
              height: 240,
              padding: EdgeInsets.all(21),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.blue,
              ),
              child: QrImage(
                data: qrText,
                version: QrVersions.auto,
                foregroundColor: Colors.white,
                gapless: true,
              ),
            ),
          ),
        ),
    );
    
        /*body: QRView(
          key: qrKey,
          overlay: QrScannerOverlayShape(
              borderRadius: 16,
              borderColor: Colors.white,
              borderLength: 120,
              borderWidth: 10,
              cutOutSize: 250),
          onQRViewCreated: _onQRViewCreate,
          data: qrText,
        )
        );*/
    
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreate(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        print("QRCode: $scanData");
      });
    });
  }
}