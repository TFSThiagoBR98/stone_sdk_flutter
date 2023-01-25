import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class StoneManager extends PlatformInterface {
  /// Constructs a StoneSdkPlatform.
  StoneManager() : super(token: _token);

  static final Object _token = Object();

  static StoneManager _instance = StoneManager();

  /// The default instance of [StoneSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelStoneSdk].
  static StoneManager get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StoneSdkPlatform] when
  /// they register themselves.
  static set instance(StoneManager instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  @visibleForTesting
  final methodChannel = const MethodChannel('br.com.stone/flutter_sdk/stone_manager');

  Future<void> initSdk({required String appName}) async {
    methodChannel.setMethodCallHandler((MethodCall call) async {});

    await methodChannel.invokeMethod<void>('initSdk', <String, dynamic>{'appName': appName});
  }

  Future<bool?> isRunningInPOS() async {
    return await methodChannel.invokeMethod<bool?>('isRunningInPOS');
  }

  Future<bool?> isSDKInitialized() async {
    return await methodChannel.invokeMethod<bool?>('isSDKInitialized');
  }
}
