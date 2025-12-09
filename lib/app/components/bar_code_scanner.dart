// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class BarcodeScannerWidget extends StatelessWidget {
//   const BarcodeScannerWidget({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Scan Barcode")),
//       body: MobileScanner(
//         scanWindow: Rect.fromCenter(
//           center: MediaQuery.of(context).size.center(Offset.zero),
//           width: 250,
//           height: 100,
//         ),
//         onDetect: (BarcodeCapture capture) {
//           final List<Barcode> barcodes = capture.barcodes;
//           for (final barcode in barcodes) {
//             if (barcode.rawValue != null) {
//               context.pop(barcode.rawValue);
//               break;
//             }
//           }
//         },
//       ),
//     );
//   }
// }
