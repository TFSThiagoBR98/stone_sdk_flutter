import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'models/payment_request.dart';
import 'models/payment_response.dart';
import 'stone_sdk_flutter_platform_interface.dart';

/// An implementation of [StoneSdkPlatform] that uses method channels.
class MethodChannelStoneSdk extends StoneSdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('br.com.stone/flutter_sdk');

  @override
  Future<void> initSdk({required String appName}) async {
    methodChannel.setMethodCallHandler((MethodCall call) async {});

    await methodChannel.invokeMethod<void>('initSdk', <String, dynamic>{'appName': appName});
  }

  @override
  Future<void> activateCode({required String stoneCode}) async {
    await methodChannel.invokeMethod<void>('activateCode', <String, dynamic>{'stoneCode': stoneCode});
  }

  @override
  Future<void> deactivateCode({required String stoneCode}) async {
    await methodChannel.invokeMethod<void>('deactivateCode', <String, dynamic>{'stoneCode': stoneCode});
  }

  @override
  Future<bool?> isRunningInPOS() async {
    return await methodChannel.invokeMethod<bool?>('isRunningInPOS');
  }

  @override
  Future<bool?> isSDKInitialized() async {
    return await methodChannel.invokeMethod<bool?>('isSDKInitialized');
  }

  @override
  Future<bool?> printImageInPOSPrinter({required Uint8List posImage}) async {
    return await methodChannel.invokeMethod<bool?>('printImageInPOSPrinter', <String, dynamic>{'posImage': posImage});
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<PaymentResponse?> sendPaymentIntent({required PaymentRequest request}) async {
    throw UnimplementedError('sendPaymentIntent() has not been implemented.');
  }
}
