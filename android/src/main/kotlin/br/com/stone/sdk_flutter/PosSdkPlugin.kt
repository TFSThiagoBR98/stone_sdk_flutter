package br.com.stone.sdk_flutter

import android.app.Activity
import android.content.Context
import android.webkit.WebView
import br.com.stone.sdk_flutter.printers.JicaiPrinter
import br.com.stone.sdk_flutter.printers.PositivoL3Printer
import br.com.stone.sdk_flutter.printers.StonePrinter
import br.com.stone.sdk_flutter.printers.SunmiPrinter
import br.com.stone.sdk_flutter.stone.StoneCodeManager
import br.com.stone.sdk_flutter.stone.StoneManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.BinaryMessenger
import stone.application.StoneStart
import stone.application.interfaces.StoneCallbackInterface
import stone.providers.ActiveApplicationProvider
import stone.user.UserModel
import stone.utils.Stone

/**
 * Flutter Stone SDK Plugin for Flutter
 *
 * Based on some code from https://github.com/EightSystems/react-native-stone-pos
 * Commit: 5108c3afb0a9095fff54c4e4248002eff49862b6
 */
class PosSdkPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private var binaryMessenger: BinaryMessenger? = null
    private var activity: Activity? = null

    private var stoneManager: StoneManager? = null;
    private var stoneCodeManager: StoneCodeManager? = null;
    private var printerJicai: JicaiPrinter? = null;
    private var printerPositivo: PositivoL3Printer? = null;
    private var printerStone: StonePrinter? = null;
    private var printerSunmi: SunmiPrinter? = null;

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext

        binaryMessenger = flutterPluginBinding.binaryMessenger
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        result.notImplemented()
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        binaryMessenger = null
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        stoneManager = StoneManager(context, binding.activity, binaryMessenger!!)
        stoneCodeManager = StoneCodeManager(context, binding.activity, binaryMessenger!!)

        // Printers
        printerJicai = JicaiPrinter(context, binaryMessenger!!)
        printerJicai?.start()
        printerPositivo = PositivoL3Printer(context, binaryMessenger!!)
        printerPositivo?.start()
        printerStone = StonePrinter(context, binding.activity, binaryMessenger!!)
        printerStone?.start()
        printerSunmi = SunmiPrinter(context, binaryMessenger!!)
        printerSunmi?.start()
    }

    override fun onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        activity = null
        stoneManager = null
        stoneCodeManager = null
        printerJicai = null
        printerPositivo = null
        printerStone = null
        printerSunmi = null
    }

    companion object {
        private const val TAG: String = "PosPlugin"
        private const val CHANNEL = "br.com.stone/flutter_sdk"
    }
}
