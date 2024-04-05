import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:InkWell(
onTap: () {
  _scanQRCode(context);

},
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
              color: Colors.amber
          ),
          child: Text(
            "Start Scan",
            style: TextStyle(fontSize: 24.0,color: Colors.white),
          ),
        ),
      ),
    );
  }
  Future<void> _scanQRCode(BuildContext context) async {
    String? qrCode = await FlutterBarcodeScanner.scanBarcode(
      '#ff6666',
      'Cancel',

      true,
      ScanMode.QR,
    );


  }
}
