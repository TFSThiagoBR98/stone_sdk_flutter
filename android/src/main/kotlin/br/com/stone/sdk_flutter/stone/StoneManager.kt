package br.com.stone.sdk_flutter.stone

import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import stone.application.StoneStart
import stone.user.UserModel
import stone.utils.Stone

/**
 * Based on https://github.com/EightSystems/react-native-stone-pos
 * Commit: 5108c3afb0a9095fff54c4e4248002eff49862b6
 */
class StoneManager(private val context: Context, private val activity: Activity, binaryMessenger: BinaryMessenger): MethodChannel.MethodCallHandler {
    private var channel: MethodChannel = MethodChannel(binaryMessenger, CHANNEL)

    init {
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "isRunningInPOS" -> {
                try {
                    result.success(StoneManager.isRunningInPOS(context))
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace);
                }
            }
            "isSDKInitialized" -> {
                try {
                    result.success(StoneManager.isSDKInitialized())
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace);
                }
            }
            "initSdk" -> {
                try {
                    initSdk(call.argument<String>("appName")!!, result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace);
                }
            }
            else -> result.notImplemented()
        }
    }

    private fun initSdk(appName: String, result: MethodChannel.Result) {
        currentUserList = StoneStart.init(context)
        Stone.setAppName(appName)
    }

    companion object {
        private const val PACKAGE_NAME = "br.com.stone.posandroid.acquirerapp"
        private const val CHANNEL = "br.com.stone/flutter_sdk/stone_manager"

        var currentUserList: List<UserModel>? = null

        fun isRunningInPOS(context: Context): Boolean {
            return try {
                val packageManager: PackageManager = context.packageManager

                packageManager.getPackageInfo(
                    PACKAGE_NAME, 0
                )

                true
            } catch (e: PackageManager.NameNotFoundException) {
                false
            }
        }

        fun isSDKInitialized(): Boolean {
            return Stone.isInitialized()
        }
    }
}