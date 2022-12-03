import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'models/payment_request.dart';
import 'models/payment_response.dart';
import 'stone_sdk_flutter_method_channel.dart';

abstract class StoneSdkPlatform extends PlatformInterface {
  /// Constructs a StoneSdkPlatform.
  StoneSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static StoneSdkPlatform _instance = MethodChannelStoneSdk();

  /// The default instance of [StoneSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelStoneSdk].
  static StoneSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StoneSdkPlatform] when
  /// they register themselves.
  static set instance(StoneSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Initializes this plugin.
  ///
  /// Call this once before any further interaction with the plugin.
  Future<void> initSdk({required String appName}) async {
    throw UnimplementedError('initSdk() has not been implemented.');
  }

  Future<void> activateCode({required String stoneCode}) async {
    throw UnimplementedError('activateCode() has not been implemented.');
  }

  Future<void> deactivateCode({required String stoneCode}) async {
    throw UnimplementedError('deactivateCode() has not been implemented.');
  }

  Future<bool?> isRunningInPOS() {
    throw UnimplementedError('isRunningInPOS() has not been implemented.');
  }

  Future<bool?> isSDKInitialized() {
    throw UnimplementedError('isSDKInitialized() has not been implemented.');
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool?> printHTMLInPOSPrinter({required String htmlContent}) {
    throw UnimplementedError(
        'printHTMLInPOSPrinter() has not been implemented.');
  }

  Future<bool?> printImageInPOSPrinter({required Uint8List posImage}) {
    throw UnimplementedError(
        'printImageInPOSPrinter() has not been implemented.');
  }

  Future<PaymentResponse?> sendPaymentIntent(
      {required PaymentRequest request}) {
    throw UnimplementedError('sendPaymentIntent() has not been implemented.');
  }
}
