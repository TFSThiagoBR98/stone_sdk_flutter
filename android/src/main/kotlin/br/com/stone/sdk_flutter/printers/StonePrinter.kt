package br.com.stone.sdk_flutter.printers

import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import br.com.stone.posandroid.providers.PosPrintProvider
import br.com.stone.sdk_flutter.getBitmapFromHtml
import br.com.stone.sdk_flutter.stone.StoneManager
import br.com.stone.sdk_flutter.interfaces.PrinterService
import br.com.stone.sdk_flutter.processBitmapForPrint
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import stone.application.enums.Action
import stone.application.interfaces.StoneActionCallback
import kotlin.math.ceil

internal class StonePrinter(private val context: Context, private val activity: Activity, binaryMessenger: BinaryMessenger): PrinterService {
    private var channel: MethodChannel = MethodChannel(binaryMessenger, CHANNEL)
    override fun start() {
        channel.setMethodCallHandler(this)

        if (isAvaliable(context)) {
            startPrinterService(null);
        }
    }

    override fun startPrinterService(result: MethodChannel.Result?) {
        result?.success(true)
    }

    override fun initPrinter(result: MethodChannel.Result?) {
        result?.success(true)
    }

    override fun printWrapPaper(n: Int, result: MethodChannel.Result?) {
        result?.success(true)
    }

    override fun printBitmap(bitmap: Bitmap, result: MethodChannel.Result?) {
        if (!StoneManager.isRunningInPOS(context)) {
            result?.error("101", "You can only run this in a POS", null)
            return;
        }

        if (StoneManager.currentUserList.isNullOrEmpty()) {
            result?.error("401", "You need to activate the terminal first", null)
            return;
        }

        val transactionProvider = PosPrintProvider(
            activity
        )

        processBitmapForPrint(bitmap) {
            transactionProvider.addBitmap(it)
        }

        transactionProvider.useDefaultUI(true)
        transactionProvider.dialogMessage = "Imprimindo comprovante..."
        transactionProvider.dialogTitle = "Aguarde"

        transactionProvider.connectionCallback = object : StoneActionCallback {
            override fun onSuccess() {
                result?.success(true)
            }

            override fun onError() {
                result?.error("405", "Generic Error - Transaction Failed [onError from Provider] - Check adb log output", null)
            }

            override fun onStatusChanged(action: Action?) {}
        }

        transactionProvider.execute()
    }

    override fun printHtml(htmlContent: String, result: MethodChannel.Result?) {
        if (!StoneManager.isRunningInPOS(context)) {
            result?.error("101", "You can only run this in a POS", null)
            return;
        }

        if (StoneManager.currentUserList.isNullOrEmpty()) {
            result?.error("401", "You need to activate the terminal first", null)
            return;
        }

        val transactionProvider = PosPrintProvider(
            activity
        )

        getBitmapFromHtml(htmlContent, context, {
            transactionProvider.addBitmap(it)
        }, {})

        transactionProvider.useDefaultUI(true)
        transactionProvider.dialogMessage = "Imprimindo comprovante..."
        transactionProvider.dialogTitle = "Aguarde"

        transactionProvider.connectionCallback = object : StoneActionCallback {
            override fun onSuccess() {
                result?.success(true)
            }

            override fun onError() {
                result?.error("405", "Generic Error - Transaction Failed [onError from Provider] - Check adb log output", null)
            }

            override fun onStatusChanged(action: Action?) {}
        }

        transactionProvider.execute()
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startPrinterService" -> {
                try {
                    startPrinterService(result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace.toString());
                }
            }
            "printBitmap" -> {
                try {
                    val bytes = call.argument<ByteArray>("image")!!
                    val computedBitmap: Bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.size)
                    printBitmap(computedBitmap, result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace.toString());
                }
            }
            "printWrapPaper" -> {
                try {
                    val lines = call.argument<Int>("lines")!!
                    printWrapPaper(lines, result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace.toString());
                }
            }
            "printHtml" -> {
                try {
                    val html = call.argument<String>("htmlContent")!!
                    printHtml(html, result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace.toString());
                }
            }
            "initPrinter" -> {
                try {
                    initPrinter(result)
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace.toString());
                }
            }
            "isAvaliable" -> {
                try {
                    result.success(isAvaliable(context))
                } catch (e: Exception) {
                    result.error("sdkError", e.message, e.stackTrace.toString());
                }
            }
            else -> result.notImplemented()
        }
    }

    companion object {
        fun isAvaliable(context: Context): Boolean {
            return StoneManager.isRunningInPOS(context)
        }

        private const val TAG: String = "StonePrinter"
        private const val CHANNEL = "br.com.stone/flutter_sdk/printer/stone"
    }
}