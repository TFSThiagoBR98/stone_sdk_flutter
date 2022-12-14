import 'dart:typed_data';

import 'models/payment_request.dart';
import 'models/payment_response.dart';
import 'stone_sdk_flutter_platform_interface.dart';

class StoneSdk {
  Future<String?> getPlatformVersion() {
    return StoneSdkPlatform.instance.getPlatformVersion();
  }

  Future<void> initSdk({required String appName}) => StoneSdkPlatform.instance.initSdk(appName: appName);

  Future<void> activateCode({required String stoneCode}) => StoneSdkPlatform.instance.activateCode(stoneCode: stoneCode);

  Future<void> deactivateCode({required String stoneCode}) => StoneSdkPlatform.instance.deactivateCode(stoneCode: stoneCode);

  Future<bool?> isRunningInPOS() => StoneSdkPlatform.instance.isRunningInPOS();

  Future<bool?> isSDKInitialized() => StoneSdkPlatform.instance.isSDKInitialized();

  Future<bool?> printImageInPOSPrinter({required Uint8List posImage}) =>
      StoneSdkPlatform.instance.printImageInPOSPrinter(posImage: posImage);

  Future<PaymentResponse?> sendPaymentIntent({required PaymentRequest request}) =>
      StoneSdkPlatform.instance.sendPaymentIntent(request: request);
}
