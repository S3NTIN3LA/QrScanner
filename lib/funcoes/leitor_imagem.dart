import 'package:google_ml_kit/google_ml_kit.dart';

class QRImageScannerService {
  Future<String> scanQRFromImage(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    // ignore: deprecated_member_use
    final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

    try {
      final List<Barcode> barcodes =
          await barcodeScanner.processImage(inputImage);
      if (barcodes.isNotEmpty) {
        return barcodes.map((barcode) => barcode.displayValue).join(', ');
      } else {
        return 'QrCode não encontrado.';
      }
    } catch (e) {
      return 'Erro: ${e.toString()}';
    } finally {
      barcodeScanner.close();
    }
  }
}
