package br.com.stone.sdk_flutter.stone

import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import br.com.stone.sdk_flutter.PosSdkPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import stone.application.StoneStart
import stone.application.interfaces.StoneCallbackInterface
import stone.providers.ActiveApplicationProvider
import stone.user.UserModel
import stone.utils.Stone

class StoneCodeManager(private val context: Context, private val activity: Activity, binaryMessenger: BinaryMessenger): MethodChannel.MethodCallHandler {
    private var channel: MethodChannel = MethodChannel(binaryMessenger, CHANNEL)

    init {
        channel.setMethodCallHandler(this)
    }

    private fun hasStoneCodeInList(stoneCode: String): Boolean {
        if (StoneManager.currentUserList?.findLast { it.stoneCode.equals(stoneCode) } != null) {
            return true
        }

        return false
    }

    private fun restartStone() {
        if (Stone.isInitialized()) {
            StoneManager.currentUserList = StoneStart.init(context)
        }
    }

    private fun activateCode(stoneCode: String, result: MethodChannel.Result) {
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

    private fun deactivateCode(stoneCode: String, result: MethodChannel.Result) {
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

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
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
            "restartStone" -> {
                try {
                    result.success(restartStone())
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace);
                }
            }
            "hasStoneCodeInList" -> {
                try {
                    result.success(hasStoneCodeInList(call.argument<String>("stoneCode")!!))
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace);
                }
            }
            else -> result.notImplemented()
        }
    }

    companion object {
        private const val CHANNEL = "br.com.stone/flutter_sdk/stone_code_manager"
    }
}