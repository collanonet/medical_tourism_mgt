import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../core_ui.dart';
import '../resources/images.dart';

class QrCode {
  QrCode({
    required this.data,
    this.version = QrVersions.auto,
    this.embeddedImage,
  });

  final String data;
  final int version;
  final ImageProvider? embeddedImage;

  Future<QrPainter> painter() async {
    final image = embeddedImage;

    return QrPainter(
      data: data,
      version: version,
      embeddedImage: image != null ? await getImage(image) : null,
    );
  }

  Widget image() {
    return QrImageView(
      data: data,
      version: version,
      embeddedImage: embeddedImage,
    );
  }

  Future<ui.Image> getImage(ImageProvider provider) async {
    final completer = Completer<ImageInfo>();
    provider.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener((info, _) {
        completer.complete(info);
      }),
    );

    final imageInfo = await completer.future;
    return imageInfo.image;
  }
}

enum KHQRCurrency { dollar, riel }

class KHQRController extends ValueNotifier<QrCode?> {
  KHQRController() : super(null);

  Future<File?> takeScreenshot(
    File file, {
    double size = 192.0,
    ui.ImageByteFormat format = ui.ImageByteFormat.png,
  }) async {
    final painter = await value?.painter();
    final image = await painter?.toImageData(size, format: format);

    if (image == null) return null;

    final bytes = image.buffer.asUint8List(
      image.offsetInBytes,
      image.lengthInBytes,
    );
    return file.writeAsBytes(bytes);
  }
}

class KHQR extends StatelessWidget {
  static const khqrColor = Color(0xFFE21A1A);

  const KHQR({
    Key? key,
    required this.accountName,
    required this.amount,
    this.controller,
    required this.currency,
    required this.data,
  }) : super(key: key);

  final String accountName;
  final String amount;
  final KHQRController? controller;
  final KHQRCurrency currency;
  final String data;

  @override
  Widget build(BuildContext context) {
    final qrCode = QrCode(data: data, embeddedImage: sign(currency));
    controller?.value = qrCode;

    return Card(
      elevation: 12.0,
      shadowColor: const Color.fromRGBO(0, 0, 0, 0.1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 54.0,
                decoration: const BoxDecoration(
                  color: khqrColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16.0),
                  ),
                ),
              ),
              Image.asset(
                Images.khqrLogo,
                fit: BoxFit.contain,
                package: 'core_ui',
              ),
            ],
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: ClipPath(
                  clipper: QRClipper(),
                  child: Container(
                    color: khqrColor,
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      accountName,
                      style: const TextStyle(fontSize: 13.0),
                    ),
                    const SizedBox(height: 4.0),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: amount,
                            style: context.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const WidgetSpan(
                            child: SizedBox(width: 4.0),
                          ),
                          TextSpan(
                            text: currencyCode(currency),
                            style: context.textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const DottedLine(
            dashColor: Colors.black12,
            dashGapLength: 5.0,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: qrCode.image(),
          )
        ],
      ),
    );
  }

  ImageProvider sign(KHQRCurrency currency) {
    switch (currency) {
      case KHQRCurrency.dollar:
        return const AssetImage(Images.khqrDollar, package: 'core_ui');
      default:
        throw Exception('$currency is not supported');
    }
  }

  String currencyCode(KHQRCurrency currency) {
    switch (currency) {
      case KHQRCurrency.dollar:
        return 'USD';
      case KHQRCurrency.riel:
        return 'KHR';
      default:
        throw Exception('$currency is not supported');
    }
  }
}

class QRClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
