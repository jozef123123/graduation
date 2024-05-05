import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:graduation/layout/cubit/state.dart';
import 'package:graduation/shared/models/artifact_model/artifact_model.dart';

import '../../layout/cubit/cubit.dart';
import '../home_detailes/home_detailes.dart'; // Update the import path according to your project structure

class ScanScreen extends StatefulWidget {
  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Center(
          child: InkWell(
            onTap: () => _scanQRCode(context),
            child: Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amber
              ),
              child: Text(
                "Start Scan",
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _scanQRCode(BuildContext context) async {
    String? qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);

    if (qrCode != '-1' && qrCode != null) {
      print('The QR code = $qrCode');

      var cubit = AppCubit.get(context);
      try {
        Artifact_Model artifact = cubit.artifacts.firstWhere(
                (artifact) => artifact.id == qrCode,
            orElse: () => throw Exception('Artifact not found')  // Throwing an exception if not found
        );

        // If the artifact is found and no exception was thrown, navigate to the details screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeDetailes_Screen(artifact_model: artifact),
          ),
        );
      } catch (e) {
        if (e is Exception && e.toString() == 'Exception: Artifact not found') {
          // Handle the specific case where the artifact is not found
          _showNoArtifactFoundDialog(context);
        } else {
          // Handle other types of exceptions that might be thrown
          _showGeneralErrorDialog(context, e.toString());
        }
      }
    }
  }

  void _showNoArtifactFoundDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Artifact Not Found"),
        content: Text("The scanned QR code does not correspond to any known artifact."),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  void _showGeneralErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text("An error occurred: $errorMessage"),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

}
