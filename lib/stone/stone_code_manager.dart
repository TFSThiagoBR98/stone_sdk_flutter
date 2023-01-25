import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class StoneCodeManager extends PlatformInterface {
  /// Constructs a StoneSdkPlatform.
  StoneCodeManager() : super(token: _token);

  static final Object _token = Object();

  static StoneCodeManager _instance = StoneCodeManager();

  /// The default instance of [StoneSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelStoneSdk].
  static StoneCodeManager get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [StoneSdkPlatform] when
  /// they register themselves.
  static set instance(StoneCodeManager instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  @visibleForTesting
  final methodChannel = const MethodChannel('br.com.stone/flutter_sdk/stone_code_manager');

  Future<bool> activateCode({required String stoneCode}) async {
    return await methodChannel.invokeMethod<bool>('activateCode', <String, dynamic>{'stoneCode': stoneCode}) ?? false;
  }

  Future<bool> deactivateCode({required String stoneCode}) async {
    return await methodChannel.invokeMethod<bool>('deactivateCode', <String, dynamic>{'stoneCode': stoneCode}) ?? false;
  }

  Future<bool> hasStoneCodeInList({required String stoneCode}) async {
    return await methodChannel.invokeMethod<bool>('hasStoneCodeInList', <String, dynamic>{'stoneCode': stoneCode}) ?? false;
  }

  Future<void> restartStone() async {
    await methodChannel.invokeMethod<bool>('restartStone');
  }
}
