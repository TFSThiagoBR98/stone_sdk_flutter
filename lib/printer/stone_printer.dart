import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class StonePrinter extends PlatformInterface {
  /// Constructs a StoneSdkPlatform.
  StonePrinter() : super(token: _token);

  static final Object _token = Object();

  static StonePrinter _instance = StonePrinter();

  /// The default instance of [StoneSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelStoneSdk].
  static StonePrinter get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StoneSdkPlatform] when
  /// they register themselves.
  static set instance(StonePrinter instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  @visibleForTesting
  final methodChannel = const MethodChannel('br.com.stone/flutter_sdk/printer/stone');

  Future<void> startPrinterService() async {
    await methodChannel.invokeMethod<void>('startPrinterService');
  }

  Future<void> printBitmap({required Uint8List image}) async {
    await methodChannel.invokeMethod<void>('printBitmap', <String, dynamic>{'image': image});
  }

  Future<void> printWrapPaper({required int lines}) async {
    await methodChannel.invokeMethod<void>('printWrapPaper', <String, dynamic>{'lines': lines});
  }

  Future<void> printHtml({required String htmlContent}) async {
    await methodChannel.invokeMethod<void>('printHtml', <String, dynamic>{'htmlContent': htmlContent});
  }

  Future<void> initPrinter() async {
    await methodChannel.invokeMethod<void>('initPrinter');
  }

  Future<bool> isAvaliable() async {
    return await methodChannel.invokeMethod<bool>('isAvaliable') ?? false;
  }
}
