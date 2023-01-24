package br.com.stone.sdk_flutter.printers

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.content.ServiceConnection
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.os.Build
import android.os.IBinder
import android.os.RemoteException
import android.util.Log
import br.com.stone.sdk_flutter.helpers.StoneTransactionHelpers
import com.iposprinter.iposprinterservice.IPosPrinterService
import com.iposprinter.iposprinterservice.IPosPrinterCallback

internal class JicaiPrinter(private val applicationContext: Context) {
    private var mPrinterService: IPosPrinterService? = null
    private val mListener: PrinterManagerListener? = null
    private var mCallback: IPosPrinterCallback? = null

    interface PrinterManagerListener {
        fun onServiceConnected()
        fun onServiceDisconnected()
    }

    private val mConnectionService: ServiceConnection = object : ServiceConnection {
        override fun onServiceDisconnected(name: ComponentName) {
            this@JicaiPrinter.mPrinterService = null
            this@JicaiPrinter.mListener?.onServiceDisconnected()
        }

        override fun onServiceConnected(name: ComponentName, service: IBinder) {
            this@JicaiPrinter.mPrinterService = IPosPrinterService.Stub.asInterface(service)
            this@JicaiPrinter.mListener?.onServiceConnected()
        }
    }

    fun startPrinterService() {
        this.mCallback = object : IPosPrinterCallback.Stub() {
            override fun onReturnString(result: String) {
                Log.w(TAG, "onReturnString($result)")
            }

            override fun onRunResult(isSuccess: Boolean) {
                Log.i(TAG, "onComplete: $isSuccess")
            }
        }
        val intent = Intent()
        intent.setPackage("com.iposprinter.iposprinterservice")
        intent.action = "com.iposprinter.iposprinterservice.IPosPrintService"
        applicationContext.startService(intent)
        applicationContext.bindService(intent, mConnectionService, Context.BIND_AUTO_CREATE)
    }

    fun printText(text: String?) {
        try {
            mPrinterService!!.printText(text, mCallback)
        } catch (var3: java.lang.Exception) {
            Log.d(TAG, "Caiu no exception do MANAGER printText: " + var3.message)
        }
    }

    fun printBitmap(bitmap: Bitmap?) {
        try {
            mPrinterService!!.printBitmap(1, 10, bitmap, mCallback)
        } catch (var3: java.lang.Exception) {
            var3.printStackTrace()
        }
    }

    fun printWrapPaper(n: Int) {
        try {
            mPrinterService!!.printerFeedLines(n, mCallback)
        } catch (var3: java.lang.Exception) {
            var3.printStackTrace()
        }
    }

    fun printerInit() {
        try {
            mPrinterService!!.printerInit(mCallback)
        } catch (var2: java.lang.Exception) {
            var2.printStackTrace()
        }
    }

    companion object {
        fun isJicai(context: Context): Boolean {
            return try {
                val packageManager: PackageManager = context.packageManager

                packageManager.getPackageInfo(
                    iPosServicePkg, 0
                )

                true
            } catch (e: PackageManager.NameNotFoundException) {
                false
            }
        }

        private const val iPosServicePkg: String = "com.iposprinter.iposprinterservice"
        private const val TAG: String = "SunmiPrinter"
    }
}