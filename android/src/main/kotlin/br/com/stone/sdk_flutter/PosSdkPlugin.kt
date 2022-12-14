package br.com.stone.sdk_flutter

import android.app.Activity
import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.ImageDecoder
import androidx.annotation.NonNull
import br.com.stone.sdk_flutter.helpers.StoneTransactionHelpers
import br.com.stone.posandroid.providers.PosPrintProvider
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import stone.application.StoneStart
import stone.application.interfaces.StoneActionCallback
import stone.application.enums.Action
import stone.application.interfaces.StoneCallbackInterface
import stone.providers.ActiveApplicationProvider
import stone.user.UserModel
import stone.utils.Stone
import kotlin.math.ceil

/**
 * Flutter Stone SDK Plugin for Flutter
 *
 * Based on some code from https://github.com/EightSystems/react-native-stone-pos
 * Commit: 5108c3afb0a9095fff54c4e4248002eff49862b6
 */
class PosSdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    var currentUserList: List<UserModel>? = null
    private var activity: Activity? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext

        channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getPlatformVersion" -> {
                result.success("Android ${android.os.Build.VERSION.RELEASE}")
            }
            "isRunningInPOS" -> {
                try {
                    isRunningInPOS(result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace);
                }
            }
            "isSDKInitialized" -> {
                try {
                    isSDKInitialized(result)
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
            "activateCode" -> {
                try {
                    activateCode(call.argument<String>("stoneCode")!!, result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace);
                }
            }
            "deactivateCode" -> {
                try {
                    deactivateCode(call.argument<String>("stoneCode")!!, result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace);
                }
            }
            "printImageInPOSPrinter" -> {
                try {
                    printImageInPOSPrinter(call.argument<ByteArray>("posImage")!!, result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace);
                }
            }
            else -> result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun isRunningInPOS(result: Result) {
        result.success(StoneTransactionHelpers.isRunningInPOS(context))
    }

    private fun isSDKInitialized(result: Result) {
        result.success(StoneTransactionHelpers.isSDKInitialized())
    }

    private fun initSdk(appName: String, result: Result) {
        currentUserList = StoneStart.init(context)
        Stone.setAppName(appName)
    }

    private fun hasStoneCodeInList(stoneCode: String): Boolean {
        if (currentUserList?.findLast { it.stoneCode.equals(stoneCode) } != null) {
            return true
        }

        return false
    }

    private fun restartStone() {
        if (Stone.isInitialized()) {
            currentUserList = StoneStart.init(context)
        }
    }

    private fun activateCode(stoneCode: String, result: Result) {
        if (hasStoneCodeInList(stoneCode)) {
            result.success(true)
            return
        }

        val activeApplicationProvider = ActiveApplicationProvider(activity!!)
        activeApplicationProvider.dialogTitle = "Ativação"
        activeApplicationProvider.dialogMessage = "Ativando seu Código"
        activeApplicationProvider.useDefaultUI(true)

        activeApplicationProvider.connectionCallback = object : StoneCallbackInterface {
            override fun onSuccess() {
                restartStone()
                result.success(true)
            }

            override fun onError() {
                result.error("201", "Stone Error: ActiveApplicationProvider", activeApplicationProvider.listOfErrors.toString())
            }
        }

        activeApplicationProvider.activate(stoneCode)
    }

    private fun deactivateCode(stoneCode: String, result: Result) {
        if (!hasStoneCodeInList(stoneCode)) {
            result.success(true)
            return
        }

        val activeApplicationProvider = ActiveApplicationProvider(activity!!)
        activeApplicationProvider.dialogTitle = "Desativação"
        activeApplicationProvider.dialogMessage = "Desativando seu Código"
        activeApplicationProvider.useDefaultUI(true)

        activeApplicationProvider.connectionCallback = object : StoneCallbackInterface {
            override fun onSuccess() {
                restartStone()
                result.success(true)
            }

            override fun onError() {
                result.error("201", "Stone Error: ActiveApplicationProvider", activeApplicationProvider.listOfErrors.toString())
            }
        }

        activeApplicationProvider.deactivate(stoneCode)
    }

    private fun printImageInPOSPrinter(posImage: ByteArray, result: Result) {
        if (!StoneTransactionHelpers.isRunningInPOS(context)) {
            result.error("101", "You can only run this in a POS", null)
            return;
        }

        if (currentUserList.isNullOrEmpty()) {
            result.error("401", "You need to activate the terminal first", null)
            return;
        }

        val transactionProvider = PosPrintProvider(
                activity!!
        )

        val computedBitmap: Bitmap = BitmapFactory.decodeByteArray(posImage, 0, posImage.size)

        var currentY = 0
        var currentBlock = 1
        val blockCount = ceil(computedBitmap.height / 595.00)

        while (currentBlock <= blockCount) {
            val targetHeight = if (currentY + 595 > computedBitmap.height) {
                computedBitmap.height - currentY
            } else {
                595
            }

            transactionProvider.addBitmap(
                    Bitmap.createBitmap(computedBitmap, 0, currentY, computedBitmap.width, targetHeight)
            )

            currentY = if (currentY + 595 > computedBitmap.height) {
                computedBitmap.height - currentY
            } else {
                currentY + 595
            }

            currentBlock++
        }

        transactionProvider.useDefaultUI(true)
        transactionProvider.dialogMessage = "Imprimindo comprovante..."
        transactionProvider.dialogTitle = "Aguarde"

        transactionProvider.connectionCallback = object : StoneActionCallback {
            override fun onSuccess() {
                result.success(true)
            }

            override fun onError() {
                result.error("405", "Generic Error - Transaction Failed [onError from Provider] - Check adb log output", null)
            }

            override fun onStatusChanged(action: Action?) {
                channel.invokeMethod("posStatusChanged", action?.name)
            }
        }

        transactionProvider.execute()
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        activity = null
    }

    companion object {
        private const val TAG: String = "PosPlugin"
        private const val CHANNEL = "br.com.stone/flutter_sdk"
    }
}
