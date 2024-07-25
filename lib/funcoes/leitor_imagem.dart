import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class QRImageScannerService {
  Future<String> scanQRFromImage(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);

    final BarcodeScanner barcodeScanner = BarcodeScanner();

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
